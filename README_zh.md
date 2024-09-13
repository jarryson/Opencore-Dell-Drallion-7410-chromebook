# Opencore-Dell-Drallion-7410-chrome
Hackintosh macOS opencore config Dell Drallion 7410 chrome

手动配置: https://github.com/isi95010/DrallionMacOS
论   坛: https://forum.chrultrabook.com

## 配置清单:

- CPU: Intel i7 10610U Processor
- MEM: 16gb of soldered RAM
- GPU: Intel UHD620
- SSD: 128G SAMSUNG need to be replaced
- WIFI: Intel AX201
- SCREEN: 14inch flip-touchscreen. 

## 目前状态:

| **功能**        | **状态**           | **备注**                                                                                     |
|--------------------|----------------------|-----------------------------------------------------------------------------------------------|
| 无线网络               | 正常              | See [OpenIntelWireless](https://openintelwireless.github.io). Seems to work more reliably by Fixing DMAR.                            |
| 蓝牙          | 正常              | See [OpenIntelWireless](https://openintelwireless.github.io)                                                                         |
| 睡眠         | 不正常              | 正在查找原因                   |
| 触控板           | 正常              | Works with newer commit of VoodooI2CElan. See section in [Input Devices](#input-devices).                       | 
| 显卡加速    | 正常              |                                                                                               |
| 扬声器  | 正常              | AppleALC.kext using layout-id 22 on Catalina+. Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                            |
| 键盘背光 | 不支持 |                                                                                               |
| 键盘快捷键 | 正常 | Use 1revenger1's fork of VoodooPS2 and look at my SSDT. See section in [Input Devices](#input-devices). |
| SD读卡器     | 正常              | It is a Realtek PCIE MicroSD card reader. It seems to work with [0xFirewolf's kext](https://github.com/0xFireWolf/RealtekCardReader).             |
| 耳机孔     | 基本能用                  | Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                                                             |
| HDMI Audio         | 正常              |                                                                                               |
| HDMI Video         | 正常              | Somewhat janky detecting displays but works in a roundabout way.                              |
| USB          | 正常              | Working with USB mapping                                                                      |
| 摄像头             | 正常              | Working with USB mapping                                                                      |
| 内置麦克风.      | 正常              | AppleALC.kext using layout-id 22 on Catalina+                                                             |
| 关机/重启 | 正常              |                                                                                               |    
| 连续互通         | 正常             | Intel 无线网卡限制，只有部分功能                                                       |    
| NVRAM              | 正常              | Native NVRAM working with DevirtualiseMMIO set to False                                       |
                                                                          
## 测试系统版本
macOS 10.5 Catalina
macOS 12.7.6 Monterey 

## 使用说明
1. 打开[Open Developer mode](https://docs.chrultrabook.com/docs/firmware/developer-mode.html)
2. 打开[Disabling Write Protect](https://docs.chrultrabook.com/docs/firmware/write-protect.html#disabling-write-protect)
3. [刷入UEFI完整固件](https://docs.chrultrabook.com/docs/firmware/flashing-firmware.html). [Firmware Utility Script homepage](https://docs.mrchromebox.tech/docs/fwscript.html)
4. [刷入Chromeintosh定制UEFI完整固件](https://github.com/Chromeintosh/coreboot). 脚本似乎有问题，可以手动下载 [here](https://ethanthesleepy.one/public/mac_build/coreboot_edk2-drallion-mrchromebox_20240714_macos.rom) 然后使用上一步工具的 "Restore Stock Firmware" 功能，或者[flashrom-libpci38](https://ethanthesleepy.one/public/chrultrabook/utils/)工具， [用法见这里](https://docs.chrultrabook.com/docs/firmware/manually-flashing.html)
5. 下载 EFI 到 USB (需要格式化为FAT32).
6. 下载 macOS 恢复文件，搜索如何制作macos recovery.
7. 重启按ESC，选择U盘启动.

## 注意
* 因为OpenIntelWireless区分macOS版本，所以可能需要手动替换.
* KEXT的顺序不要轻易变动，特别是VoodooI2C的.
* 需要手动修改config.plist的 MLB、SN、UUID，可以使用opencore configure 或者hackintool  .

## 感谢
* Credit to [isi95010](https://github.com/isi95010/DrallionMacOS/) for all
* Credit to [mine-man30000](https://github.com/mine-man3000/macOS-Dragonair) for the guide this is based on.
* Credit to [meghan06](https://github.com/meghan06/) for the guide that mine-man3000's is based on, and for starting the Chromeintosh Org.
* Credit to all those who contribute to the [Chrultrabook project](https://docs.chrultrabook.com).
* Credit to [MrChromebox](https://github.com/MrChromebox?tab=repositories) for inadvertently making the firmware compatible with MacOS. 
* Credit to ExtremeXT for forking and including the modifications for a MacOS-friendly Coreboot.
* Credit to Ethan (ethanthesleepyone) for hosting builds and the MacOS firmware script originally. It's been taken down for the time being. 
* Credit to 1revenger1 for creating a new VoodooPS2 for Keyboard HID mapping, fixing VoodooI2CElan, and loads of guidance. 
* Credit to Coolstar for tuning Coreboot initially for Drallion. 


