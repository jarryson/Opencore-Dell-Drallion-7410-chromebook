# Opencore-Dell-Drallion-7410-chromebook

Hackintosh macOS opencore config Dell Drallion 7410 chromebook

[中文说明](https://github.com/jarryson/Opencore-Dell-Drallion-7410-chromebook/blob/main/README_zh.md) ｜ English

Manual Configure: <https://github.com/isi95010/DrallionMacOS>

!!! IMPORTANT !!!

If you use old version BIOS, please update! <https://docs.mrchromebox.tech>

## Specifications:

- CPU: Intel i7 10610U Processor
- MEM: 16gb of soldered RAM
- GPU: Intel UHD620
- SSD: ~~128G SAMSUNG~~ need to be replaced
- WIFI: Intel AX201
- SCREEN: 14inch flip-touchscreen.

## Current Status:

| **Feature**        | **Status**           | **Notes**                                                                                                                             |
| ------------------ | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| WiFi               | Working              | See [OpenIntelWireless](https://openintelwireless.github.io). Seems to work more reliably by Fixing DMAR.                             |
| Bluetooth          | Working              | See [OpenIntelWireless](https://openintelwireless.github.io)                                                                          |
| Sleep/Wake         | Working              |                                                                                                                                       |
| Trackpad           | Working              |                                                                                                                                       |
| Graphics Accel.    | Working              |                                                                                                                                       |
| Internal Speakers  | Working              | AppleALC.kext using layout-id 22 on Catalina+. Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                          |
| Keyboard backlight | Not Working in MacOS |                                                                                                                                       |
| Brightness keys    | Working              |                                                                                                                                       |
| Keyboard & Remaps  | Working              |                                                                                                                                       |
| SD Card Reader     | Working              | It is a Realtek PCIE MicroSD card reader. It seems to work with [0xFirewolf's kext](https://github.com/0xFireWolf/RealtekCardReader). |
| Headphone Jack     | WIP                  | Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                                                                         |
| HDMI Audio         | Working              |                                                                                                                                       |
| HDMI Video         | Working              | Somewhat janky detecting displays but works in a roundabout way.                                                                      |
| USB Ports          | Working              | Working with USB mapping                                                                                                              |
| Webcam             | Working              | Working with USB mapping                                                                                                              |
| Internal Mic.      | Working              | AppleALC.kext using layout-id 22 on Catalina+                                                                                         |
| Shutdown / Restart | Working              |                                                                                                                                       |
| Continuity         | Untested             | Browser handoff seems to work from iPhone. Haven't tested more features                                                               |
| NVRAM              | Working              | Native NVRAM working with DevirtualiseMMIO set to False                                                                               |

## Versions Tested

macOS 10.5 Catalina

macOS 12.7.6 Monterey

macOS 13.7.8 Ventura

## How to use

1. [Open Developer mode](https://docs.chrultrabook.com/docs/firmware/developer-mode.html)
2. [Disabling Write Protect](https://docs.chrultrabook.com/docs/firmware/write-protect.html#disabling-write-protect)
3. Flash UEFI BIOS<https://docs.mrchromebox.tech>
4. Copy EFI to USB disk(fat32).
5. Copy macOS recovery files into USB disk.
6. Reboot and Press ESC and select USB disk to boot.

### Headphone Jack fix

run alc-verb 0x19 0x707 0x24 ever time boot.  
or use install-alc-verb-fix.sh.

### Keyboard & Remaps

- F1 prev
- F2 play
- F3 next
- F4 Spotlight



## Note

- OpenIntelWireless should be replaced for different macOS version.
- Better not to change KEXT order.
- You have to replace MLB, SN, UUID in config.plist.
- After boot you may see black screen, just turn off and turn on lid, or use SSDT-REG-LID0.aml. HDMI may not work or act strange, try to plug in twice HDMI cable or reboot.

## Maybe just for myself

- HDMI won't work on cold start, need reboot. You can press CTRL + ALT + DEL immediately after you see the boot logo (rabbit) to quickly get in warm start.
- Normally it will sleep immediately after boot, It's ok, just close and reopen the lid. And HDMI works.
- It will not sleep immediately after boot on cold start (HDMI won't work).
- You may need to plug in HDMI cable twice.

## Credits

- Credit to [isi95010](https://github.com/isi95010/DrallionMacOS/) for all
- Credit to [mine-man30000](https://github.com/mine-man3000/macOS-Dragonair) for the guide this is based on.
- Credit to [meghan06](https://github.com/meghan06/) for the guide that mine-man3000's is based on, and for starting the Chromeintosh Org.
- Credit to all those who contribute to the [Chrultrabook project](https://docs.chrultrabook.com).
- Credit to [MrChromebox](https://github.com/MrChromebox?tab=repositories) for inadvertently making the firmware compatible with MacOS.
- Credit to ExtremeXT for forking and including the modifications for a MacOS-friendly Coreboot.
- Credit to Ethan (ethanthesleepyone) for hosting builds and the MacOS firmware script originally. It's been taken down for the time being.
- Credit to 1revenger1 for creating a new VoodooPS2 for Keyboard HID mapping, fixing VoodooI2CElan, and loads of guidance.
- Credit to Coolstar for tuning Coreboot initially for Drallion.
