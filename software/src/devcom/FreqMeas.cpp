#include <iostream>
#include <iomanip>
#include "FreqMeas.h"

FreqMeas::FreqMeas(std::shared_ptr<DeviceCom> dev, uint8_t id, uint32_t ts_cnt) : m_id(id), m_dev(dev){
	this->reset();
	this->freeze();
	this->set_ts_cnt(ts_cnt);
	this->start();
}

FreqMeas::~FreqMeas(){
}

void FreqMeas::reset(bool active){
    uint32_t data = m_dev->read_reg(3*m_id);
    data = (data & 0x7FFFFFFF) | ((uint32_t)~active << 31); //reset active low in FW
    m_dev->write_reg((3*m_id), data);
}

void FreqMeas::freeze(bool active){
    uint32_t data = m_dev->read_reg(3*m_id);
    data = (data & 0xBFFFFFFF) | ((uint32_t)active << 30);
    m_dev->write_reg((3*m_id), data);
}

void FreqMeas::start(){
    this->reset(false);
    this->freeze(false);
}

void FreqMeas::set_ts_cnt(uint32_t ts_cnt){
    uint32_t data = m_dev->read_reg(3*m_id);
    data = (data & 0xC0000000) | (ts_cnt & 0x3FFFFFFF); //reset active low in FW
    m_dev->write_reg((3*m_id), data);
}

void FreqMeas::read(){
  uint32_t edge_data = m_dev->read_reg(3*m_id+1);
  m_hi_n = (uint16_t)(edge_data & 0x7FFF);
  m_hi_flg = (bool)(edge_data & 0x8000) >> 15;
  m_lo_n = (uint16_t)(edge_data & 0x7FFF0000) >> 16;
  m_lo_flg = (bool)(edge_data & 0x80000000) >> 31;
  uint32_t dc_data = m_dev->read_reg(3*m_id+2);
  m_hi_t = (uint32_t)(dc_data & 0x7FFFFFFF);
  m_t_flg = (bool)(dc_data & 0x80000000) >> 31;
}

uint32_t FreqMeas::get_ts_cnt(){
  uint32_t data = m_dev->read_reg(3*m_id);
 return(data & 0x3FFFFFFF);
}
