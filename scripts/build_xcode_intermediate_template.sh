#!/bin/sh
TEMPLATE_PATH=$1
BUILD_TARGET_PATH=$2
CUSTOMIZABLE_FILE_PATH=$3
TEMPLATE_SPECIFIC_FILE_PATH=$4

# Create build target path
mkdir -p "$BUILD_TARGET_PATH"

# Copy template files
cp -R $TEMPLATE_PATH/* "$BUILD_TARGET_PATH"

# Copy import
cp "$TEMPLATE_SPECIFIC_FILE_PATH/Import" "$BUILD_TARGET_PATH/include/Import"

# Copy import UIKit
cp "$TEMPLATE_SPECIFIC_FILE_PATH/ImportUIKit" "$BUILD_TARGET_PATH/include/ImportUIKit"

# Copy file header
cp "$CUSTOMIZABLE_FILE_PATH/FileHeader" "$BUILD_TARGET_PATH/include/FileHeader"

# Copy Module.swift file
cp "$TEMPLATE_SPECIFIC_FILE_PATH/Module.swift" "$BUILD_TARGET_PATH/include/Module/Module.swift"
