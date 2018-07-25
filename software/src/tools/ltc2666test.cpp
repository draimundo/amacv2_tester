#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>
#include <vector>
#include <cstdlib>

#include "DeviceCom.h"
#include "LTC2666.h"
#include "ComIOException.h"

int main(int argc, char* argv[])
{

  if(argc < 3){
    std::cerr << "not enough args! Expectd: device_name, channel_num, voltage_value" << std::endl;
  }

  // DAC1: "/dev/spidev1.3"
  // DAC2: "/dev/spidev1.4"
  std::string device=argv[1];

  try
    {
      // Create the communication object
      std::shared_ptr<DeviceCom> dev=std::make_shared<SPICom>(device);

      std::cout << "about to create LTC2666" << std::endl;
      std::shared_ptr<LTC2666> ltc = std::make_shared<LTC2666>(dev);

      ltc->init();
      ltc->changeSpanAll(0); // 0V - 5V

      int chan = std::stoul(argv[2],nullptr,16);
      float value = std::stof(argv[3],nullptr);

      // Max counts is 0xFFFF (65535)
      int counts = (value / 5) * 65535;

      ltc->writeUpdateChan(chan, counts);

      std::cout << "writeUpdateChan to device " << device << " for chan " << std::hex << chan << " with counts " << std::hex << counts << " which is " << value << "V" << std::endl;


    }
  catch(ComIOException e)
    {
      std::cout << e.what() << std::endl;
    }

  return 0;
}

