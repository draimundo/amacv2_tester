#ifndef AMACTEST_H_
#define AMACTEST_H_

#include <memory>

#include "AMACTB.h"

class AMACTest 
{
public:
  AMACTest(const std::string& name, std::shared_ptr<AMACTB> amactb);
  AMACTest();
  ~AMACTest();

  void dumpRegisters();
  
  float runBER();  
  void runBERvsClock();

  void runVoltageADC(const std::string& chname, AMACv2Field AMACv2Reg::* ch, dac_t dac);
  void runZeroCalib(const std::string& chname, AMACv2Field AMACv2Reg::* ch);

private:
  std::string m_name;
  
  std::shared_ptr<AMACTB> m_amactb;
};

#endif // AMACTEST_H_
