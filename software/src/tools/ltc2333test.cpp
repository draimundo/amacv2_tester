#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>
#include <vector>

#include "SPICom.h"
#include "LTC2333.h"
#include "ComIOException.h"

int main(int argc, char* argv[])
{
  std::string device="/dev/spidev1.0";

  try
    {
      // Create the communication object
      std::shared_ptr<DeviceCom> dev=std::make_shared<SPICom>(device);

      std::cout << "about to create LTC2333" << std::endl;
      std::shared_ptr<LTC2333> ltc = std::make_shared<LTC2333>(dev);

      sleep(5);
      std::cout << "about to setNextConversion(4, 3)" << std::endl;
      ltc->setNextConversion(0x4,0x3);

      /*sleep(5);
      std::cout << "about to turn off chan 3" << std::endl;
      ltc->powerDownChan(0x3);*/

    }
  catch(ComIOException e)
    {
      std::cout << e.what() << std::endl;
    }

  return 0;
}
