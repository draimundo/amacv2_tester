#include "AMAC.h"

// AMAC::AMAC() : AMACv2Reg(){
	
// }

AMAC::AMAC(unsigned short amacid, std::shared_ptr<DeviceCom> fpgaCom) : AMACv2Reg(), EndeavourCom(amacid, fpgaCom){
	for (auto const& p : regMap){
		if((this->*p.second).canBeWritten()){
			syncReg(p.second);
		}
	}
}

AMAC::~AMAC(){}

void AMAC::wrEndeavourReg(uint32_t address, uint32_t data){
	this->write_reg(address, data);
}
uint32_t AMAC::rdEndeavourReg(uint32_t address){
	return this->read_reg(address);
}

void AMAC::wrVirtualField(AMACv2Field AMACv2Reg::* ref, uint32_t data){
	setField(ref, data);
}
void AMAC::wrVirtualReg(AMACv2Field AMACv2Reg::* ref, uint32_t data){
	(this->*ref).writeRaw(data);
}
uint32_t AMAC::rdVirtualField(AMACv2Field AMACv2Reg::* ref){
	return getField(ref);
}
uint32_t AMAC::rdVirtualReg(AMACv2Field AMACv2Reg::* ref){
	return (this->*ref).readRaw();
}

void AMAC::syncReg(AMACv2Field AMACv2Reg::* ref){
	wrEndeavourReg(getAddr(ref), (this->*ref).readRaw());
}
void AMAC::wrField(AMACv2Field AMACv2Reg::* ref, uint32_t data){
	wrVirtualField(ref, data);
	wrEndeavourReg(getAddr(ref), (this->*ref).readRaw());
}
uint32_t AMAC::rdField(AMACv2Field AMACv2Reg::* ref){
	uint32_t ret = rdEndeavourReg(getAddr(ref));
	wrVirtualReg(ref, ret);
	return rdVirtualField(ref);
}