#ifndef FREQ_MEAS_H
#define FREQ_MEAS_H


#include "UIOCom.h"
#include <memory>
#include <cstdint>
#include <iostream>

#include <map>

class FreqMeasInst{
public:
	FreqMeasInst(){
		m_id = 0;
		m_hi_n = 0;
		m_hi_flg = 0;
		m_lo_n = 0;
		m_lo_flg = 0;
		m_hi_t = 0;
		m_t_flg = 0;
		m_dev = NULL;
	}
	~FreqMeasInst(){};
	
	void init_inst(std::shared_ptr<DeviceCom> dev, uint8_t id, uint32_t ts_cnt = 10000);
	void reset_inst(bool active = true);
	void freeze_inst(bool active = true);
	void start_inst();
	void set_ts_cnt_inst(uint32_t ts_cnt = 10000);
	void read_inst();
	uint32_t get_ts_cnt_inst();
	
	const uint16_t& hi_n = m_hi_n;
	const bool& hi_flg = m_hi_flg;
	const uint16_t& lo_n = m_lo_n;
	const bool& lo_flg = m_lo_flg;
	const uint32_t& hi_t = m_hi_t;
	const bool& t_flg = m_t_flg;

private:
	uint8_t m_id;
	uint16_t m_hi_n;
	bool m_hi_flg;
	uint16_t m_lo_n;
	bool m_lo_flg;
	uint32_t m_hi_t;
	bool m_t_flg;
	std::shared_ptr<DeviceCom> m_dev;
};

class FreqMeas{
public:
	FreqMeas(std::shared_ptr<DeviceCom> dev, uint32_t bClkHz = 100E6) : m_dev(dev), m_bClkHz(bClkHz){
		this->init();
	}
	~FreqMeas(){};
	

	
	void reset(FreqMeasInst FreqMeas::* ref, bool active = true){
		(this->*ref).reset_inst(active);
	}
	void reset(std::string str, bool active = true){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).reset_inst(active);
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return;
	}
	
	void freeze(FreqMeasInst FreqMeas::* ref, bool active = true){
		(this->*ref).freeze_inst(active);
	}
	void freeze(std::string str, bool active = true){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).freeze_inst(active);
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return;
	}
	
	void start(FreqMeasInst FreqMeas::* ref){
		(this->*ref).start_inst();
	}
	void start(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).start_inst();
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return;
	}
	
	void set_ts_cnt(FreqMeasInst FreqMeas::* ref, uint32_t ts_cnt){
		(this->*ref).set_ts_cnt_inst(ts_cnt);
	}
	void set_ts_cnt(std::string str, uint32_t ts_cnt){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).set_ts_cnt_inst(ts_cnt);
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return;
	}
	
	void read(FreqMeasInst FreqMeas::* ref){
		(this->*ref).read_inst();
	}
	void read(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).read_inst();
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return;
	}
	
	uint32_t get_ts_cnt(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).get_ts_cnt_inst();
	}
	uint32_t get_ts_cnt(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).get_ts_cnt_inst();
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return 0;
	}
	
	uint16_t get_hi_n(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).hi_n;
	}
	uint16_t get_hi_n(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).hi_n;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return 0;
	}
	
	
	bool get_hi_flg(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).hi_flg;
	}
	bool get_hi_flg(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).hi_flg;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return true;
	}
	
	uint16_t get_lo_n(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).lo_n;
	}
	uint16_t get_lo_n(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).lo_n;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return 0;
	}
		
	bool get_lo_flg(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).lo_flg;
	}
	bool get_lo_flg(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).lo_flg;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return true;
	}
	
	uint32_t get_hi_t(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).hi_t;
	}
	uint32_t get_hi_t(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).hi_t;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return 0;
	}
	
	bool get_t_flg(FreqMeasInst FreqMeas::* ref){
		return (this->*ref).t_flg;
	}
	bool get_t_flg(std::string str){
		if(regMap.find(str) != regMap.end()){
			return(this->*regMap[str]).t_flg;
		} else {
			std::cerr << " --> Error: Could not find register \""<< str << "\"" << std::endl;
		}
		return true;
	}
	
	float get_frq(FreqMeasInst FreqMeas::* ref);
	float get_frq(const std::string& str);
	
	std::map<std::string, FreqMeasInst FreqMeas::*> regMap; //To control them all directly
	
	FreqMeasInst HVOSC0;
	FreqMeasInst HVOSC1;
	FreqMeasInst HVOSC2;
	FreqMeasInst HVOSC3;
	FreqMeasInst CLKOUT;
	
private:
	void init();
	std::shared_ptr<DeviceCom> m_dev;
	uint32_t m_bClkHz;
};

#endif //FREQ_MEAS_H
