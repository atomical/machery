require 'machery'

address = 0x10931D36E

while 1
  Machery.read(2291, address, 1048576)
  sleep 0.05
  p 1
end
