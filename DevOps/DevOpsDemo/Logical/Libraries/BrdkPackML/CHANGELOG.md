# Changelog

All notable changes to `BrdkPackML` will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and `BrdkPackML` adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [3.0.3] - 2026-06-11
### Added
- Link to github repository in README.md
### Changed
- Link to full documentation in README.md

## [3.0.2] - 2026-06-10
### Added
- Online documentation

## [3.0.1] - 2025-08-18
### Fixed
- Waiting For and Interrupted By did not account for synchronization settings. 

## [3.0.0] - 2025-07-03
### Added
- Verified for AS6 compliance
### Changed
- InterruptedBy spelling is corrected in the source code 
- Help file is updated for syntax and spelling
- Help file is updated for AS6 related build options

## [2.1.0] - 2025-03-07
### Added
- Step mode (StepMode) added for EquipmentModule and ControlModule

## [2.0.0] - 2024-12-03
### Changed
- Setup.Synchronization datatype is updated and default values are updated for Override, Escalate and ReactTo

## [1.4.0] - 2024-08-23
### Added
- Time in substate
- On entry for state and substate bit
### Fixed
- Sample code for prioritized start 

## [1.3.0] - 2023-11-13
### Added
- EMStatus type expanded to include StateInfo
- Functions to get InterruptedBy and WaitingFor information for any module
### Fixed
- Sample code for prioritized start 

## [1.2.1] - 2022-04-22
### Fixed
- Commads are reset when changing mode to improve stability when changing parent

## [1.2.0] - 2022-03-29
### Added
- Cycle time info added in the EquipmentModule.Info structure 
### Fixed
- Substate is now reset when changing Mode

## [1.1.0] - 2022-03-15
### Added
- ControlModule Function Block is added. This module implements a simple state machine with state change log and info about parent module. 
### Changed
- EquipmentModule.Info.Last format is updated.
- PubSub can now be disabled with EquipmentModule.Interface.Enable
### Fixed
- Bug in subscibtion interface when changing to null pointer 
### Security

## [1.0.0] - 2022-03-03
### Added
- First release
