#include <iostream>
#include <iomanip>

#include "UIOCom.h"
#include "AMACTB.h"
#include <unistd.h>

int main()
{
  std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio0", 0x10000);
  AMACTB TB (uio);


  // Power testbench
  TB.powerOn();
  std::cout << "Power on" << std::endl;

  // Configure I/O pads
  TB.setIDPads(0x1F);
  TB.setIO(TB.ResetB, true);

  // Power on AMAC
  TB.powerAMACOn();

  return 0;
}
