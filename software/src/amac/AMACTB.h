#ifndef AMACTB_H_
#define AMACTB_H_

#include <memory>
#include <cstdint>
#include "UIOCom.h"
#include "FreqMeas.h"
#include "LTC2666.h"

enum direction_t{IN, OUT};
struct io_t {
	uint8_t bit;
	uint8_t reg;
	direction_t dir;
};

enum chanSpan_t{p5V, p10V, pm5V, pm10V, pm2_5V};
struct dac_t{
	float chanMin;
	float chanMax;
	chanSpan_t chanSpan;
	uint8_t	chanNbr;
	uint8_t DACNbr;
};

struct adc_t{
	uint8_t chanNbr;
	uint8_t ADCNbr;
};

enum mux_t{
	HVCtrl0, HVCtrl1, HVCtrl2, HVCtrl3,
	AVCC, AVDD5, VCC5, VDD2V5, AVEE, VEE5, VDD1V2};

enum class HVret_t{HVret1, HVret2};

enum class HVref_t{HVref, HGND};

class AMACTB {
public:
	AMACTB(	std::shared_ptr<DeviceCom> dio,
					SPICom* dac0,
					SPICom* dac1,
					SPICom* adc0,
					SPICom* adc1,
					SPICom* adc2,
					std::shared_ptr<DeviceCom> frq);
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
	
	//TB inputs - AMAC outputs
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
	const io_t DCDCadj		 = {10, 0x0, IN};
	const io_t DCDCEn			 = {11, 0x0, IN};
	const io_t Ofout			 = {12, 0x0, IN};
	const io_t RO_PG_O		 = {13, 0x0, IN};
	//TB outputs - AMAC inputs
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
	//TB outputs - TB hardware
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
	
	//DAC outputs
	const dac_t CAL = {.chanMin = 0, .chanMax = 1, .chanSpan = p5V, .chanNbr = 0, .DACNbr = 0};
	const dac_t Cur1Vp = {.chanMin = 0.7, .chanMax = 1, .chanSpan = p5V, .chanNbr = 1, .DACNbr = 0};
	const dac_t Cur10Vp = {.chanMin = 0.7, .chanMax = 1, .chanSpan = p5V, .chanNbr = 2, .DACNbr = 0};
	const dac_t PTAT = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 3, .DACNbr = 0};
	const dac_t VCC1 = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 4, .DACNbr = 0};
	const dac_t HVref = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 5, .DACNbr = 0};
	const dac_t Cur10Vp_offset = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 6, .DACNbr = 0}; //To be adapted
	const dac_t Cur1Vp_offset = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 7, .DACNbr = 0}; //To be adapted
	const dac_t RgOsc_Vref = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 2, .DACNbr = 1}; //To be adapted
	const dac_t HVOsc_Vref = {.chanMin = 0.5, .chanMax = 0.8, .chanSpan = p5V, .chanNbr = 3, .DACNbr = 1}; //To be adapted
	
	//ADC inputs
	const adc_t M1 = {.chanNbr = 7, .ADCNbr = 0};
	const adc_t M2 = {.chanNbr = 6, .ADCNbr = 0};
	const adc_t M3 = {.chanNbr = 5, .ADCNbr = 0};
	const adc_t M4 = {.chanNbr = 4, .ADCNbr = 0};
	const adc_t M5 = {.chanNbr = 3, .ADCNbr = 0};
	const adc_t M6 = {.chanNbr = 2, .ADCNbr = 0};
	const adc_t M7 = {.chanNbr = 1, .ADCNbr = 0};
	const adc_t M8 = {.chanNbr = 0, .ADCNbr = 0};
	const adc_t Ext_NTC_ADC1 = {.chanNbr = 0, .ADCNbr = 1};
	const adc_t AM600BG = {.chanNbr = 2, .ADCNbr = 1};
	const adc_t AM900BG = {.chanNbr = 3, .ADCNbr = 1};
	const adc_t Shunty = {.chanNbr = 4, .ADCNbr = 1};
	const adc_t Shuntx = {.chanNbr = 5, .ADCNbr = 1};
	const adc_t CALy = {.chanNbr = 6, .ADCNbr = 1};
	const adc_t CALx = {.chanNbr = 7, .ADCNbr = 1};
	const adc_t AM_LVDS_CM0 = {.chanNbr = 0, .ADCNbr = 2};
	const adc_t AM_LVDS_CM1 = {.chanNbr = 1, .ADCNbr = 2};
	const adc_t HV_SW_Vout = {.chanNbr = 2, .ADCNbr = 2};
	const adc_t HVret1 = {.chanNbr = 6, .ADCNbr = 2};
	const adc_t HVret2 = {.chanNbr = 7, .ADCNbr = 2};
	
	LTC2666 DAC0;
	LTC2666 DAC1;
	FreqMeas FRQ;
	
private:
	std::shared_ptr<DeviceCom> m_dio;
	
	SPICom* m_dac0;
	SPICom* m_dac1;
	
	SPICom* m_adc0;
	SPICom* m_adc1;
	SPICom* m_adc2;
	
	std::shared_ptr<DeviceCom> m_frq;
	

	
	
};

#endif // AMACTB_H_
