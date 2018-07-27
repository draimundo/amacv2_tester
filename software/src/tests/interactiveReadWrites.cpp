#include "AMACTB.h"
#include "EndeavourComException.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

struct CommandInfo{
  std::string cmd;
  unsigned int reg;
  unsigned int data;
};

void printCommandHistory(std::vector<CommandInfo> history){

  std::cout << "Printing command history..." << std::endl;

  for(auto cmdInfo : history){
    std::cout << cmdInfo.cmd << "," << cmdInfo.reg << "," << cmdInfo.data << std::endl;
  }
}

//
// Interactively read/write commands to the AMAC, based on user input
//
int main()
{
  AMACTB TB;

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  // Power on
  TB.powerOn();
  usleep(1E6); // 1s wait for a clean power up
  std::cout << "Power ON" << std::endl;

  // Configure I/O pads
  TB.setIDPads(0x1F);
  TB.setIO(TB.ResetB, true);

  while(true)
  {
    // Power off AMAC
    TB.powerAMACOff();
    std::cout << "AMAC OFF" << std::endl;
    usleep(1E6);

    // Power on AMAC
    TB.powerAMACOn();
    std::cout << "AMAC ON" << std::endl;
    usleep(1E6);

    // To save a history of inputs and outputs
    std::vector<CommandInfo> history = {};

    try
    {      
      TB.END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
      std::cout << "SETID" << std::endl;
      usleep(1E6);

      std::string cmd = "";
      std::string reg_str = "";
      std::string data_str = "";

      unsigned int reg = 0;
      unsigned int data = 0;

      while(true){

        std::cout << "Enter a command (read, write, or exit)" << std::endl;
        getline(std::cin, cmd);

        if(cmd == "read"){

          std::cout << "read: Enter a register." << std::endl;

          getline(std::cin, reg_str);
          reg = stoul(reg_str);
          data = TB.END.read_reg(reg);

          std::cout << "read: Register " << std::dec << reg << " has hex (decimal) data: " << std::hex << data << std::dec << "(" << data << ")" << std::endl;

        }
        else if(cmd == "write"){

          std::cout << "write: Enter a register." << std::endl;
          getline(std::cin, reg_str);
          reg = stoul(reg_str);

          std::cout << "write: Enter a data value to send." << std::endl;
          getline(std::cin, data_str);
          data = stoul(data_str); // to save to the history

          TB.END.write_reg(reg, data);

          std::cout << "write: Register " << std::dec << reg << " with hex value: " << std::hex << data << std::dec << std::endl;
        }
        else if(cmd == "exit"){
          std::cout << "exit!" << std::endl;
          break;
        }
        else{
          std::cout << "Invalid command!" << std::endl;
          continue;
        }

        CommandInfo cmdInfo;
        cmdInfo.cmd = cmd;
        cmdInfo.reg = reg;
        cmdInfo.data = data;
        history.push_back(cmdInfo);

      }

      printCommandHistory(history);

    }
    catch(EndeavourComException e)
    {
      std::cout << e.what() << std::endl;

      printCommandHistory(history);
    }
  }

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
