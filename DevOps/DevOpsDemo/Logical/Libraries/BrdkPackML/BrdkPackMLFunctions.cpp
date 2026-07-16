#include "BrdkPackML.h"
#include "../PackMLCore/PackMLModule.hpp"
#include "../PackMLCore/PackMLModuleTable.hpp"

unsigned long bur_heap_size = 0x3CCCC;

PackMLModuleTable* pPackMLModuleTable = new PackMLModuleTable();


	
//---------------------- IEC Functions ----------------------------------//
bool EMSetMode(unsigned long EmAddress, signed long Mode)
{
	if(EmAddress == 0){
		return false;
	}
	
	PackMLModule* pPackMLModule = reinterpret_cast<PackMLModule*>(EmAddress);
	
	return pPackMLModule->setCurrentMode(Mode);
	
}

bool EMSetModeByName(plcstring* EmName, signed long Mode)
{
	PackMLModule* pPackMLModule = pPackMLModuleTable->getModuleByName(EmName);
	
	if(pPackMLModule == nullptr)
		return false;

	return pPackMLModule->setCurrentMode(Mode);
	
}


plcbit EMGetModuleStatusByName(plcstring* EmName, struct EMStatusType* EMStatus){
	
	PackMLModule* pPackMLModule = pPackMLModuleTable->getModuleByName(EmName);
	
	if(EMStatus == 0 || pPackMLModule == nullptr){
		return false;
	}

	EMStatus->ModeID = pPackMLModule->getCurrentMode();
	strcpy(EMStatus->Name, pPackMLModule->getModuleName());
	EMStatus->StateComplete = pPackMLModule->getStateComplete();
	EMStatus->StateCurrent = static_cast<EMPackMLStateEnum>(pPackMLModule->getCurrentState());
	EMStatus->SubStateCurrent = pPackMLModule->getCurrentSubState();
	strcpy(EMStatus->StateInfo, pPackMLModule->getStateInfo());
		
	return true;
}

plcbit EMGetWaitingForByIdx(unsigned long EmIdx, struct EMStatusType* WaitingFor){
	
	PackMLModule* pPackMLModule = pPackMLModuleTable->getRootModuleByIdx(EmIdx);
	
	if(WaitingFor == 0 || pPackMLModule == nullptr){
		return false;
	}
	
	unsigned long int waitingForIndex =  pPackMLModule->getWaitingForIndex();
	
	if(waitingForIndex == 0xFFFFFFFF){
		return false;
	}
			
	PackMLModule* pWaitingFor = pPackMLModuleTable->getModuleByIdx(waitingForIndex);

	WaitingFor->ModeID = pWaitingFor->getCurrentMode();
	WaitingFor->StateCurrent = static_cast<EMPackMLStateEnum>(pWaitingFor->getCurrentState());
	WaitingFor->SubStateCurrent = pWaitingFor->getCurrentSubState();
	WaitingFor->StateComplete = pWaitingFor->getStateComplete();
	strcpy(WaitingFor->Name, pWaitingFor->getModuleName());
	strcpy(WaitingFor->StateInfo, pWaitingFor->getStateInfo());
	
	return true;
}

plcbit EMGetInterruptedByByIdx(unsigned long EmIdx, struct EMStatusType* InterruptedBy){
	
	PackMLModule* pPackMLModule = pPackMLModuleTable->getModuleByIdx(EmIdx);
	
	if(InterruptedBy == 0 || pPackMLModule == nullptr){
		return false;
	}
	
	unsigned long int interruptedByIndex =  pPackMLModule->getInterruptedByIndex();
	
	if(interruptedByIndex == 0xFFFFFFFF){
		return false;
	}
			
	PackMLModule* pInterruptedBy = pPackMLModuleTable->getModuleByIdx(interruptedByIndex);
			
	InterruptedBy->ModeID = pInterruptedBy->getCurrentMode();
	InterruptedBy->StateCurrent = static_cast<EMPackMLStateEnum>(pInterruptedBy->getInterruptedInState());
	InterruptedBy->SubStateCurrent = pInterruptedBy->getInterruptedInSubState();
	InterruptedBy->StateComplete = false;
	strcpy(InterruptedBy->Name, pInterruptedBy->getModuleName());
	
	//			strcpy(inst->Info.InterruptedBy.StateInfo, pInterruptedBy->getStateInfo());
	return true;
}


unsigned long EMGetModuleAdrByName(plcstring* EmName){
	
	return reinterpret_cast<unsigned long int>(pPackMLModuleTable->getModuleByName(EmName));
}

unsigned long EMGetModuleAdrByIdx(unsigned long EmIdx){
	
	return reinterpret_cast<unsigned long int>(pPackMLModuleTable->getModuleByIdx(EmIdx));
}


plcbit EMGetModuleStatus(unsigned long EmAddress, struct EMStatusType* EMStatus){
	
	if(EmAddress == 0 || EMStatus == 0){
		return false;
	}
	
	PackMLModule* pPackMLModule = reinterpret_cast<PackMLModule*>(EmAddress);
	
	EMStatus->ModeID = pPackMLModule->getCurrentMode();
	strcpy(EMStatus->Name, pPackMLModule->getModuleName());
	EMStatus->StateComplete = pPackMLModule->getStateComplete();
	EMStatus->StateCurrent = static_cast<EMPackMLStateEnum>(pPackMLModule->getCurrentState());
	EMStatus->SubStateCurrent = pPackMLModule->getCurrentSubState();
	strcpy(EMStatus->StateInfo, pPackMLModule->getStateInfo());
	
		
	return true;
}


unsigned long EMGetNumberOfModules(){
	return pPackMLModuleTable->getNumberOfModules();
}

unsigned long EMGetNumberOfRootModules(){
	return pPackMLModuleTable->getNumberOfRoots();
}

plcbit EMGetModuleStatusByIdx(unsigned long EmIdx, struct EMStatusType* EMStatus){
	
	if(EMStatus == 0){
		return false;
	}
	
	PackMLModule* pPackMLModule = pPackMLModuleTable->getModuleByIdx(EmIdx);
	
	EMStatus->ModeID = pPackMLModule->getCurrentMode();
	strcpy(EMStatus->Name, pPackMLModule->getModuleName());
	EMStatus->StateComplete = pPackMLModule->getStateComplete();
	EMStatus->StateCurrent = static_cast<EMPackMLStateEnum>(pPackMLModule->getCurrentState());
	EMStatus->SubStateCurrent = pPackMLModule->getCurrentSubState();
	strcpy(EMStatus->StateInfo, pPackMLModule->getStateInfo());
		
	return true;
}

unsigned long EMGetParentAdr(unsigned long EmAddress){
	
	if(EmAddress == 0){
		return 0;
	}
	return reinterpret_cast<unsigned long int>(reinterpret_cast<PackMLModule*>(EmAddress)->getParentPtr());
		}
unsigned long EMGetChildrenAdrByIdx(unsigned long EmAddress, unsigned long EmIdx){
	
	if(EmAddress == 0){
		return 0;
	}
	
	return reinterpret_cast<unsigned long int>(reinterpret_cast<PackMLModule*>(EmAddress)->getChildPtr(EmIdx));

		}
unsigned long EMGetSiblingAdrByIdx(unsigned long EmAddress, unsigned long EmIdx){
	
	if(EmAddress == 0){
		return 0;
	}
	
	return reinterpret_cast<unsigned long int>(reinterpret_cast<PackMLModule*>(EmAddress)->getSiblingPtr(EmIdx));

		}
unsigned long EMGetRootAdrByIdx(unsigned long EmIdx){
	
	return reinterpret_cast<unsigned long int>(pPackMLModuleTable->getRootModuleByIdx(EmIdx));

}
unsigned long EMGetUserDataAdr(unsigned long EmAddress){
	
	if(EmAddress == 0){
		return 0;
	}
	return reinterpret_cast<unsigned long int>(reinterpret_cast<PackMLModule*>(EmAddress)->getUserMemoryPtr());

		}

plcbit EMSetCommand(unsigned long EmAddress, unsigned long EmAddressInterrupter, enum EMPackMLCmdEnum Command){
	
	if(EmAddress == 0){
		return false;
	}
	
	PackMLModule* pPackMLModule = reinterpret_cast<PackMLModule*>(EmAddress);
	PackMLModuleStateEnu cmdState;
	
	switch(Command){
	
		case CMD_ABORT:
			pPackMLModule->setCmdAbort();
			cmdState = ST_ABORTING;
			break;
		
		case CMD_STOP:
			pPackMLModule->setCmdStop();
			cmdState = ST_STOPPING;
			break;
		
		case CMD_CLEAR:
			pPackMLModule->setCmdClear();
			cmdState = ST_CLEARING;
			break;
		
		case CMD_RESET:
			pPackMLModule->setCmdReset();
			cmdState = ST_RESETTING;
			break;

		case CMD_START:
			pPackMLModule->setCmdStart();
			cmdState = ST_STARTING;
			break;
		
		case CMD_HOLD:
			pPackMLModule->setCmdHold();
			cmdState = ST_HOLDING;
			break;
		
		case CMD_UNHOLD:
			pPackMLModule->setCmdUnhold();
			cmdState = ST_UNHOLDING;
			break;
		
		case CMD_SUSPEND:
			pPackMLModule->setCmdSuspend();
			cmdState = ST_SUSPENDING;
			break;
		
		case CMD_UNSUSPEND:
			pPackMLModule->setCmdUnsuspend();
			cmdState = ST_UNSUSPENDING;
			break;
		
		case CMD_COMPLETE:
			pPackMLModule->setCmdComplete();
			cmdState = ST_COMPLETING;
			break;
	
		case CMD_SC:
			pPackMLModule->setCmdStateComplete();
			cmdState = ST_UNDEFINED;
			break;
		
		default:
			return false;

	}
	
	if(EmAddressInterrupter != 0 && Command != CMD_SC){
		pPackMLModule->setInterruptedBy(reinterpret_cast<PackMLModule*>(EmAddressInterrupter), cmdState);
	}
	
	return true;

}


unsigned long EMGetModuleIdxByName(plcstring* EmName){
	
	if(EmName == nullptr){
		return 0xFFFFFFFF;
	}
	
	return pPackMLModuleTable->getModuleIndexByName(EmName);

}