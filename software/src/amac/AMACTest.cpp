#include "AMACTest.h"

#include <iostream>
#include <iomanip>
#include <fstream>

#include <unistd.h>
#include <math.h>

#include "EndeavourComException.h"

AMACTest::AMACTest(const std::string& name, std::shared_ptr<AMACTB> amactb)
  : m_name(name), m_amactb(amactb)
{ }

AMACTest::~AMACTest()
{ }

void AMACTest::dumpRegisters()
{
  uint data;
  for(uint reg=0;reg<172;reg++)
    {
      data=(reg==0)?m_amactb->END.read_reg(reg):m_amactb->END.readnext_reg();
      std::cout << reg << "\t0x" << std::hex << std::setw(8) << std::setfill('0') << data << std::dec << std::endl;
    }
}

void AMACTest::runPower()
{
  std::ofstream fh;
  fh.open(m_name+"_Power.csv");

  fh << "AM_VDDLR\tAM_VDDLR_Curr\tAM_VDCDC\tAM_VDCDC_Curr\tAM_VDD_HI\tAM_VDD_HI_Curr\tAM_VDD\tAVCC\tAVCC_Curr\tAVCC5\tAVCC5_Curr\tAVDD5\tVDD2V5\tAVEE\tVEE5\tVDD1V2" << std::endl;

  float AM_VDDLR      =m_amactb->getADC(m_amactb->AM_VDDLR_V);
  float AM_VDDLR_Curr =m_amactb->getADC(m_amactb->AM_VDDLR_A);

  float AM_VDCDC      =m_amactb->getADC(m_amactb->AM_VDCDC_V);
  float AM_VDCDC_Curr =m_amactb->getADC(m_amactb->AM_VDCDC_A);
  
  float AM_VDD_HI     =m_amactb->getADC(m_amactb->AM_VDD_HI_V);
  float AM_VDD_HI_Curr=m_amactb->getADC(m_amactb->AM_VDD_HI_A);

  float AM_VDD        =m_amactb->getADC(m_amactb->AM_VDD_V);

  float AVCC     =m_amactb->getADC(m_amactb->AVCC_V);
  float AVCC_Curr=m_amactb->getADC(m_amactb->AVCC_A);
  float VCC5     =m_amactb->getADC(m_amactb->VCC5_V);
  float VCC5_Curr=m_amactb->getADC(m_amactb->VCC5_A);
  float AVDD5    =m_amactb->getADC(m_amactb->AVDD5_V);
  float VDD2V5   =m_amactb->getADC(m_amactb->VDD2V5_V);
  float AVEE     =m_amactb->getADC(m_amactb->AVEE_V);
  float VEE5     =m_amactb->getADC(m_amactb->VEE5_V);
  float VDD1V2   =m_amactb->getADC(m_amactb->VDD1V2_V);

  fh << AM_VDDLR << "\t" << AM_VDDLR_Curr << "\t" << AM_VDCDC << "\t" << AM_VDCDC_Curr << "\t" << AM_VDD_HI << "\t" << AM_VDD_HI_Curr << "\t" << AM_VDD << "\t" << AVCC << "\t" << AVCC_Curr << "\t" << VCC5 << "\t" << VCC5_Curr << "\t" << AVDD5 << "\t" << VDD2V5 << "\t" << AVEE << "\t" << VEE5 << "\t" << VDD1V2 << std::endl;

  std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR voltage: "  << AM_VDDLR       << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR current: "  << AM_VDDLR_Curr  << "A" << std::endl;
  std::cout << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC voltage: "  << AM_VDCDC       << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC current: "  << AM_VDCDC_Curr  << "A" << std::endl;
  std::cout << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI voltage: " << AM_VDD_HI      << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI current: " << AM_VDD_HI_Curr << "A" << std::endl;
  std::cout << std::endl;
  std::cout << std::fixed << std::setprecision(10) << "AM_VDD voltage: "    << AM_VDD         << "V" << std::endl;
  std::cout << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"AVCC voltage: "       << AVCC           << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"AVCC current: "       << AVCC_Curr      << "A" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"VCC5 voltage: "       << VCC5           << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"VCC5 current: "       << VCC5_Curr      << "A" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"AVDD5 voltage: "      << AVDD5          << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"VDD2V5 voltage: "     << VDD2V5         << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"AVEE voltage: "       << AVEE           << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"VEE5 voltage: "       << VEE5           << "V" << std::endl;
  std::cout << std::fixed << std::setprecision(10) <<"VDD1V2 voltage: "     << VDD1V2         << "V" << std::endl;

  fh.close();

}

void AMACTest::runBERvsClock()
{
  for(uint freqset=0;freqset<pow(2,3);freqset++)
    {
      std::cout << "Setting frequency setting to " << freqset << std::endl;
      m_amactb->END.wrField(&AMACv2Reg::RingOscFrq, freqset);
      runBER();
    }
}

float AMACTest::runBER()
{
  uint good=0;
  uint total=10000;
  for(uint i=0; i<total; i++)
    {
      try
	{      
	  uint valin=rand()*0xFFFFFFFF;
	  m_amactb->END.write_reg(166,valin);
	  usleep(1e3);
	  uint valout=m_amactb->END.read_reg(166);
	  usleep(1e3);
	  if(valin==valout)
	    {
	      good++;
	    }
	  else
	    {
	      std::cout << "Write: 0x" << std::hex << valin << ", Read: " << valout << std::dec << std::endl;
	    }
	}
      catch(EndeavourComException &e)
	{
	  std::cout << "EndeavourComException" << std::endl;
	  std::cout << e.what() << std::endl;
	}
    }

  std::cout << "Reliability: " << ((float)good)/total << std::endl;
}

void AMACTest::runBandgapScan()
{
  // Enable setting the bandgap
  m_amactb->END.wrField(&AMACv2Reg::AMbgen , 1);
  m_amactb->END.wrField(&AMACv2Reg::VDDbgen, 1);

  std::ofstream fh;
  fh.open(m_name+"_BANDGAP.csv");  

  fh << "VDDBG" << "\t" << "AMBG" << "\t" << "AM600BG" << "\t" << "AM900BG" << "\t" << "VDD" << std::endl;

  for(uint AMbg=0;AMbg<pow(2,4);AMbg++)
    {
      m_amactb->END.wrField(&AMACv2Reg::AMbg, AMbg);
      for(uint VDDbg=0;VDDbg<pow(2,4);VDDbg++)
	{
	  m_amactb->END.wrField(&AMACv2Reg::VDDbg, VDDbg);
	  usleep(10);
	  float AM600BG=m_amactb->getADC(m_amactb->AM600BG);
	  float AM900BG=m_amactb->getADC(m_amactb->AM900BG);
	  float VDD    =m_amactb->getADC(m_amactb->AM_VDD_V);
	  fh << VDDbg << "\t" << AMbg << "\t" << AM600BG << "\t" << AM900BG << "\t" << VDD << std::endl;
	}
    }

  fh.close();
}

void AMACTest::runVoltageADC(const std::string& chname, AMACv2Field AMACv2Reg::* ch, dac_t dac)
{
  std::ofstream fh;
  fh.open(m_name+"_VADC_"+chname+".csv");

  fh << "Channel\tAMBG\tRampGain\tInputVoltage\tADCvalue" << std::endl;

  m_amactb->END.wrField(&AMACv2Reg::AMbgen , 1);
  m_amactb->END.wrField(&AMACv2Reg::AMen,1);
  m_amactb->END.wrField(&AMACv2Reg::AMenC,1);
  usleep(5e3);
  for(uint AMbg=0;AMbg<pow(2,4);AMbg++)
    {
      m_amactb->END.wrField(&AMACv2Reg::AMbg, AMbg);
      for(float v=0;v<=1.01;v+=0.01)
	{
	  m_amactb->setDAC(dac, v);
	  for(int ramp=0; ramp<16; ramp++)
	    {
	      m_amactb->END.wrField(&AMACv2Reg::AMintCalib, ramp);
	      usleep(10e3);
	      uint32_t counts=m_amactb->END.rdField(ch);
	      fh << chname << "\t" << AMbg << "\t" << ramp << "\t" << v << "\t" << counts << std::endl;
	    }
	}
    }

  fh.close();
}

void AMACTest::runZeroCalib(const std::string& chname, AMACv2Field AMACv2Reg::* ch)
{
  std::ofstream fh;
  fh.open(m_name+"_ZEROCALIB_"+chname+".csv");

  fh << "Channel\tRampGain\tCounts" << std::endl;

  
  m_amactb->END.wrField(&AMACv2Reg::AMen,1);
  m_amactb->END.wrField(&AMACv2Reg::AMenC,1);
  m_amactb->END.wrField(&AMACv2Reg::AMzeroCalib,1);
  m_amactb->END.wrField(&AMACv2Reg::AMzeroCalibC,1);
  usleep(5e3);
  for(int ramp=0; ramp<16; ramp++)
    {
      m_amactb->END.wrField(&AMACv2Reg::AMintCalib, ramp);
      for(uint i=0;i<100;i++)
	{
	  usleep(5e3);
	  uint32_t counts=m_amactb->END.rdField(ch);
	  fh << chname << "\t" << ramp << "\t" << counts << std::endl;
	}
    }

  fh.close();
}
