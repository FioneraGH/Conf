/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASL6OSNZe.aml, Sat Mar 31 22:37:10 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000006DD (1757)
 *     Revision         0x02
 *     Checksum         0xC7
 *     OEM ID           "hack"
 *     OEM Table ID     "TYPC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "TYPC", 0x00000000)
{
    External (_SB_.PCI0.RP09, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)    // (from opcode)

    Scope (\_SB.PCI0.RP09)
    {
        Name (RTBT, One)
    }

    Scope (\_SB.PCI0.RP09.PXSX)
    {
        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            Return (One)
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Device (TBL1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                {
                    If (LNot (Arg2))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                           
                        })
                    }

                    Store (Package (0x02)
                        {
                            "PCIHotplugCapable", 
                            Zero
                        }, Local0)
                    Return (Local0)
                }

                Return (Zero)
            }

            Device (NHI0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LNot (Arg2))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                           
                        })
                    }

                    Store (Package (0x03)
                        {
                            "power-save", 
                            One, 
                            Buffer (One)
                            {
                                 0x00                                           
                            }
                        }, Local0)
                    Return (Local0)
                }
            }
        }

        Device (TBL3)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Device (TBTU)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x6D, 
                    Zero
                })
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (GPLD, 2, Serialized)
                    {
                        Name (PCKG, Package (0x01)
                        {
                            Buffer (0x10) {}
                        })
                        CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                        Store (One, REV)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                        Store (Arg0, VISI)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                        Store (Arg1, GPOS)
                        Return (PCKG)
                    }

                    Method (GUPC, 1, Serialized)
                    {
                        Name (PCKG, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Store (Arg0, Index (PCKG, Zero))
                        Return (PCKG)
                    }

                    Method (TPLD, 2, Serialized)
                    {
                        Name (PCKG, Package (0x01)
                        {
                            Buffer (0x10) {}
                        })
                        CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                        Store (One, REV)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                        Store (Arg0, VISI)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                        Store (Arg1, GPOS)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                        Store (One, SHAP)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                        Store (0x08, WID)
                        CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                        Store (0x03, HGT)
                        Return (PCKG)
                    }

                    Method (TUPC, 1, Serialized)
                    {
                        Name (PCKG, Package (0x04)
                        {
                            One, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Store (Arg0, Index (PCKG, One))
                        Return (PCKG)
                    }

                    Device (UB21)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (TUPC (0x09))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (TPLD (One, One))
                        }
                    }

                    Device (UB22)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (GUPC (Zero))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (GPLD (Zero, Zero))
                        }
                    }

                    Device (UB31)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (TUPC (0x09))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (TPLD (One, One))
                        }
                    }

                    Device (UB32)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            Return (GUPC (Zero))
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            Return (GPLD (Zero, Zero))
                        }
                    }
                }
            }
        }
    }
}

