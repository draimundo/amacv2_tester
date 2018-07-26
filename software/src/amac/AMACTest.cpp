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

void AMACTest::runVoltageADC(const std::string& chname, AMACv2Field AMACv2Reg::* ch, dac_t dac)
{
  std::ofstream fh;
  fh.open(m_name+"_VADC_"+chname+".csv");

  fh << "Channel\tRampGain\tVoltage\tCounts" << std::endl;

  
  m_amactb->END.wrField(&AMACv2Reg::AMen,1);
  m_amactb->END.wrField(&AMACv2Reg::AMenC,1);
  usleep(5e3);
  for(float v=0;v<=1.01;v+=0.01)
    {
      m_amactb->setDAC(dac, v);
      for(int ramp=0; ramp<16; ramp++)
	{
	  m_amactb->END.wrField(&AMACv2Reg::AMintCalib, ramp);
	  usleep(10e3);
	  uint32_t counts=m_amactb->END.rdField(ch);
	  fh << chname << "\t" << ramp << "\t" << v << "\t" << counts << std::endl;
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
