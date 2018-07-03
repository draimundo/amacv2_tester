#include <iostream>
#include <iomanip>

#include "AMACTB.h"

AMACTB::AMACTB(std::shared_ptr<DeviceCom> uio) : m_uio(uio){
	this->powerOn();
}

AMACTB::~AMACTB()
{ }

void AMACTB::powerOn(){
	
}

void AMACTB::powerOff()
{ }

void AMACTB::setIO(io_t pin, bool value){
	if(pin.dir != OUT){
		std::cout << "Pin direction error, not OUT" << std::endl;
		return;
	}
	uint32_t data = m_uio->read_reg(pin.reg);
	uint32_t mask = (uint32_t)(1 << pin.bit);
	data = (data & ~mask) | (data << pin.bit);
	m_uio->write_reg(pin.reg, data);
}

bool AMACTB::readIO(io_t pin){
	if(pin.dir != IN){
		std::cout << "Pin direction error, not IN" << std::endl;
		return false;
	}
	uint32_t data = m_uio->read_reg(pin.reg);
	uint32_t mask = (uint32_t)(1 << pin.bit);
	return (bool)((data & mask) >> pin.bit);
}
