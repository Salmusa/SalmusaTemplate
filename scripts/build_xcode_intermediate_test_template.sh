#!/bin/sh
TEMPLATE_PATH=$1
BUILD_TARGET_PATH=$2
CUSTOMIZABLE_FILE_PATH=$3

# Create build target path
mkdir -p "$BUILD_TARGET_PATH"

# Copy template files
cp -R $TEMPLATE_PATH/* "$BUILD_TARGET_PATH"

# Copy file header
mkdir -p "$BUILD_TARGET_PATH/include"
cp "$CUSTOMIZABLE_FILE_PATH/FileHeader" "$BUILD_TARGET_PATH/include/FileHeader"
