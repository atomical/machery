require 'machery'

address = 0x10931D36E

while 1
  p Machery.read(2291, address, 2000)

end
