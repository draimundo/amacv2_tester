#include "AMACTB.h"
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>
int main(){
	
	bool stop = false;
	float M1, M2, M3, M4, M5, M6, M7;
	const uint16_t res = 0xFFFF;
	std::vector<unsigned int> ret;
	std::cout << "Current measurement program" << std::endl;
	AMACTB TB;
	
	TB.powerOff();
	std::cout << "Power off" << std::endl;
	usleep(1E6); // 1s wait for a clear power up
	TB.powerOn();
	TB.setDAC(TB.VDDHI_ADJ, 1.2);
	TB.setDAC(TB.VDD1V2_ADJ, 1.2);
	std::cout << "Power on" << std::endl;
	
	TB.FRQ.reset("CLKOUT");
	TB.FRQ.start("CLKOUT");
	TB.ADC0.setNextConversion(TB.M1.chanNbr, TB.M1.adcChanSpan);
	while(!stop){
		
		TB.FRQ.read("CLKOUT");
		usleep(1E6); //1s wait for conv and display
		ret = TB.ADC0.setNextConversion(TB.M2.chanNbr, TB.M2.adcChanSpan);
		M1 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M3.chanNbr, TB.M3.adcChanSpan);
		M2 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M4.chanNbr, TB.M4.adcChanSpan);
		M3 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M5.chanNbr, TB.M5.adcChanSpan);
		M4 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M5.chanNbr, TB.M6.adcChanSpan);
		M5 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M5.chanNbr, TB.M7.adcChanSpan);
		M6 = ((float)ret.front()/res)*5; //scale to full range
		
		usleep(10E3); //10ms wait for conv
		ret = TB.ADC0.setNextConversion(TB.M5.chanNbr, TB.M1.adcChanSpan);
		M7 = ((float)ret.front()/res)*5; //scale to full range
		
		
		std::cout << "AM_VDDLR voltage: " << (M3) << "V" << std::endl;
		std::cout << "AM_VDDLR current: " << (M2-M3) << "A" << std::endl;
		
		std::cout << "AM_VDCDC voltage: " << (M5) << "V" << std::endl;
		std::cout << "AM_VDCDC current: " << (M4-M5) << "A" << std::endl;
		
		std::cout << "AM_VDD_HI voltage: " << (M7) << "V" << std::endl;
		std::cout << "AM_VDD_HI current: " << (M6-M7) << "A" << std::endl;
		
		std::cout << "Measured CLKOUT frequency: " << TB.FRQ.get_frq("CLKOUT") << "Hz" << std::endl;

	}
	
	return 0;
}