<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="Main" Source="Main.Main.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EM_Infeed" Source="EM_Infeed.EM_Infeed.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EM_Filler" Source="EM_Filler.EM_Filler.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EM_Capper" Source="EM_Capper.EM_Capper.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EM_Outfeed" Source="EM_Outfeed.EM_Outfeed.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3">
    <Task Name="Update" Source="Services.Update.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="RevInfo" Source="RevInfo.RevInfo.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <Binaries>
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="BRRole" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="UaCsConfig" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="UaCore" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="ArProject" Source="Libraries.ArProject.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="BrdkPackML" Source="Libraries.BrdkPackML.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="PackMLCore" Source="Libraries.PackMLCore.lby" Memory="None" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="MpAlarmX" Source="Libraries.MpAlarmX.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>