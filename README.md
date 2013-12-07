robotic-arm-driver
==================

Robotic arm driver written in Ruby, for the Maplin Robotic Arm (http://www.maplin.co.uk/p/robotic-arm-kit-with-usb-pc-interface-a37jn).

## Installation for Raspberry Pi
    git clone git@github.com:AaronRandall/robotic-arm-driver.git
    cd robotic-arm-driver
    bundle install

    sudo vi /etc/udev/rules.d/85-robotarm.rules 

and add: 

    SUBSYSTEM=="usb", ATTRS{idVendor}=="1267", ATTRS{idProduct}=="0000", ACTION=="add", GROUP="plugdev", MODE="0666"

    sudo usermod -aG plugdev pi

reboot the pi

## Example usage
require 'robotic_arm'

arm = RoboticArm.new

arm.perform_action(RoboticArm::BASE_LEFT, 1)
arm.perform_action(RoboticArm::BASE_RIGHT, 1)

arm.close
