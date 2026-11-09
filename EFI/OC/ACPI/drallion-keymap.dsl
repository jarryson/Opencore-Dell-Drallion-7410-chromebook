// Drallion (Dell Chromebook 7410) keyboard remap via SSDT RMCF.
// Target: acidanthera VoodooPS2Controller 2.3.x, stock kext (no Info.plist patch).
//
// Runtime order in ApplePS2Keyboard::dispatchKeyboardEvent():
//   1) keyCode = _PS2ToPS2Map[rawCode]      <- "Custom PS2 Map" (this SSDT)
//   2) adbCode = _PS2ToADBMap[keyCode]      <- kext built-in table
//   3) adbCode in special key table -> NX_KEYTYPE_* event
// So remapping a key onto a PS2 scancode that already has a media ADB code
// is enough. No "Custom ADB Map" is required.
//
// Stock kext ADB table (VoodooPS2Keyboard/ApplePS2ToADBMap.h):
//   e0 10 -> 0x4d  NX_KEYTYPE_PREVIOUS  (previous track)
//   e0 22 -> 0x34  NX_KEYTYPE_PLAY      (play / pause)
//   e0 19 -> 0x42  NX_KEYTYPE_NEXT      (next track)
//   e0 0a -> 0xa0  Exposes All (legacy) -- DEAD END on macOS 13: 0xa0 is
//                    an empty keymap entry and is NOT listed in the special
//                    key definition table, so the event is silently dropped.
//   3d    -> 0x63  F3 = Mission Control (requires fn-key mode, i.e. system
//                    setting "Use F1, F2... as standard function keys" OFF)
//
// Why not the repo's original keymap:
//   acidanthera loadCustomADBMap() drops entries whose adbOut > 0xFF, so the
//   repo's HID-usage values (e015=00ff0005, ...) only work with 1Revenger1's
//   fork. PS2->PS2 remaps work on the stock kext. (8-bit ADB values like a0
//   are perfectly valid if you do want a "Custom ADB Map" later.)
//
// How to change a shortcut:
//   edit a "from=to" string below, recompile with iasl, replace
//   EFI/OC/ACPI/drallion-keymap.aml and reboot. config.plist stays untouched.
//   The first empty Package() is REQUIRED by translateArray(): without it the
//   whole array is parsed as a key/value dictionary instead.
//
// Scope note: on current coreboot tables PS2K is \_SB.PCI0.PS2K (a direct
// child of PCI0), NOT \_SB.PCI0.LPCB.PS2K. The old AML used the LPCB path.

DefinitionBlock ("", "SSDT", 2, "sqrl", "drlmap", 0x00001000)
{
    External (_SB_.PCI0.PS2K, DeviceObj)

    Scope (\_SB.PCI0.PS2K)
    {
        Name (RMCF, Package (0x02)
        {
            "Keyboard",
            Package (0x02)
            {
                "Custom PS2 Map",
                Package (0x12)
                {
                    Package (0x00) {},

                    // --- existing remaps, unchanged ---
                    "e027=0",      // disable discrete fnkeys toggle
                    "e028=0",      // disable discrete trackpad toggle
                    "e015=65",     // F5     -> F14 (brightness down)
                    "e011=66",     // F6     -> F15 (brightness up)
                    "e057=58",     // F12    -> F12
                    "e00b=64",     // mirror -> F13
                    "e05b=3a",     // search -> caps lock
                    "e054=38",     // globe  -> left alt
                    "38=e05b",     // left alt -> command

                    // --- top row F1..F4, the "Fn+F1..F4" keys on Chromebook ---
                    "e06a=e010",   // F1 -> e010 -> 0x4d -> previous track
                    "e067=e022",   // F2 -> e022 -> 0x34 -> play / pause
                    "e055=e019",   // F3 -> e019 -> 0x42 -> next track
                    "e056=3d",     // F4 -> 3d -> 0x63 -> F3 / Mission Control
                    //   If F3 alone does not open Mission Control, re-record
                    //   "Show Mission Control" in System Settings > Keyboard
                    //   > Keyboard Shortcuts > Mission Control and press F4.

                    // --- fallback: some ECs emit standard F1..F4 for Fn+row ---
                    // Delete these 4 lines if you prefer to keep real F1..F4.
                    "3b=e010",
                    "3c=e022",
                    "3d=e019",
                    "3e=3d"
                }
            }
        })
    }
}
