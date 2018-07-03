#include "AMACTB.h"
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main(){
	AMACTB TB;
	
	TB.powerOff();
	std::cout << "Power off" << std::endl;
	usleep(1E6); // 1s wait for a clean power down
	
//POWER ON
	TB.powerOn();
	usleep(1E6); // 1s wait for a clean power up
	std::cout << "Power on" << std::endl;
	
//SETID
	TB.END.setid(EndeavourCom::REFMODE::IDPads, 0x01);
	usleep(1E6); // 1s wait for a clear send
	
//POWER OFF
	TB.powerOff();
	std::cout << "Power off" << std::endl;
	usleep(1E6); // 1s wait for a clean power down

return 0;
}