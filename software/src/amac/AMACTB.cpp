#include <iostream>
#include <iomanip>

#include "AMACTB.h"

AMACTB::AMACTB(std::shared_ptr<DeviceCom> uio) : m_uio(uio){
	this->powerOn();
}

AMACTB::~AMACTB()
{ }

void AMACTB::powerOn(){ //active = working (NOT off/low power)
	this->setIO(this->LD_EN_VDDRL,true);		//LT3022, active high
	this->setIO(this->LV_EN_2V5,true);			//LT3092, active high
	this->setIO(this->LV_EN_VP5,true);			//LT3092, active high
	this->setIO(this->LV_EN_VN5,true); 			//LT3015 for VEE5, active high
	this->setIO(this->LV_EN_AVDD5,true);		//LT3092, active high
	this->setIO(this->LV_EN_AVEE,true); 		//LT3015, active high
	this->setIO(this->LV_EN_AVCC,true);			//LT3092, active high
	this->setIO(this->LD_EN_VDCDC,true);		//LT3022, active high
	this->setIO(this->LVL_TRANS_EN,false); 		//sn74avc8t245, active low
	this->setIO(this->MPM_MUX_EN,true);			//ADG1608, active high
	this->setIO(this->HVSW_MUX_EN,true);		//ADG1609, active high
	//this->setIO(this->FPGA_EFUSE_PULSE,true);	//Not implemented func?

}

void AMACTB::powerOff(){
	this->setIO(this->LD_EN_VDDRL,~true);		//LT3022, active high
	this->setIO(this->LV_EN_2V5,~true);			//LT3092, active high
	this->setIO(this->LV_EN_VP5,~true);			//LT3092, active high
	this->setIO(this->LV_EN_VN5,~true); 			//LT3015 for VEE5, active high
	this->setIO(this->LV_EN_AVDD5,~true);		//LT3092, active high
	this->setIO(this->LV_EN_AVEE,~true); 		//LT3015, active high
	this->setIO(this->LV_EN_AVCC,~true);			//LT3092, active high
	this->setIO(this->LD_EN_VDCDC,~true);		//LT3022, active high
	this->setIO(this->LVL_TRANS_EN,~false); 		//sn74avc8t245, active low
	this->setIO(this->MPM_MUX_EN,~true);			//ADG1608, active high
	this->setIO(this->HVSW_MUX_EN,~true);		//ADG1609, active high
}

void AMACTB::selHVrefChannel(HVref_t sel){
	this->setIO(this->HVref_HGND_SW,(sel == HVref_t::HVref)?false:true); //could have directly used the enum
}

void AMACTB::selHVretChannel(HVret_t sel){
	this->setIO(this->HVret_SW,(sel == HVret_t::HVret1)?false:true);	
}

void AMACTB::selMUXChannel(mux_t mux_sel){
	uint32_t mux_data = m_uio->read_reg(0x2);
	uint32_t mask = MUX_SEL2.bit | MUX_SEL1.bit | MUX_SEL0.bit;
	uint8_t val = 0;
	switch(mux_sel){
		case HVCtrl0:
		case AVCC: val = 0; 
			break;
		case HVCtrl1:
		case AVDD5: val = 1; 
			break;
		case HVCtrl2:
		case VCC5: val = 2; 
			break;
		case HVCtrl3:
		case VDD2V5: val = 3; 
			break;
		case AVEE: val = 4; 
			break;
		case VEE5: val = 5; 
			break;
		case VDD1V2: val = 6; 
			break;
		default: val = 0;
	}
	mux_data = (mux_data & ~mask) | (val << MUX_SEL0.bit); // supposing the 3 stay grouped
	m_uio->write_reg(MUX_SEL0.reg, mux_data);	
}

void AMACTB::setIO(io_t pin, bool value){
	if(pin.dir != OUT){
		std::cout << "Pin direction error, not OUT" << std::endl;
		return;
	}
	uint32_t data = m_uio->read_reg(pin.reg); 
	uint32_t mask = (uint32_t)(1 << pin.bit);
	data = (data & ~mask) | (value << pin.bit);
	m_uio->write_reg(pin.reg, data);
}

void AMACTB::setIO(uint8_t reg, uint32_t regOffset, bool value){
	uint32_t data = m_uio->read_reg(reg);
	data = (data & ~regOffset) | ((uint32_t) value * regOffset);
	m_uio->write_reg(reg, data);
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

bool AMACTB::readIO(uint8_t reg, uint32_t regOffset){
	uint32_t data = m_uio->read_reg(regOffset);
	return (bool)(data & regOffset);
}