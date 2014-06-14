require 'ffi'
require 'ffi-inliner'

module Inliner

  C_TO_FFI = {
    'void' => :void,
    'char' => :char,
    'unsigned char' => :uchar,
    'int' => :int,
    'unsigned int' => :uint,
    'long' => :long,
    'unsigned long' => :ulong,
    'float' => :float,
    'uint64_t' => :uint64,
  }
end

require 'machery/version'
require 'machery/vm_methods'

module Machery
  # Your code goes here...
end
