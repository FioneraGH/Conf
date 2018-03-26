#!/bin/sh

function _init(){
    echo $(ioreg -l | grep "DisplayVendorID" | awk '{print $8}')
    echo $(ioreg -l | grep "DisplayProductID" | awk '{print $8}')

    VendorID="4268" # e.g.
    ProductID="53442" # e.g.

    #EDID=$(ioreg -l | grep "IODisplayEDID" | awk '{print $8}' | sed -e 's/.$//' -e 's/^.//')
     EDID=00ffffffffffff0010acc2d054583330021c010380351e78eaad75a9544d9d260f5054a54b008100b300d100714fa9408180d1c00101565e00a0a0a02950302035000e282100001a000000ff003643335644383138303358540a000000fc0044454c4c205032343138440a20000000fd0031561d711c000a202020202020017902031bb15090050403020716010611121513141f2065030c001000023a801871382d40582c45000e282100001e011d8018711c1620582c25000e282100009ebf1600a08038134030203a000e282100001a7e3900a080381f4030203a000e282100001a00000000000000000000000000000000000000000000000000000000d8

    Vid=$(echo "obase=16;$VendorID" | bc | tr 'A-Z' 'a-z')
    Pid=$(echo "obase=16;$ProductID" | bc | tr 'A-Z' 'a-z')
    edID=$(echo $EDID | sed 's/../b5/21')
    EDid=$(echo $edID | xxd -r -p | base64)

    thisDir=$(dirname $0)
    thatDir="/System/Library/Displays/Contents/Resources/Overrides"

    echo $edID
}

function generate_hidpi() {

    mkdir -p $thisDir/tmp/DisplayVendorID-$Vid
    dpiFile=$thisDir/tmp/DisplayVendorID-$Vid/DisplayProductID-$Pid
    
    cat > "$dpiFile" <<-\HIDPI
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>DisplayProductID</key>
    <integer>PID</integer>
    <key>DisplayVendorID</key>
    <integer>VID</integer>
    <key>DisplayProductName</key>
    <string>Color LCD</string>
    <key>IODisplayEDID</key>
    <data>
        EDid
    </data>
    <key>scale-resolutions</key>
    <array>
        <data>
            AAAMgAAABwgA
        </data>
        <data>
            AAAKrAAABgAA
        </data>
    </array>
    <key>target-default-ppmm</key>
    <real>10.0699301</real>
</dict>
</plist>
HIDPI

    sed -i '' "s/VID/$VendorID/g" $dpiFile
    sed -i '' "s/PID/$ProductID/g" $dpiFile
    sed -i '' "s:EDid:${EDid}:g" $dpiFile
    echo "生成成功"
}

start() {
    _init

    cat << EOF
----------------------------------------
|*************** HIDPI ****************|
----------------------------------------
(1) 生成HIDPI配置
(2) 删除HIDPI配置
EOF
    read -p "1 or 2:" input
    case $input in
    1) generate_hidpi
    ;;
    2) sudo rm -rf $thatDir/DisplayVendorID-$Vid && echo "已删除配置文件"
    ;;
    *) break
    ;;
    esac 
}

start
