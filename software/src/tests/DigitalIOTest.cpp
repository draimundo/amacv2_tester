#include <iostream>
#include <iomanip>
#include "AMACTB.h"

#include <unistd.h>

int main(){
	std::cout << "Hello world!" << std::endl;
	std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio2", 0x10000);
	AMACTB a (uio);
	
	while(true){
		a.setIo(a.SSSHx,true);
		a.setIo(a.SSSHy,true);
		a.setIo(a.ResetB,true);
		a.setIo(a.PGOOD,true);
		a.setIo(a.GPI,true);
		a.setIo(a.Ofin,true);
		a.setIo(a.ID0,true);
		a.setIo(a.ID1,true);
		a.setIo(a.ID2,true);
		a.setIo(a.ID3,true);
		a.setIo(a.ID4,true);
		
		a.setIo(a.LD_EN_VDDRL,true);
		a.setIo(a.LV_EN_2V5,true);
		a.setIo(a.LV_EN_VP5,true);
		a.setIo(a.LV_EN_VN5,true);
		a.setIo(a.LV_EN_AVDD5,true);
		a.setIo(a.LV_EN_AVEE,true);
		a.setIo(a.LV_EN_AVCC,true);
		a.setIo(a.ADC_CNV,true);
		a.setIo(a.MUX_SEL0,true);
		a.setIo(a.MUX_SEL1,true);
		a.setIo(a.MUX_SEL2,true);
		a.setIo(a.LD_EN_VDCDC,true);
		a.setIo(a.Hvret_SW,true);
		a.setIo(a.LVL_TRANS_EN,true);
		a.setIo(a.MPM_MUX_EN,true);		
		a.setIo(a.HVSW_MUX_EN,true);
		a.setIo(a.FPGA_EFUSE_PULSE,true);
		a.setIo(a.HVref_HGND_SW,true);
		
		usleep(500E3);
		
		a.setIo(a.SSSHx,false);
		a.setIo(a.SSSHy,false);
		a.setIo(a.ResetB,false);
		a.setIo(a.PGOOD,false);
		a.setIo(a.GPI,false);
		a.setIo(a.Ofin,false);
		a.setIo(a.ID0,false);
		a.setIo(a.ID1,false);
		a.setIo(a.ID2,false);
		a.setIo(a.ID3,false);
		a.setIo(a.ID4,false);
		a.setIo(a.LD_EN_VDDRL,false);
		a.setIo(a.LV_EN_2V5,false);
		a.setIo(a.LV_EN_VP5,false);
		a.setIo(a.LV_EN_VN5,false);
		a.setIo(a.LV_EN_AVDD5,false);
		a.setIo(a.LV_EN_AVEE,false);
		a.setIo(a.LV_EN_AVCC,false);
		a.setIo(a.ADC_CNV,false);
		a.setIo(a.MUX_SEL0,false);
		a.setIo(a.MUX_SEL1,false);
		a.setIo(a.MUX_SEL2,false);
		a.setIo(a.LD_EN_VDCDC,false);
		a.setIo(a.Hvret_SW,false);
		a.setIo(a.LVL_TRANS_EN,false);
		a.setIo(a.MPM_MUX_EN,false);		
		a.setIo(a.HVSW_MUX_EN,false);
		a.setIo(a.FPGA_EFUSE_PULSE,false);
		a.setIo(a.HVref_HGND_SW,false);
		
		std::cout << "LDx0en " << a.readIO(a.LDx0en  ) << std::endl;
		std::cout << "LDy0en " << a.readIO(a.LDy0en  ) << std::endl;
		std::cout << "LDx1en " << a.readIO(a.LDx1en  ) << std::endl;
		std::cout << "LDy1en " << a.readIO(a.LDy1en  ) << std::endl;
		std::cout << "LDx2en " << a.readIO(a.LDx2en  ) << std::endl;
		std::cout << "LDy2en " << a.readIO(a.LDy2en  ) << std::endl;
		std::cout << "HrstBx " << a.readIO(a.HrstBx  ) << std::endl;
		std::cout << "HrstBy " << a.readIO(a.HrstBy  ) << std::endl;
		std::cout << "LAM	 " << a.readIO(a.LAM	)  << std::endl;
		std::cout << "GPO	 " << a.readIO(a.GPO	)  << std::endl;
		std::cout << "DCDCadj" << a.readIO(a.DCDCadj ) << std::endl;
		std::cout << "DCDCEn " << a.readIO(a.DCDCEn  ) << std::endl;
		std::cout << "Ofout	 " << a.readIO(a.Ofout	 ) << std::endl;
		std::cout << "RO_PG_O" << a.readIO(a.RO_PG_O ) << std::endl;
	}
	
	
	
	return 0;
}
