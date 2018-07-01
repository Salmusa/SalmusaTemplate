.PHONY: all xcode build-xcode-templates flint build-flint-templates

all:
	make flint
	make xcode
# Flint templates
flint: build-flint-templates
	summon/bin flint template add "build/module/flint/plain" "VIPER" -f
	summon/bin flint template add "build/module/flint/framework" "Salmusa" -f
build-flint-templates:
	sh "scripts/build_flint_templates.sh"
# Xcode templates
xcode: build-xcode-templates
	sh "scripts/install_xcode_templates.sh"
build-xcode-templates:
	sh "scripts/build_xcode_templates.sh"
