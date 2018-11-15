# -*- mode: Makefile -*-
start: vendor
	cd src; swipl -q -l bootstrap_kernel.pro -g "boot."

vendor:
	-git clone https://github.com/ahungry/simple-template.git src/vendor/simple-template

.PHONY: start
