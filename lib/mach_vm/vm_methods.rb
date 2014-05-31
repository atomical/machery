module Machery
  extend FFI::Library
  extend Inliner

  inline '
    #include <stdio.h>
    #include <stdlib.h>
    #include <mach/mach.h>
    #include <mach/mach_vm.h>
    void * c_mach_vm_read( int pid , uint64_t address, int len) {

      kern_return_t          kr;
      mach_port_t            target_task;
      vm_offset_t            local_address;
      mach_msg_type_number_t local_size = vm_page_size;
      mach_vm_size_t         size = (mach_vm_size_t)vm_page_size;

      kr = task_for_pid(mach_task_self(), pid, &target_task);

      if ( kr != 0 ){
        return NULL;
      }

      kr = mach_vm_read(target_task, address, size,  &local_address, &local_size);

      if ( kr != 0 ){
        return NULL;
      }

      void * bytes = (void *)malloc(local_size * 2 * sizeof(char));
      memcpy(bytes, ( const void *)local_address, local_size);
      mach_vm_deallocate(mach_task_self(), address, local_size);
      
      return bytes;
    }
 '

  PAGE_SIZE = 4096
  
  attach_function :free, [:pointer], :void

  def self.read( pid, address, len )
    bottom     = page_down( address )
    top        = page_align_up(address + len)
    new_length = top - bottom

    byte_ptr   = c_mach_vm_read(pid, bottom, new_length)
    
    return nil if byte_ptr.null?
    
    ret = byte_ptr.read_string(new_length)[address - bottom..-1]
    free(byte_ptr)
    ret
  end

  def self.page_down( address )
    ((address)&(~((PAGE_SIZE)-1)))
  end

  def self.page_align_up( address )
    (((address)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)));
  end

end