#include "AD5160.h"

#include <iostream>
#include <iomanip>

AD5160::AD5160(std::shared_ptr<DeviceCom> dev) : m_dev(dev){
	this->setResistance(m_regMax);
}

AD5160::~AD5160(){
}

void AD5160::setResistance(uint8_t regVal){
	if(regVal > m_regMax){
		std::cout << "AD5160::setResistance ERROR regVal is" << std::hex << regVal << ", but regMax is" << std::hex << m_regMax << std::endl;
		std::cout << "Exiting setResistance" << std::endl;
		return;
	} else if(regVal < m_regMin){
		std::cout << "AD5160::setResistance ERROR regVal is" << std::hex << regVal << ", but regMin is" << std::hex << m_regMin << std::endl;
		std::cout << "Exiting setResistance" << std::endl;
		return;	
	}
	m_regVal = regVal;
	m_dev->write_data(m_regVal);
}

uint8_t AD5160::getResistance(){
	return m_regVal;
}