.PHONY: all flint flint-templates flint-test-template xcode xcode-templates xcode-test-template

all:
	make flint
	make xcode
# Flint templates
flint: flint-templates flint-test-template
	summon/bin flint template add "build/module/flint/plain" "VIPER" -f
	summon/bin flint template add "build/module/flint/framework" "VIPER/Salmusa" -f
	summon/bin flint template add "build/test/flint" "VIPER/Tests" -f
flint-templates:
	sh "scripts/build_flint_templates.sh"
flint-test-template:
	sh "scripts/build_flint_test_template.sh"
# Xcode templates
xcode: xcode-templates xcode-test-template
	sh "scripts/install_xcode_templates.sh"
xcode-templates:
	sh "scripts/build_xcode_templates.sh"
xcode-test-template:
	sh "scripts/build_xcode_test_template.sh"
