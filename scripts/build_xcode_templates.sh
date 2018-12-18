#!/bin/sh
INTERMEDIATE_TEMPLATE_PATH="templates/module/meta"
XCODE_CUSTOMIZABLE_FILE_PATH="templates/module/xcode"
XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH="$XCODE_CUSTOMIZABLE_FILE_PATH/plain"
XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH="$XCODE_CUSTOMIZABLE_FILE_PATH/framework"

XCODE_CUSTOMIZED_TEMPLATE_FILE_PATH="$INTERMEDIATE_TEMPLATE_PATH/template_customized"

XCODE_CUSTOMIZED_INCLUDE_FILE_PATH="$INTERMEDIATE_TEMPLATE_PATH/include_customized"
XCODE_PLAIN_CUSTOMIZED_INCLUDE_FILE_PATH="$XCODE_CUSTOMIZED_INCLUDE_FILE_PATH/plain"
XCODE_FRAMEWORK_CUSTOMIZED_INCLUDE_FILE_PATH="$XCODE_CUSTOMIZED_INCLUDE_FILE_PATH/framework"

XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH="build/module/intermediate/xcode"
XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/plain/bare"
XCODE_INTERMEDIATE_PLAIN_SWINJECT_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/plain/swinject"
XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/framework/bare"
XCODE_INTERMEDIATE_FRAMEWORK_SWINJECT_TEMPLATE_TARGET_PATH="$XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH/framework/swinject"
XCODE_FINAL_TEMPLATE_TARGET_PATH="build/module/xcode/Module.xctemplate"

# Clean build path
rm -rf $XCODE_INTERMEDIATE_TEMPLATE_TARGET_PATH
rm -rf $XCODE_FINAL_TEMPLATE_TARGET_PATH

# Build intermediate Xcode plain template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                                                "" \
                                                "$XCODE_PLAIN_CUSTOMIZED_INCLUDE_FILE_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH/FileHeader" \
                                                "$XCODE_PLAIN_CUSTOMIZED_INCLUDE_FILE_PATH/Module.swift"
# Build intermediate Xcode plain Swinject template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_PLAIN_SWINJECT_TEMPLATE_TARGET_PATH" \
                                                "$XCODE_CUSTOMIZED_TEMPLATE_FILE_PATH/swinject" \
                                                "$XCODE_PLAIN_CUSTOMIZED_INCLUDE_FILE_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH/FileHeader" \
                                                "$XCODE_PLAIN_CUSTOMIZED_INCLUDE_FILE_PATH/swinject/Module.swift"
# Build intermediate Xcode framework template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                                                "" \
                                                "$XCODE_FRAMEWORK_CUSTOMIZED_INCLUDE_FILE_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH/FileHeader" \
                                                "$XCODE_FRAMEWORK_CUSTOMIZED_INCLUDE_FILE_PATH/Module.swift"
# Build intermediate Xcode framework Swinject template
sh scripts/build_xcode_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$XCODE_INTERMEDIATE_FRAMEWORK_SWINJECT_TEMPLATE_TARGET_PATH" \
                                                "$XCODE_CUSTOMIZED_TEMPLATE_FILE_PATH/swinject" \
                                                "$XCODE_FRAMEWORK_CUSTOMIZED_INCLUDE_FILE_PATH" \
                                                "$XCODE_CUSTOMIZABLE_FILE_PATH/FileHeader" \
                                                "$XCODE_FRAMEWORK_CUSTOMIZED_INCLUDE_FILE_PATH/swinject/Module.swift"

# Build Xcode plain template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/No" \
                       -i "$XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
# Build Xcode plain Swinject template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_PLAIN_SWINJECT_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/Swinject" \
                       -i "$XCODE_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
# Build Xcode framework template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/NoSalmusa" \
                       -i "$XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
# Build Xcode framework Swinject template
summon/bin flint spark -t "$XCODE_INTERMEDIATE_FRAMEWORK_SWINJECT_TEMPLATE_TARGET_PATH" \
                       -o "$XCODE_FINAL_TEMPLATE_TARGET_PATH/SwinjectSalmusa" \
                       -i "$XCODE_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"

# Copy TemplateInfo.plist
cp "$XCODE_CUSTOMIZABLE_FILE_PATH/TemplateInfo.plist" "$XCODE_FINAL_TEMPLATE_TARGET_PATH/TemplateInfo.plist"
