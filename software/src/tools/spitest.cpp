#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>

#include "SPICom.h"
#include "ComIOException.h"

int main(int argc, char* argv[])
{
  std::string device="/dev/spidev1.0";

  try
    {
      // Create the communication object
      std::shared_ptr<DeviceCom> dev=std::make_shared<SPICom>(device);

      std::cout << std::hex << "0x" << dev->read_reg(0xD0) << std::dec << std::endl;
    }
  catch(ComIOException e)
    {
      std::cout << e.what() << std::endl;
    }

  return 0;
}
