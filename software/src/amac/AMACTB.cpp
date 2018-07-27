#include <iostream>
#include <iomanip>

#include "AMACTB.h"
 
AMACTB::AMACTB(	std::shared_ptr<DeviceCom> dio,
		std::shared_ptr<DeviceCom> end,
		std::shared_ptr<DeviceCom> dac0,
		std::shared_ptr<DeviceCom> dac1,
		std::shared_ptr<DeviceCom> adc0,
		std::shared_ptr<DeviceCom> adc1,
		std::shared_ptr<DeviceCom> adc2,
		std::shared_ptr<DeviceCom> pot0,
		std::shared_ptr<DeviceCom> pot1,
		std::shared_ptr<DeviceCom> pot2,
		std::shared_ptr<DeviceCom> frq)
  : m_dio(dio), END(0x1F, end),
    DAC0(dac0), DAC1(dac1), ADC0(adc0), ADC1(adc1), ADC2(adc2), POT0(pot0), POT1(pot1), POT2(pot2),
    FRQ(frq)
{

}



AMACTB::~AMACTB()
{ }

void AMACTB::powerOn()
{ //active = working (NOT off/low power)
  this->setIO(this->LV_EN_2V5,true);	        //LT3092, active high
  this->setIO(this->LV_EN_VP5,true);		//LT3092, active high
  this->setIO(this->LV_EN_VN5,true); 		//LT3015 for VEE5, active high
  this->setIO(this->LV_EN_AVDD5,true);		//LT3092, active high
  this->setIO(this->LV_EN_AVEE,true); 		//LT3015, active high
  this->setIO(this->LV_EN_AVCC,true);		//LT3092, active high
  this->setIO(this->LVL_TRANS_EN,false); 	//sn74avc8t245, active low
  this->setIO(this->MPM_MUX_EN,true);		//ADG1608, active high
  this->setIO(this->HVSW_MUX_EN,true);		//ADG1609, active high
  //this->setIO(this->FPGA_EFUSE_PULSE,true);	//Not implemented func?
}

void AMACTB::powerOff()
{
  this->setIO(this->LD_EN_VDDRL,false);		//LT3022, active high
  this->setIO(this->LV_EN_2V5,false);		//LT3092, active high
  this->setIO(this->LV_EN_VP5,false);		//LT3092, active high
  this->setIO(this->LV_EN_VN5,false); 		//LT3015 for VEE5, active high
  this->setIO(this->LV_EN_AVDD5,false);		//LT3092, active high
  this->setIO(this->LV_EN_AVEE,false); 		//LT3015, active high
  this->setIO(this->LV_EN_AVCC,false);		//LT3092, active high
  this->setIO(this->LD_EN_VDCDC,false);		//LT3022, active high
  this->setIO(this->LVL_TRANS_EN,true); 	//sn74avc8t245, active low
  this->setIO(this->MPM_MUX_EN,false);		//ADG1608, active high
  this->setIO(this->HVSW_MUX_EN,false);		//ADG1609, active high
}

void AMACTB::powerAMACOn()
{
  setIO(LD_EN_VDDRL,true);		// AMAC LDO
  setIO(LD_EN_VDCDC,true);		// AMAC DCDC
  setDAC(VDD1V2_ADJ, 1.2);                   // Enable level shifter after AMAC is powered on
}

void AMACTB::powerAMACOff()
{
  setDAC(VDD1V2_ADJ, 0);                   // Enable level shifter after AMAC is powered on
  setIO(LD_EN_VDDRL,false);		// AMAC LDO
  setIO(LD_EN_VDCDC,false);		// AMAC DCDC
}

void AMACTB::selHVrefChannel(HVref_t sel){
  this->setIO(this->HVref_HGND_SW,(sel == HVref_t::HVref)?false:true); //could have directly used the enum
}

void AMACTB::selHVretChannel(HVret_t sel){
  this->setIO(this->HVret_SW,(sel == HVret_t::HVret1)?false:true);	
}

void AMACTB::selMUXChannel(mux_t mux_sel){
	uint32_t mux_data = m_dio->read_reg(0x2);
	uint32_t mask = (1 << MUX_SEL2.bit) | (1 << MUX_SEL1.bit) | (1 << MUX_SEL0.bit);
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
	mux_data = (mux_data & ~mask) | (val << MUX_SEL0.bit); // supposing the 3 stay grouped in future implementations
	m_dio->write_reg(MUX_SEL0.reg, mux_data);	
}

void AMACTB::setIO(io_t pin, bool value){
	if(pin.dir != OUT){
		std::cout << "Pin direction error, not OUT" << std::endl;
		return;
	}
	uint32_t data = m_dio->read_reg(pin.reg); 
	uint32_t mask = (uint32_t)(1 << pin.bit);
	data = (data & ~mask) | (value << pin.bit);
	m_dio->write_reg(pin.reg, data);
}

void AMACTB::setIO(uint8_t reg, uint32_t regOffset, bool value){
	uint32_t data = m_dio->read_reg(reg);
	data = (data & ~regOffset) | ((uint32_t) value * regOffset);
	m_dio->write_reg(reg, data);
}

bool AMACTB::readIO(io_t pin){
	if(pin.dir != IN){
		std::cout << "Pin direction error, not IN" << std::endl;
		return false;
	}
	uint32_t data = m_dio->read_reg(pin.reg);
	uint32_t mask = (uint32_t)(1 << pin.bit);
	return (bool)((data & mask) >> pin.bit);
}

bool AMACTB::readIO(uint8_t reg, uint32_t regOffset){
	uint32_t data = m_dio->read_reg(regOffset);
	return (bool)(data & regOffset);
}

void AMACTB::setDAC(dac_t pin, float voltage){
  // if(voltage > pin.chanMax){
  //   std::cout << "Overvoltage, channel max is " << pin.chanMax << "V, while set voltage is " << voltage << "V."  << std::endl;
  //   return;
  // } else if(voltage > pin.chanMax){
  //   std::cout << "Undervoltage, channel min is " << pin.chanMin << "V, while set voltage is " << voltage << "V."  << std::endl;
  //   return;
  // }
  float adj_voltage = voltage / pin.mult_fac; //adjust to voltage divider
  //std::cout << "adj_voltage = " << adj_voltage << std::endl;
  uint16_t counts;
  switch(pin.dacChanSpan){
  case p5V :
    counts = (adj_voltage/5) * DAC_FSR;
    break;
  case p10V :
    counts = (adj_voltage/10) * DAC_FSR;
    std::cout << "+10V Range not supported yet"  << std::endl;
    return;
  case pm5V :
    counts = (adj_voltage + 5)/10 * DAC_FSR;
    std::cout << "+-5V Range not supported yet"  << std::endl;
    return;
  case pm10V :
    counts = (adj_voltage + 10)/20 * DAC_FSR;
    std::cout << "+-10V Range not supported yet"  << std::endl;
    return;
  case pm2_5V :
    counts = (adj_voltage + 2.5)/5 * DAC_FSR;
    std::cout << "+-2.5V Range not supported yet"  << std::endl;
    return;
  default:
    break;
  }
  std::cout << "counts = " << counts << std::endl;
  pin.DAC->writeUpdateChan(pin.chanNbr, counts);	
  return;
}

void AMACTB::setIDPads(uint8_t id){
  setIO(ID0,(id>>0)&1);
  setIO(ID1,(id>>1)&1);
  setIO(ID2,(id>>2)&1);
  setIO(ID3,(id>>3)&1);
  setIO(ID4,(id>>4)&1);
}

float AMACTB::getADC(adc_t pin){
  if(pin.mux != NOMUX){
    selMUXChannel(pin.mux);
    setIO(ADC_CNV, true);
  }
  
  uint16_t res = pin.ADC->setAndReadChan(pin.chanNbr, pin.adcChanSpan).result;
  float ret;
  switch(pin.adcChanSpan){
    case p1_25div:
      ret = ((float)res)*1.25/1.024;
      break;
    case p1_25:
      ret = ((float)res)*1.25;
      break;
    case pm1_25div:
      ret = ((float)((int16_t)res))*2.5/1.024;
      break;
    case pm1_25:
      ret = ((float)((int16_t)res))*2.5;
      break;
    case p2_5div:
      ret = ((float)res)*2.5/1.024;
      break;
    case p2_5:
      ret = ((float)res)*2.5;
      break;
    case pm2_5div:
      ret = ((float)((int16_t)res))*5.0/1.024;
      break;
    case pm2_5:
      ret = ((float)((int16_t)res))*5.0;
      break;
    default:
      break;
  }
  if(pin.mux != NOMUX) setIO(ADC_CNV, false);
  return (ret / ADC_FSR * ADC_REFBUF / pin.mult_fac); // scale result
}

