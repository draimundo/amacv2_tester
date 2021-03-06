#ifndef AMACTB_H_
#define AMACTB_H_

#include <memory>
#include <cstdint>

#include "DeviceCom.h"
#include "LTC2666.h" 	//DAC
#include "DACDevice.h"
#include "LTC2333.h" 	//ADC
#include "ADCDevice.h"
#include "AD5160.h"		//SPI potentiometer
#include "FreqMeas.h"	//FreqMeas bloc
#include "AMAC.h"

enum direction_t{IN, OUT};
struct io_t {
  uint8_t bit;
  uint8_t reg;
  direction_t dir;
};

enum dacChanSpan_t{p5V, p10V, pm5V, pm10V, pm2_5V};
struct dac_t
{
  float mult_fac;
  float offs;
  float chanMin;
  float chanMax;
  dacChanSpan_t dacChanSpan;
  uint8_t	chanNbr;
  LTC2666* DAC;
};

enum mux_t{
	HVCtrl0, HVCtrl1, HVCtrl2, HVCtrl3,
	AVCC, AVDD5, VCC5, VDD2V5, AVEE, VEE5, VDD1V2, NOMUX};

 // adc input channel span
// used with default ref -> multiply 4.096 by the factor
// div = /1.024, p = unipolar, pm = bipolar
// ex : 	p1_25 div : range from 0V to 5V
//				pm2_5 : range from -10.24V to 10.24V
// for more info cf p.15 of datasheet
enum adcChanSpan_t{p1_25div, p1_25, pm1_25div, pm1_25, p2_5div, p2_5, pm2_5div, pm2_5}; //cf p.15 of datasheet
struct adc_t{
  float mult_fac;
  mux_t mux;
	uint8_t chanNbr;
	adcChanSpan_t adcChanSpan;
  LTC2333* ADC;
}; 
  
enum class HVret_t{HVret1, HVret2};

enum class HVref_t{HVref, HGND};

class AMACTB {
public:
  AMACTB(	std::shared_ptr<DeviceCom> dio	= std::make_shared<UIOCom>("/dev/uio0", 0x10000),
		std::shared_ptr<DeviceCom> end	= std::make_shared<UIOCom>("/dev/uio1", 0x10000),
		std::shared_ptr<DeviceCom> dac0	= std::make_shared<SPICom>("/dev/spidev1.3"),
		std::shared_ptr<DeviceCom> dac1	= std::make_shared<SPICom>("/dev/spidev1.4"),
		std::shared_ptr<DeviceCom> adc0	= std::make_shared<SPICom>("/dev/spidev1.5"),
		std::shared_ptr<DeviceCom> adc1	= std::make_shared<SPICom>("/dev/spidev1.6"),
		std::shared_ptr<DeviceCom> adc2	= std::make_shared<SPICom>("/dev/spidev1.7"),
		std::shared_ptr<DeviceCom> pot0	= std::make_shared<SPICom>("/dev/spidev1.0"),
		std::shared_ptr<DeviceCom> pot1	= std::make_shared<SPICom>("/dev/spidev1.1"),
		std::shared_ptr<DeviceCom> pot2	= std::make_shared<SPICom>("/dev/spidev1.2"),
		std::shared_ptr<DeviceCom> frq	= std::make_shared<UIOCom>("/dev/uio2", 0x10000));
  ~AMACTB();

  /* ======================================
     DEVICES
     ====================================== */

  AMAC END;
  LTC2666 DAC0;
  LTC2666 DAC1;
  LTC2333 ADC0;
  LTC2333 ADC1;
  LTC2333 ADC2;
  AD5160 POT0;
  AD5160 POT1;
  AD5160 POT2;
  FreqMeas FRQ;
	
  /* ======================================
     IO CONTROL
     ====================================== */
  void powerOn();
  void powerOff();

  void powerAMACOn();
  void powerAMACOff();

  void selHVrefChannel(HVref_t sel);
  void selHVretChannel(HVret_t sel);
  void selMUXChannel(mux_t mux_sel);
	
  void setIO(io_t pin, bool value);
  void setIO(uint8_t reg, uint32_t regOffset, bool value);
  bool readIO(io_t pin);
  bool readIO(uint8_t reg, uint32_t regOffset);

  void setIDPads(uint8_t id);

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
	
	
  /* ======================================
     DAC CONTROL
     ====================================== */
	
  const uint16_t DAC_FSR = 0xFFFF; //=2^16-1
  void setDAC(dac_t pin, float voltage);
	
  //DAC outputs
  
  //Vout = (VDAC)*mult_fac + offs
  const dac_t CAL = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0, .chanMax = 1, .dacChanSpan = p5V, .chanNbr = 0, .DAC = &DAC0};
  const dac_t Cur1Vp = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.7, .chanMax = 1, .dacChanSpan = p5V, .chanNbr = 1, .DAC = &DAC0};
  const dac_t Cur10Vp = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.7, .chanMax = 1, .dacChanSpan = p5V, .chanNbr = 2, .DAC = &DAC0};
  const dac_t PTAT = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 3, .DAC = &DAC0};
  const dac_t VCC1 = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 4, .DAC = &DAC0};
  const dac_t HVref = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 5, .DAC = &DAC0};
  const dac_t Cur10Vp_offset = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 6, .DAC = &DAC0}; //To be adapted
  const dac_t Cur1Vp_offset = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 7, .DAC = &DAC0}; //To be adapted
  const dac_t HVret_DAC = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 0, .DAC = &DAC1}; //To be adapted
  const dac_t HVret_OffSetDAC = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 1, .DAC = &DAC1}; //To be adapted
  const dac_t RgOsc_Vref = {.mult_fac = 1.0, .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 2, .DAC = &DAC1}; //To be adapted
  const dac_t HVOsc_Vref = {.mult_fac = 1.0, .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 3, .DAC = &DAC1}; //To be adapted
  const dac_t VDCDC_ADJ = {.mult_fac = -1.154, .offs=1.511, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 4, .DAC = &DAC1}; //To be adapted
  const dac_t VDDHI_ADJ = {.mult_fac = 3.4/(3.4+1.6), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 5, .DAC = &DAC1}; //To be adapted
  const dac_t VDDRL_ADJ = {.mult_fac = -1.154, .offs=1.511, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 6, .DAC = &DAC1}; //To be adapted
  const dac_t VDD1V2_ADJ = {.mult_fac = 1.6/(1.6+3.4), .offs=0, .chanMin = 0.5, .chanMax = 0.8, .dacChanSpan = p5V, .chanNbr = 7, .DAC = &DAC1}; //To be adapted
	
  /* ======================================
     ADC CONTROL
     ====================================== */
     
	const uint16_t ADC_FSR = 0xFFFF; //=2^16-1
  const float ADC_REFBUF = 4.096;
  float getADC(adc_t pin);
  //ADC inputs
  const adc_t M1 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 7, .adcChanSpan = p1_25div, .ADC = &ADC0};
  const adc_t AM_VDD_V = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 6, .adcChanSpan = p1_25div, .ADC = &ADC0};
  const adc_t AM_VDDLR_A = {.mult_fac = -1, .mux = NOMUX, .chanNbr = 5, .adcChanSpan = pm1_25div, .ADC = &ADC0};
  const adc_t AM_VDDLR_V = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 4, .adcChanSpan = p1_25div, .ADC = &ADC0};
  const adc_t AM_VDCDC_A = {.mult_fac = -1, .mux = NOMUX, .chanNbr = 3, .adcChanSpan = pm1_25div, .ADC = &ADC0};
  const adc_t AM_VDCDC_V = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 2, .adcChanSpan = p1_25div, .ADC = &ADC0};
  const adc_t AM_VDD_HI_A = {.mult_fac = -1, .mux = NOMUX, .chanNbr = 1, .adcChanSpan = pm1_25div, .ADC = &ADC0};
  const adc_t AM_VDD_HI_V = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 0, .adcChanSpan = p1_25div, .ADC = &ADC0};
    
  const adc_t Ext_NTC_ADC1 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 0, .adcChanSpan = p1_25div, .ADC = &ADC1};
  //channel 1 of ADC1?
  const adc_t AM600BG = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 2, .adcChanSpan = p1_25div, .ADC = &ADC1};
  const adc_t AM900BG = {.mult_fac = 1, .mux = NOMUX,.chanNbr = 3, .adcChanSpan = p1_25div, .ADC = &ADC1};
  const adc_t Shunty = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 4, .adcChanSpan = p1_25div, .ADC = &ADC1};
  const adc_t Shuntx = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 5, .adcChanSpan = p1_25div, .ADC = &ADC1};
  const adc_t CALy = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 6, .adcChanSpan = p1_25div, .ADC = &ADC1};
  const adc_t CALx = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 7, .adcChanSpan = p1_25div, .ADC = &ADC1};
  
  const adc_t AM_LVDS_CM0 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 0, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t AM_LVDS_CM1 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 1, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t CP_HVCtrl0 = {.mult_fac = 1, .mux = HVCtrl0, .chanNbr = 2, .adcChanSpan = pm2_5, .ADC = &ADC2};
  const adc_t CP_HVCtrl1 = {.mult_fac = 1, .mux = HVCtrl1, .chanNbr = 2, .adcChanSpan = pm2_5, .ADC = &ADC2};
  const adc_t CP_HVCtrl2 = {.mult_fac = 1, .mux = HVCtrl2, .chanNbr = 2, .adcChanSpan = pm2_5, .ADC = &ADC2};
  const adc_t CP_HVCtrl3 = {.mult_fac = 1, .mux = HVCtrl3, .chanNbr = 2, .adcChanSpan = pm2_5, .ADC = &ADC2};
  const adc_t AVCC_V = {.mult_fac = 1, .mux = AVCC, .chanNbr = 3, .adcChanSpan = p2_5div, .ADC = &ADC2};
  const adc_t AVDD5_V = {.mult_fac = 1, .mux = AVDD5, .chanNbr = 3, .adcChanSpan = p2_5div, .ADC = &ADC2};
  const adc_t VCC5_V = {.mult_fac = 1, .mux = VCC5, .chanNbr = 3, .adcChanSpan = p2_5div, .ADC = &ADC2};
  const adc_t VDD2V5_V = {.mult_fac = 1, .mux = VDD2V5, .chanNbr = 3, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t AVEE_V = {.mult_fac = 1, .mux = AVEE, .chanNbr = 3, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t VEE5_V = {.mult_fac = 1, .mux = VEE5, .chanNbr = 3, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t VDD1V2_V = {.mult_fac = 1, .mux = VDD1V2, .chanNbr = 3, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t AVCC_A = {.mult_fac = -0.02, .mux = NOMUX, .chanNbr = 4, .adcChanSpan = pm1_25div, .ADC = &ADC2};
  const adc_t VCC5_A = {.mult_fac = -0.02, .mux = NOMUX, .chanNbr = 5, .adcChanSpan = pm1_25div, .ADC = &ADC2};
  const adc_t HVret1 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 6, .adcChanSpan = p1_25div, .ADC = &ADC2};
  const adc_t HVret2 = {.mult_fac = 1, .mux = NOMUX, .chanNbr = 7, .adcChanSpan = p1_25div, .ADC = &ADC2};
  
	
  
  
private:
  std::shared_ptr<DeviceCom> m_dio;
};

#endif // AMACTB_H_
