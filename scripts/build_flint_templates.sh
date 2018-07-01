#!/bin/sh
INTERMEDIATE_TEMPLATE_PATH="templates/module/meta"
FLINT_CUSTOMIZABLE_FILE_PATH="templates/module/flint"
FLINT_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH="$FLINT_CUSTOMIZABLE_FILE_PATH/plain"
FLINT_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH="$FLINT_CUSTOMIZABLE_FILE_PATH/framework"

FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH="build/module/intermediate/flint"
FLINT_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH="$FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH/plain"
FLINT_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH="$FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH/framework"
FLINT_FINAL_TEMPLATE_TARGET_PATH="build/module/flint"

# Clean build path
rm -rf $FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH
rm -rf $FLINT_FINAL_TEMPLATE_TARGET_PATH

# Build intermediate Flint plain template
sh scripts/build_flint_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$FLINT_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                                                "$FLINT_CUSTOMIZABLE_FILE_PATH" \
                                                "$FLINT_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH" \
                                                "VIPER Module"
# Build intermediate Flint Salmusa template
sh scripts/build_flint_intermediate_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                "$FLINT_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                                                "$FLINT_CUSTOMIZABLE_FILE_PATH" \
                                                "$FLINT_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH" \
                                                "VIPER Module Conforming Salmusa Protocols"

# Build Flint plain template
summon/bin flint spark -t "$FLINT_INTERMEDIATE_PLAIN_TEMPLATE_TARGET_PATH" \
                       -o "$FLINT_FINAL_TEMPLATE_TARGET_PATH/plain" \
                       -i "$FLINT_PLAIN_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
# Build Flint framework template
summon/bin flint spark -t "$FLINT_INTERMEDIATE_FRAMEWORK_TEMPLATE_TARGET_PATH" \
                       -o "$FLINT_FINAL_TEMPLATE_TARGET_PATH/framework" \
                       -i "$FLINT_FRAMEWORK_TEMPLATE_SPECIFIC_FILE_PATH/variables.yml"
