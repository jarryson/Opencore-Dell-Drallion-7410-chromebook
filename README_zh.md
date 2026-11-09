# Opencore-Dell-Drallion-7410-chromebook

Hackintosh macOS opencore config Dell Drallion 7410 chromebook

手动配置: <https://github.com/isi95010/DrallionMacOS>  


重要更新！！！

如果你使用24年的BIOS，请更新UEFI BIOS，<https://docs.mrchromebox.tech>

如果你使用24年的BIOS，请更新UEFI BIOS，<https://docs.mrchromebox.tech>

如果你使用24年的BIOS，请更新UEFI BIOS，<https://docs.mrchromebox.tech>

重要更新！！！



## 配置清单:

- CPU: Intel i7 10610U 4核心8线程 15w
- MEM: 8G X 2 板载内存
- GPU: Intel UHD620
- SSD: ~~128G SAMSUNG~~自带的必须更换
- WIFI: Intel AX201
- SCREEN: 14寸 可翻转触控屏幕.

## 目前状态:

| **功能**     | **状态** | **备注**                                                                                                                                |
| ---------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------- |
| 无线网络       | 正常     | See [OpenIntelWireless](https://openintelwireless.github.io). Seems to work more reliably by Fixing DMAR.                             |
| 蓝牙         | 正常     | See [OpenIntelWireless](https://openintelwireless.github.io)                                                                          |
| 睡眠         | 正常     |                                                                                                                                       |
| 触控板        | 正常     |                                                                                                                                       |
| 显卡加速       | 正常     |                                                                                                                                       |
| 扬声器        | 正常     | AppleALC.kext using layout-id 22 on Catalina+. Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                          |
| 键盘背光       | 不支持    |                                                                                                                                       |
| 键盘快捷键      | 正常     |                                                                                                                                       |
| SD读卡器      | 正常     | It is a Realtek PCIE MicroSD card reader. It seems to work with [0xFirewolf's kext](https://github.com/0xFireWolf/RealtekCardReader). |
| 耳机孔        | 基本能用   | Combo jack needs HDA Verb sent, IE `alc-verb 0x19 0x707 0x24`                                                                         |
| HDMI Audio | 正常     |                                                                                                                                       |
| HDMI Video | 正常     | Somewhat janky detecting displays but works in a roundabout way.                                                                      |
| USB        | 正常     | 已通过USBTOOLBOX定制                                                                                                                       |
| 摄像头        | 正常     | Working with USB mapping                                                                                                              |
| 内置麦克风.     | 正常     | AppleALC.kext using layout-id 22 on Catalina+                                                                                         |
| 关机/重启      | 正常     |                                                                                                                                       |
| 连续互通       | 正常     | Intel 无线网卡限制，只有部分功能                                                                                                                   |
| NVRAM      | 正常     | Native NVRAM working with DevirtualiseMMIO set to False                                                                               |

## 测试系统版本

macOS 10.5 Catalina  
macOS 12.7.6 Monterey

macOS 13.7.6 Ventura

## 使用说明

1. 打开[Open Developer mode](https://docs.chrultrabook.com/docs/firmware/developer-mode.html)
2. 打开[Disabling Write Protect](https://docs.chrultrabook.com/docs/firmware/write-protect.html#disabling-write-protect)
3. 根据教程刷入UEFI BIOS <https://docs.mrchromebox.tech>
4. 下载 EFI 到 USB (需要格式化为FAT32).
5. 下载 macOS 恢复文件，搜索如何制作macos recovery.
6. 重启按ESC，选择U盘启动.

### 耳机孔修复

开机需要运行命令 alc-verb 0x19 0x707 0x24

或者使用install-alc-verb-fix.sh安装一个plist，开启自动启动。

### 键盘快捷键

- F1为上一首
- F2为播放
- F3为下一首
- F4为spotlight
- F5-F9为图标显示的



## 注意

- 因为OpenIntelWireless区分macOS版本，所以可能需要手动替换.
- KEXT的顺序不要轻易变动，特别是VoodooI2C的.
- 需要手动修改config.plist的 MLB、SN、UUID，可以使用opencore configure 或者hackintool  .



## 以下可能是个例，仅供参考

1. 冷启动如果不重启，第一次开机正常亮屏，但是HDMI会无法使用，重启就好了。重启会看到logo进度条即将走完会黑屏（以下简称“正常状态”），重新关上开启盖子就能唤醒机器。
2. 推荐冷启动时看到开机logo后立刻按三键重启，进入“正常状态”，这时候HDMI就是正常的。
3. 如果不外接屏幕，可以启用ACPI文件夹下的SSDT-REG-LID0a.aml和相应patch，这种情况下开机屏幕正常亮，可能偶尔无背光，只是HDMI只能最高4K@30，也无法进入“正常状态”。
4. HDMI可能插上没反应，需要插两次。

## 感谢

- Credit to [isi95010](https://github.com/isi95010/DrallionMacOS/) for all
- Credit to [mine-man30000](https://github.com/mine-man3000/macOS-Dragonair) for the guide this is based on.
- Credit to [meghan06](https://github.com/meghan06/) for the guide that mine-man3000's is based on, and for starting the Chromeintosh Org.
- Credit to all those who contribute to the [Chrultrabook project](https://docs.chrultrabook.com).
- Credit to [MrChromebox](https://github.com/MrChromebox?tab=repositories) for inadvertently making the firmware compatible with MacOS.
- Credit to ExtremeXT for forking and including the modifications for a MacOS-friendly Coreboot.
- Credit to Ethan (ethanthesleepyone) for hosting builds and the MacOS firmware script originally. It's been taken down for the time being.
- Credit to 1revenger1 for creating a new VoodooPS2 for Keyboard HID mapping, fixing VoodooI2CElan, and loads of guidance.
- Credit to Coolstar for tuning Coreboot initially for Drallion.
