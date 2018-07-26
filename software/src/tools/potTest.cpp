#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>
#include <vector>

#include "SPICom.h"
#include "AD5160.h"
#include "ComIOException.h"
#include "AMACTB.h"
#include <time.h>

int main(int argc, char* argv[])
{

  try
  {
    AMACTB tb;

    tb.powerOn();
    tb.powerAMACOn();

    for (float i = 100; i < 100e3; i+=5000){
      sleep(3);
      tb.POT2.setResistance(i);
    }

  }
  catch(ComIOException e){
    std::cout << "caught" << std::endl;
    std::cout << "errno = " << errno << std::endl;
    std::cout << e.what() << std::endl;
  }
  catch(...){
    std::cout << "caught something" << std::endl;
  }
  return 0;
}
