#!/bin/sh

function _init(){
    echo $(ioreg -l | grep "DisplayVendorID" | awk '{print $8}')
    echo $(ioreg -l | grep "DisplayProductID" | awk '{print $8}')

    VendorID="2533" # e.g.
    ProductID="1715" # e.g.

    #EDID=$(ioreg -l | grep "IODisplayEDID" | awk '{print $8}' | sed -e 's/.$//' -e 's/^.//')
     EDID=00ffffffffffff0009e5b3060000000001190104951f11780224109759548e271e505400000001010101010101010101010101010101ce1d56e250001e302616360035ad1000001ad11756e250001e302616360035ad1000001a000000fe00424f452043510a202020202020000000fe004e5431343057484d2d4e34310a002a

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
        <data>
            AAAKAAAABaAA
        </data>
        <data>
            AAAFAAAAAtAAAAABACAAAA==
        </data>
        <data>
            AAAHgAAABDgAAAABACAAAA==
        </data>
        <data>
            AAAKAAAABaAAAAABACAAAA==
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
