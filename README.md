robotic-arm-driver
==================

Robotic arm driver written in Ruby.

Install:
git clone git@github.com:AaronRandall/robotic-arm-driver.git
cd robotic-arm-driver
bundle install

sudo vi /etc/udev/rules.d/85-robotarm.rules 
and add: 

  SUBSYSTEM=="usb", ATTRS{idVendor}=="1267", ATTRS{idProduct}=="0000", ACTION=="add", GROUP="plugdev", MODE="0666"

sudo usermod -aG plugdev pi

reboot the pi
