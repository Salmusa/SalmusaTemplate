#!/bin/sh
TEMPLATE_PATH=$1
BUILD_TARGET_PATH=$2
CUSTOMIZED_TEMPLATE_FILE_PATH=$3
CUSTOMIZED_INCLUDE_FILE_PATH=$4
FILEHEADER_FILE_PATH=$5
MODULE_FILE_PATH=$6

# Create build target path
mkdir -p "$BUILD_TARGET_PATH"

# Copy template files
cp -R "$TEMPLATE_PATH"/* "$BUILD_TARGET_PATH"
if [ "$CUSTOMIZED_TEMPLATE_FILE_PATH" != "" ]
then
  cp -R "$CUSTOMIZED_TEMPLATE_FILE_PATH"/* "$BUILD_TARGET_PATH/template"
fi

# Copy import
cp "$CUSTOMIZED_INCLUDE_FILE_PATH/Import" "$BUILD_TARGET_PATH/include/Import"

# Copy import UIKit
cp "$CUSTOMIZED_INCLUDE_FILE_PATH/ImportUIKit" "$BUILD_TARGET_PATH/include/ImportUIKit"

# Copy file header
cp "$FILEHEADER_FILE_PATH" "$BUILD_TARGET_PATH/include/FileHeader"

# Copy Module.swift file
cp "$MODULE_FILE_PATH" "$BUILD_TARGET_PATH/include/Module/Module.swift"
