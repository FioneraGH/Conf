// fan/temperature readings only (fan behavior is BIOS)

DefinitionBlock ("", "SSDT", 2, "hack", "fan", 0)
{
    //
    // ACPISensors configuration (ACPISensors.kext is not installed by default)
    //

    Device (SMCD)
    {
        Name (_HID, "FAN00000") // _HID: Hardware ID
        // ACPISensors.kext configuration
        Name (TACH, Package()
        {
            "System Fan", "FAN0",
        })
        Name (TEMP, Package()
        {
            "CPU Heatsink", "TCPU",
            //"Ambient", "TAMB",
            //"Mainboard", "TSYS",
            //"CPU Proximity", "TCPP",
        })
        //Name (KLVN, 1)
        // Actual methods to implement fan/temp readings/control
        //    Method (FAN0, 0, Serialized)
        //    {
        //    }
        Method (TCPU, 0, Serialized)
        {
            Return (\_TZ.TZ00._TMP())
            //Return(Divide(Subtract(\_TZ.TZ00._TMP(), 2732), 10))
            //If (\_SB.PCI0.LPCB.EC.ECOK) { Local0 = \_SB.PCI0.LPCB.EC.RTMP }
            //Else { Local0 = 0x1a }
            //Return(Local0)
        }
        //Method (TAMB, 0, Serialized) // Ambient Temp
        //{
        //}
    }
}
//EOF
