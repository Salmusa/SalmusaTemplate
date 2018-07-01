#!/bin/sh
INTERMEDIATE_TEMPLATE_PATH="templates/module/meta"
XCODE_CUSTOMIZABLE_FILE_PATH="templates/module/xcode"
XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH="$XCODE_CUSTOMIZABLE_FILE_PATH/plain"
XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH="$XCODE_CUSTOMIZABLE_FILE_PATH/framework"

XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH="build/module/intermediate/xcode"
XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/plain"
XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/framework"
XCODE_FINAL_TEMPLATE_TARGET_PATH="build/module/xcode/Module.xctemplate"

# Clean build path
rm -rf $XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH
rm -rf $XCODE_FINAL_TEMPLATE_TARGET_PATH

# Build intermediate Xcode plain template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH" \
                                                "$XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH"
# Build intermediate Xcode framework template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH" \
                                                "$XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH"

# Build Xcode plain template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/NO" \
                       -i "$XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
# Build Xcode framework template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/YES" \
                       -i "$XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"

# Copy TemplateInfo.plist
cp "$XCODE_CUSTOMIZABLE_FILE_PATH/TemplateInfo.plist" "$XCODE_FINAL_TEMPLATE_TARGET_PATH/TemplateInfo.plist"
