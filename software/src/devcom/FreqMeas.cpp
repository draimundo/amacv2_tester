#include "FreqMeas.h"

void FreqMeasInst::init_inst(std::shared_ptr<DeviceCom> dev, uint8_t id, uint32_t ts_cnt){
	m_dev = dev;
	m_id = id;
	this->reset_inst();
	this->freeze_inst();
	this->set_ts_cnt_inst(ts_cnt);
	this->start_inst();
}

void FreqMeasInst::reset_inst(bool active){
	uint32_t data = m_dev->read_reg(4*m_id);
	data = (data & 0x7FFFFFFF) | ((uint32_t)~active << 31); //reset active low in FW
	m_dev->write_reg((4*m_id), data);
}

void FreqMeasInst::freeze_inst(bool active){
	uint32_t data = m_dev->read_reg(4*m_id);
	data = (data & 0xBFFFFFFF) | ((uint32_t)active << 30);
	m_dev->write_reg((4*m_id), data);
}

void FreqMeasInst::start_inst(){
	this->reset_inst(false);
	this->freeze_inst(false);
}

void FreqMeasInst::set_ts_cnt_inst(uint32_t ts_cnt){
	uint32_t data = m_dev->read_reg(4*m_id);
	data = (data & 0xC0000000) | (ts_cnt & 0x3FFFFFFF);
	m_dev->write_reg((4*m_id), data);
}

void FreqMeasInst::read_inst(){
  m_hi_n = m_dev->read_reg(4*m_id+1);
  m_lo_n = m_dev->read_reg(4*m_id+2);
  m_hi_t = m_dev->read_reg(4*m_id+3);
}

uint32_t FreqMeasInst::get_ts_cnt_inst(){
  uint32_t data = m_dev->read_reg(3*m_id);
 return(data & 0x3FFFFFFF);
}

void FreqMeas::init(){
	HVOSC0.init_inst(m_dev, 0); regMap["HVOSC0"] = &FreqMeas::HVOSC0;
	HVOSC1.init_inst(m_dev, 1); regMap["HVOSC1"] = &FreqMeas::HVOSC1;
	HVOSC2.init_inst(m_dev, 2); regMap["HVOSC2"] = &FreqMeas::HVOSC2;
	HVOSC3.init_inst(m_dev, 3); regMap["HVOSC3"] = &FreqMeas::HVOSC3;
	CLKOUT.init_inst(m_dev, 4); regMap["CLKOUT"] = &FreqMeas::CLKOUT;
}

