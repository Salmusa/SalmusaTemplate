#!/bin/sh
INTERMEDIATE_TEMPLATE_PATH="templates/test/meta"
FLINT_CUSTOMIZABLE_FILE_PATH="templates/test/flint"

FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH="build/test/intermediate/flint"
FLINT_FINAL_TEMPLATE_TARGET_PATH="build/test/flint"

# Clean build path
rm -rf $FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH
rm -rf $FLINT_FINAL_TEMPLATE_TARGET_PATH

# Build intermediate Flint test template
sh scripts/build_flint_intermediate_test_template.sh "$INTERMEDIATE_TEMPLATE_PATH" \
                                                     "$FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH" \
                                                     "$FLINT_CUSTOMIZABLE_FILE_PATH" \
                                                     "VIPER Module Tests"

# Build Flint test template
summon/bin flint spark -t "$FLINT_INTERMEDIATE_TEMPLATE_TARGET_PATH" \
                       -o "$FLINT_FINAL_TEMPLATE_TARGET_PATH" \
                       -i "$FLINT_CUSTOMIZABLE_FILE_PATH/variables.yml"
