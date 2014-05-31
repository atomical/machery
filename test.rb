require 'mach_vm'

address = 0x73AD
# address = 0x6A0F
address = 0x1000
address = 0x10931D36E

# p Machery.read(address,2000, 1590)


# module Inliner
#   C_TO_FFI = {
#       'void' => :void,
#       'char' => :char,
#       'unsigned char' => :uchar,
#       'int' => :int,
#       'unsigned int' => :uint,
#       'long' => :long,
#       'unsigned long' => :ulong,
#       'float' => :float,
#       'double' => :double,
#       'uint64_t' => :uint64,
#     }
# end

while 1
  p Machery.read(2291, address, 2000)

end