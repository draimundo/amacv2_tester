#include "AMACTB.h"

#include "EndeavourComException.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main()
{
  AMACTB TB;

  // Power on
  TB.powerOn();
  usleep(1E6); // 1s wait for a clean power up
  std::cout << "Power ON" << std::endl;

  // Configure I/O pads
  TB.setIDPads(0x1F);
  TB.setIO(TB.ResetB, true);

  // Power on AMAC
  TB.powerAMACOn();
  std::cout << "AMAC ON" << std::endl;
  usleep(1E6);

  // Set ID
  TB.END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
  std::cout << "SETID" << std::endl;
  usleep(1E6);

  // BER loop
  uint good=0;
  uint total=100000;
  for(uint i=0; i<total; i++)
    {
      try
	{      
	  uint valin=rand()*0xFFFFFFFF;
	  TB.END.write_reg(166,valin);
	  usleep(1e3);
	  uint valout=TB.END.read_reg(166);
	  usleep(1e3);
	  if(valin==valout)
	    {
	      good++;
	    }
	  else
	    {
	      std::cout << "Write: 0x" << std::hex << valin << ", Read: " << valout << std::dec << std::endl;
	    }
	}
      catch(EndeavourComException e)
	{
	  std::cout << "EndeavourComException" << std::endl;
	  std::cout << e.what() << std::endl;
	}
    }

  std::cout << "Reliability: " << ((float)good)/total << std::endl;

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
