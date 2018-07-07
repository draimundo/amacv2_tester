#ifndef AMACTB_H_
#define AMACTB_H_

#include <memory>
#include <cstdint>
#include "UIOCom.h"

enum direction_t{IN, OUT};
struct io_t {
	uint8_t bit;
	uint8_t reg;
	direction_t dir;
};

enum mux_t{
	HVCtrl0, HVCtrl1, HVCtrl2, HVCtrl3,
	AVCC, AVDD5, VCC5, VDD2V5, AVEE, VEE5, VDD1V2};

enum HVref_t{HVret1, HVret2};

enum HVret_t{HVref, HGND};

class AMACTB {
public:
	AMACTB(std::shared_ptr<DeviceCom> uio);
	~AMACTB();

	void powerOn();
	void powerOff();
	
	void selHVrefChannel(HVref_t sel);
	void selHVretChannel(HVret_t sel);
	void selMUXChannel(mux_t mux_sel);
	
	void setIO(io_t pin, bool value);
	void setIO(uint8_t reg, uint32_t regOffset, bool value);
	bool readIO(io_t pin);
	bool readIO(uint8_t reg, uint32_t regOffset);
	
	const io_t LDx0en			 = {0, 0x0, IN};
	const io_t LDy0en			 = {1, 0x0, IN};
	const io_t LDx1en			 = {2, 0x0, IN};
	const io_t LDy1en			 = {3, 0x0, IN};
	const io_t LDx2en			 = {4, 0x0, IN};
	const io_t LDy2en			 = {5, 0x0, IN};
	const io_t HrstBx			 = {6, 0x0, IN};
	const io_t HrstBy			 = {7, 0x0, IN};
	const io_t LAM				 = {8, 0x0, IN};
	const io_t GPO				 = {9, 0x0, IN};
	const io_t DCDCadj			 = {10, 0x0, IN};
	const io_t DCDCEn			 = {11, 0x0, IN};
	const io_t Ofout			 = {12, 0x0, IN};
	const io_t RO_PG_O			 = {13, 0x0, IN};

	const io_t SSSHx			 = {0, 0x1, OUT};
	const io_t SSSHy			 = {1, 0x1, OUT};
	const io_t ResetB			 = {2, 0x1, OUT};
	const io_t PGOOD			 = {3, 0x1, OUT};
	const io_t GPI				 = {4, 0x1, OUT};
	const io_t Ofin				 = {5, 0x1, OUT};
	const io_t ID0				 = {6, 0x1, OUT};
	const io_t ID1				 = {7, 0x1, OUT};
	const io_t ID2				 = {8, 0x1, OUT};
	const io_t ID3				 = {9, 0x1, OUT};
	const io_t ID4				 = {10, 0x1, OUT};

	const io_t LD_EN_VDDRL		 = {0, 0x2, 	OUT};
	const io_t LV_EN_2V5		 = {1, 0x2, 	OUT};
	const io_t LV_EN_VP5		 = {2, 0x2, 	OUT};
	const io_t LV_EN_VN5		 = {3, 0x2, 	OUT};
	const io_t LV_EN_AVDD5		 = {4, 0x2, 	OUT};
	const io_t LV_EN_AVEE		 = {5, 0x2, 	OUT};
	const io_t LV_EN_AVCC		 = {6, 0x2, 	OUT};
	const io_t ADC_CNV			 = {7, 0x2, 	OUT};
	const io_t MUX_SEL0			 = {8, 0x2, 	OUT};
	const io_t MUX_SEL1			 = {9, 0x2, 	OUT};
	const io_t MUX_SEL2			 = {10, 0x2, 	OUT};
	const io_t LD_EN_VDCDC		 = {11, 0x2, 	OUT};
	const io_t HVret_SW			 = {12, 0x2, 	OUT};
	const io_t LVL_TRANS_EN		 = {13, 0x2, 	OUT};
	const io_t MPM_MUX_EN		 = {14, 0x2, 	OUT};
	const io_t HVSW_MUX_EN		 = {15, 0x2, 	OUT};
	const io_t FPGA_EFUSE_PULSE	 = {16, 0x2, 	OUT};
	const io_t HVref_HGND_SW	 = {17, 0x2, 	OUT};
	
private:

	std::shared_ptr<DeviceCom> m_uio;
};

#endif // AMACTB_H_
