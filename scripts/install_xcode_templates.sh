#!/bin/sh
TITLE="Salmusa VIPER Template"
XCODE_CUSTOM_TEMPLATE_PATH="$HOME/Library/Developer/Xcode/Templates/File Templates"

rm -rf "$XCODE_CUSTOM_TEMPLATE_PATH/$TITLE"
mkdir -p "$XCODE_CUSTOM_TEMPLATE_PATH/$TITLE"
cp -R "build/module/xcode/Module.xctemplate" "$XCODE_CUSTOM_TEMPLATE_PATH/$TITLE/"
