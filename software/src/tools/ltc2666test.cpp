#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>
#include <vector>

#include "SPICom.h"
#include "LTC2666.h"
#include "ComIOException.h"

int main(int argc, char* argv[])
{
  std::string device="/dev/spidev1.0";

  try
    {
      // Create the communication object
      std::shared_ptr<SPICom> dev=std::make_shared<SPICom>(device);

      std::cout << "about to create LTC2666" << std::endl;
      std::shared_ptr<LTC2666> ltc = std::make_shared<LTC2666>(dev.get());

      sleep(5);
      std::cout << "about to write chan 4 with FF00 counts" << std::endl;
      ltc->writeUpdateChan(0x4,0xFF00);

      sleep(5);
      std::cout << "about to write chan 3 with FFFF counts" << std::endl;
      ltc->writeUpdateChan(0x3,0xFFFF);

      sleep(5);
      std::cout << "about to point MUX at chan 4" << std::endl;
      ltc->pointMuxAtChan(0x4);

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
