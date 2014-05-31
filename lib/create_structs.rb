require "ffi_gen"

FFIGen.generate(
  module_name: "Machery",
  ffi_lib:     "clang",
  headers:     ["/usr/include/mach/mach_vm.h"],
  cflags:      `llvm-config --cflags`.split(" "),
  prefixes:    ["clang_", "CX"],
  output:      "clang-c/index.rb"
)