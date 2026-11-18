/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-REG-LID0.aml, Mon Nov 16 23:25:57 2026
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000D2 (210)
 *     Revision         0x02
 *     Checksum         0xEC
 *     OEM ID           "sqrl"
 *     OEM Table ID     "reglid"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "sqrl", "reglid", 0x00000000)
{
    External (_SB_.LIDS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XREG, MethodObj)    // 2 Arguments

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (_REG, 2, NotSerialized)  // _REG: Region Availability
        {
            Debug = "New _REG called"
            \_SB.PCI0.LPCB.EC0.XREG (Arg0, Arg1)
            Notify (LID0, LIDS)
        }
    }
}

