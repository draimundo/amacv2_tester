#include <iostream>
#include <iomanip>

#include "UIOCom.h"
#include "AMACTB.h"
#include <unistd.h>

int main(){
	std::cout << "Hello world!" << std::endl;
	std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio0", 0x10000);
	AMACTB a (uio);
	
	while(true){
		a.setIO(a.SSSHx,true);
		a.setIO(a.SSSHy,true);
		a.setIO(a.ResetB,true);
		a.setIO(a.PGOOD,true);
		a.setIO(a.GPI,true);
		a.setIO(a.Ofin,true);
		a.setIO(a.ID0,true);
		a.setIO(a.ID1,true);
		a.setIO(a.ID2,true);
		a.setIO(a.ID3,true);
		a.setIO(a.ID4,true);
		
		a.setIO(a.LD_EN_VDDRL,true);
		a.setIO(a.LV_EN_2V5,true);
		a.setIO(a.LV_EN_VP5,true);
		a.setIO(a.LV_EN_VN5,true);
		a.setIO(a.LV_EN_AVDD5,true);
		a.setIO(a.LV_EN_AVEE,true);
		a.setIO(a.LV_EN_AVCC,true);
		a.setIO(a.ADC_CNV,true);
		a.setIO(a.MUX_SEL0,true);
		a.setIO(a.MUX_SEL1,true);
		a.setIO(a.MUX_SEL2,true);
		a.setIO(a.LD_EN_VDCDC,true);
		a.setIO(a.HVret_SW,true);
		a.setIO(a.LVL_TRANS_EN,true);
		a.setIO(a.MPM_MUX_EN,true);		
		a.setIO(a.HVSW_MUX_EN,true);
		a.setIO(a.FPGA_EFUSE_PULSE,true);
		a.setIO(a.HVref_HGND_SW,true);
		
		usleep(1E6);
		
		a.setIO(a.SSSHx,false);
		a.setIO(a.SSSHy,false);
		a.setIO(a.ResetB,false);
		a.setIO(a.PGOOD,false);
		a.setIO(a.GPI,false);
		a.setIO(a.Ofin,false);
		a.setIO(a.ID0,false);
		a.setIO(a.ID1,false);
		a.setIO(a.ID2,false);
		a.setIO(a.ID3,false);
		a.setIO(a.ID4,false);
		a.setIO(a.LD_EN_VDDRL,false);
		a.setIO(a.LV_EN_2V5,false);
		a.setIO(a.LV_EN_VP5,false);
		a.setIO(a.LV_EN_VN5,false);
		a.setIO(a.LV_EN_AVDD5,false);
		a.setIO(a.LV_EN_AVEE,false);
		a.setIO(a.LV_EN_AVCC,false);
		a.setIO(a.ADC_CNV,false);
		a.setIO(a.MUX_SEL0,false);
		a.setIO(a.MUX_SEL1,false);
		a.setIO(a.MUX_SEL2,false);
		a.setIO(a.LD_EN_VDCDC,false);
		a.setIO(a.HVret_SW,false);
		a.setIO(a.LVL_TRANS_EN,false);
		a.setIO(a.MPM_MUX_EN,false);		
		a.setIO(a.HVSW_MUX_EN,false);
		a.setIO(a.FPGA_EFUSE_PULSE,false);
		a.setIO(a.HVref_HGND_SW,false);
		
		std::cout << "\nLDx0en " << a.readIO(a.LDx0en  ) << std::endl;
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
		std::cout << "RO_PG_O " << a.readIO(a.RO_PG_O ) << std::endl;

		usleep(1E6);
	}
	return 0;
}
