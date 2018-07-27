#include <iostream>
#include <iomanip>
#include <unistd.h>

#include "UIOCom.h"
#include "FreqMeas.h"

#define FCLK 100E6

int main(){
	std::cout << "Hello world!" << std::endl;
  std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio2", 0x10000);
	FreqMeas dev (uio, FCLK);
	
	std::cout << "Running reset" << std::endl;
	dev.reset("HVOSC0");
	
	std::cout << "Starting measurments" << std::endl;
	dev.start("HVOSC0");
	dev.read("HVOSC0");
	while(true){
		dev.freeze("HVOSC0", false);
		usleep(2E6);
		std::cout << "\nhi_n " << dev.get_hi_n("HVOSC0") << std::endl;
		std::cout << "lo_n " << dev.get_lo_n("HVOSC0") << std::endl;
		std::cout << "hi_t " << dev.get_hi_t("HVOSC0") << std::endl;

		std::cout << "Measured frequency: " << dev.get_frq("HVOSC0") << "Hz" << std::endl;

		dev.freeze("HVOSC0");
		dev.read("HVOSC0");
	}
	
	
	return 0;
}
