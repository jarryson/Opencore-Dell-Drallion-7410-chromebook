# Opencore-Dell-Drallion-7410-chrome
Hackintosh macOS opencore config Dell Drallion 7410 chrome

[中文说明](https://github.com/jarryson/Opencore-Dell-Drallion-7410-chrome/blob/main/README_zh.md) ｜ English

Manual Configure: https://github.com/isi95010/DrallionMacOS

Forum: https://forum.chrultrabook.com

## Specifications:

- CPU: Intel i7 10610U Processor
- MEM: 16gb of soldered RAM
- GPU: Intel UHD620
- SSD: 128G SAMSUNG need to be replaced
- WIFI: Intel AX201
- SCREEN: 14inch flip-touchscreen. 

## Current Status:

| **Feature**        | **Status**           | **Notes**                                                                                     |
|--------------------|----------------------|-----------------------------------------------------------------------------------------------|
| WiFi               | Working              | See [OpenIntelWireless](https://openintelwireless.github.io). Seems to work more reliably by Fixing DMAR.                            |
| Bluetooth          | Working              | See [OpenIntelWireless](https://openintelwireless.github.io)                                                                         |
| Sleep/Wake         | WIP              |                    |
| Trackpad           | Working              | Works with newer commit of VoodooI2CElan. See section in [Input Devices](#input-devices).                       | 
| Graphics Accel.    | Working              |                                                                                               |
| Internal Speakers  | Working              | AppleALC.kext using layout-id 22 on Catalina+. Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                            |
| Keyboard backlight | Not Working in MacOS |                                                                                               |
| Brightness keys | Working | Use 1revenger1's fork of VoodooPS2 and look at my SSDT. See section in [Input Devices](#input-devices). |
| Keyboard & Remaps  | Working              | Use 1revenger1's fork of VoodooPS2 and look at my SSDT. See section in [Input Devices](#input-devices).                                   |
| SD Card Reader     | Working              | It is a Realtek PCIE MicroSD card reader. It seems to work with [0xFirewolf's kext](https://github.com/0xFireWolf/RealtekCardReader).             |
| Headphone Jack     | WIP                  | Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                                                             |
| HDMI Audio         | Working              |                                                                                               |
| HDMI Video         | Working              | Somewhat janky detecting displays but works in a roundabout way.                              |
| USB Ports          | Working              | Working with USB mapping                                                                      |
| Webcam             | Working              | Working with USB mapping                                                                      |
| Internal Mic.      | Working              | AppleALC.kext using layout-id 22 on Catalina+                                                             |
| Shutdown / Restart | Working              |                                                                                               |    
| Continuity         | Untested             | Browser handoff seems to work from iPhone. Haven't tested more features                                                       |    
| NVRAM              | Working              | Native NVRAM working with DevirtualiseMMIO set to False                                       |
                                                                          
## Versions Tested

macOS 10.5 Catalina

macOS 12.7.6 Monterey 

## How to use
1. [Open Developer mode](https://docs.chrultrabook.com/docs/firmware/developer-mode.html)
2. [Disabling Write Protect](https://docs.chrultrabook.com/docs/firmware/write-protect.html#disabling-write-protect)
3. [Flashing Custom Firmware](https://docs.chrultrabook.com/docs/firmware/flashing-firmware.html). [Firmware Utility Script homepage](https://docs.mrchromebox.tech/docs/fwscript.html)
4. [Flashing Chromeintosh fork Firmware](https://github.com/Chromeintosh/coreboot). Download manually [here](https://ethanthesleepy.one/public/mac_build/coreboot_edk2-drallion-mrchromebox_20240714_macos.rom) and flash using Firmware Utility Script "Restore Stock Firmware" funcion or [flashrom-libpci38](https://ethanthesleepy.one/public/chrultrabook/utils/) tools [here](https://docs.chrultrabook.com/docs/firmware/manually-flashing.html)
5. Copy EFI to USB disk(fat32).
6. Copy macOS recovery files into USB disk.
7. Reboot and Press ESC and select USB disk to boot.

## Note
* OpenIntelWireless should be replaced for different macOS version.
* Better not to change KEXT order.
* You have to replace MLB, SN, UUID in config.plist.

## Credits
* Credit to [isi95010](https://github.com/isi95010/DrallionMacOS/) for all
* Credit to [mine-man30000](https://github.com/mine-man3000/macOS-Dragonair) for the guide this is based on.
* Credit to [meghan06](https://github.com/meghan06/) for the guide that mine-man3000's is based on, and for starting the Chromeintosh Org.
* Credit to all those who contribute to the [Chrultrabook project](https://docs.chrultrabook.com).
* Credit to [MrChromebox](https://github.com/MrChromebox?tab=repositories) for inadvertently making the firmware compatible with MacOS. 
* Credit to ExtremeXT for forking and including the modifications for a MacOS-friendly Coreboot.
* Credit to Ethan (ethanthesleepyone) for hosting builds and the MacOS firmware script originally. It's been taken down for the time being. 
* Credit to 1revenger1 for creating a new VoodooPS2 for Keyboard HID mapping, fixing VoodooI2CElan, and loads of guidance. 
* Credit to Coolstar for tuning Coreboot initially for Drallion. 


