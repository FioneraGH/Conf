#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import zipfile


def main():
    print("Processing File ", sys.argv[1])

    with zipfile.ZipFile(sys.argv[1], "r") as file:
        for name in file.namelist():
            utf8name = name.decode('gbk')
            print("Extracting ", utf8name)
            pathname = os.path.dirname(utf8name)
            if not os.path.exists(pathname) and pathname != "":
                os.makedirs(pathname)
            data = file.read(name)
            if not os.path.exists(utf8name):
                fo = open(utf8name, "w")
                fo.write(data)
                fo.close


if __name__ == '__main__':
    main()
