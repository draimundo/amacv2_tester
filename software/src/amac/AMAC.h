#ifndef AMAC_H_
#define AMAC_H_

#include "AMACreg.h"
#include "EndeavourCom.h"

class AMAC : public EndeavourCom, public AMACv2Reg {
private:
	void wrEndeavourReg(uint32_t address, uint32_t data);
	uint32_t rdEndeavourReg(uint32_t address);
	
public:
	AMAC(); // no harware

	AMAC(unsigned short amacid, std::shared_ptr<DeviceCom> fpgaCom); // with hardware
	
  ~AMAC();
	
	void wrVirtualField(AMACv2Field AMACv2Reg::* ref, uint32_t data);
	void wrVirtualReg(AMACv2Field AMACv2Reg::* ref, uint32_t data);
	uint32_t rdVirtualField(AMACv2Field AMACv2Reg::* ref);
	uint32_t rdVirtualReg(AMACv2Field AMACv2Reg::* ref);
	
	void syncReg(AMACv2Field AMACv2Reg::* ref);
	void wrField(AMACv2Field AMACv2Reg::* ref, uint32_t data);
	void wrReg(AMACv2Field AMACv2Reg::* ref, uint32_t data);
	uint32_t rdField(AMACv2Field AMACv2Reg::* ref);
	uint32_t rdReg(AMACv2Field AMACv2Reg::* ref);
	
};

#endif // AMAC_H_
