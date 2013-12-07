require 'libusb'

puts "STARTING"

usb = LIBUSB::Context.new

# Generic constant
off = 0x00

# First byte
gripClose = 0x01
gripOpen = 0x02
wristUp = 0x04
wristDown = 0x08
elbowUp = 0x10
elbowDown = 0x20
shoulderUp = 0x40
shoulderDown = 0x80

# Second byte
baseRight = 0x01
baseLeft = 0x02

# Third byte
ledOff = 0x00
ledOn = 0x01

# Get the device object
arm = nil
arm = usb.devices(:idVendor => 0x1267, :idProduct => 0x0000).first

puts "arm=#{arm.inspect}"

if arm == nil
  puts "Arm not found!"
  exit
end

# Take control of the device
handle = arm.open
handle.claim_interface(0)

# Send the signal to start rotating the base right (clockwise)
datapack=[off,off,ledOn]
handle.control_transfer(:bmRequestType => 0x40, :bRequest => 6, :wValue => 0x100, :wIndex => 0, :dataOut => datapack.pack('CCC'), :timeout => 1000)

# Wait for a secnd while the arm moves
sleep(1)

# Send the stop signal
datapack=[off,off,ledOff]
handle.control_transfer(:bmRequestType => 0x40, :bRequest => 6, :wValue => 0x100, :wIndex => 0, :dataOut => datapack.pack('CCC'), :timeout => 1000)


sleep(1)

# Send the signal to start rotating the base right (clockwise)
datapack=[off,off,ledOn]
handle.control_transfer(:bmRequestType => 0x40, :bRequest => 6, :wValue => 0x100, :wIndex => 0, :dataOut => datapack.pack('CCC'), :timeout => 1000)

# Wait for a secnd while the arm moves
sleep(1)

# Send the stop signal
datapack=[off,off,ledOff]
handle.control_transfer(:bmRequestType => 0x40, :bRequest => 6, :wValue => 0x100, :wIndex => 0, :dataOut => datapack.pack('CCC'), :timeout => 1000)



# Release the device
handle.release_interface(0)
