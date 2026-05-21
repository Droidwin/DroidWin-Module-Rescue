# DroidWin-Module-Rescue
A lightweight recovery-based utility for managing Magisk, APatch, and KernelSU modules directly from TWRP or OrangeFox Recovery.

## Features

- Disable a specific module
- Remove a specific module
- Disable all installed modules
- View installed modules
- Reboot to Android
- Interactive menu-driven interface

## Requirements

- TWRP Recovery or OrangeFox Recovery
- Mounted and decrypted Data partition
- Magisk, APatch, or KernelSU installed

## Download
The module can be downloaded from [here](https://www.droidwin.com/droidwin-module-rescue)

## Installation

1. Flash `DroidWin_Module_Rescue.zip` in TWRP or OrangeFox.
2. Then go to:

   Advanced → Terminal

3. Run:

   sh /sdcard/DroidWin/rescue.sh

Detailed Steps With Screenshots: [here](https://www.droidwin.com/droidwin-module-rescue)

## Usage Examples

### Disable a problematic module

Select: 1. Disable Module
Choose the module number and confirm.

### Remove a problematic module

Select:
2. Remove Module
Choose the module number and confirm.

### Disable all modules

Select:
3. Disable All Modules

## When To Use
Useful when troubleshooting bootloops caused by unknown modules.

## Tested On
TWRP Recovery and OrangeFox Recovery

## Disclaimer

This tool modifies module states by creating standard disable and remove markers inside /data/adb/modules.
Always keep a backup before making changes to your device. Droidwin and its members wouldn’t be held responsible in case of a thermonuclear war, your alarm doesn’t wake you up, or if anything happens to your device and data by performing the steps given below.
