require 'test_helper'

class SimCtl::Command::ReadmeTest < Minitest::Test
  should 'execute example code from readme' do
    # Select the iOS 9.2 runtime
    runtime = SimCtl.runtime(name: 'iOS 9.2')

    # Select the iPhone 5 device type
    devicetype = SimCtl.devicetype(name: 'iPhone 5')

    # Create a new device
    device = SimCtl.create_device 'Unit Tests @ iPhone 5 9.2', devicetype, runtime

    # Launch a new Simulator.app instance
    device.launch!

    # Wait for the device to be booted
    device.wait! {|d| d.state == :booted}

    # Kill the Simulator.app instance again
    device.shutdown!
    device.kill!

    # Wait until it did shutdown
    device.wait! {|d| d.state == :shutdown}

    # Delete the device
    device.delete!
  end
end
