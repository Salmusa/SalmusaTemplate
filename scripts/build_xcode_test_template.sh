#!/bin/sh
INTERMEDIATE_TEMPLATE_PATH="templates/test/meta"
XCODE_CUSTOMIZABLE_FILE_PATH="templates/test/xcode"

XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH="build/test/intermediate/xcode"
XCODE_FINAL_TEMPLATE_TARGET_PATH="build/test/xcode/Test.xctemplate"

# Clean build path
rm -rf $XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH
rm -rf $XCODE_FINAL_TEMPLATE_TARGET_PATH

# Build intermediate Xcode test template
sh scripts/build_xcode_intermediate_test_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                     "$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH" \
                                                     "$XCODE_CUSTOMIZABLE_FILE_PATH"

# Build Xcode test template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH" \
                       -i "$XCODE_CUSTOMIZABLE_FILE_PATH/variables.yml"

# Copy TemplateInfo.plist
cp "$XCODE_CUSTOMIZABLE_FILE_PATH/TemplateInfo.plist" "$XCODE_FINAL_TEMPLATE_TARGET_PATH/TemplateInfo.plist"
