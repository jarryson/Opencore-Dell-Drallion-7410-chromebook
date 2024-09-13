//e06a -> F1, e067 -> F2, e055 -> F3, e056 -> F4, e015 -> F5, e011 -> F6, e057 -> F12, e00b -> mirror
//e05b -> caps, e054 -> globe


DefinitionBlock ("", "SSDT", 2, "sqrl", "drlmap", 0x00000000)
{
    External (_SB_.PCI0.PS2K, DeviceObj)

    Scope (\_SB.PCI0.PS2K)
    {
        Name (RMCF, Package (0x02)
        {
            "Keyboard", 
            Package (0x04)
            {
                "Swap command and option", 
                ">n", 
                "Custom ADB Map", 
                Package (0x0a)
                {
                    Package (0x00){}, 
                    "e06a=000c00b6", // F1 -> Previous Track
                    "e067=000c00b0", // F2 -> Play/Pause
                    "e055=000c00b5", // F3 -> Skip Track
                    "e056=ff010001", // F4 -> Search
                    //"e05b=000700e3", // Bug: unable to change!!! ChrOS search (caps lock position) -> left command (ALT is 000700e2)
                    "e054=00070039", // Globe key  -> caps
                    "e015=00ff0005", // F5 -> Brightness Down
                    "e011=00ff0004", // F6 -> Brightness Up
                }
            }
        })
    }
}