kb_name = cosmos42
sides = left right

all: $(sides)
.PHONY: all

left right: target
	west build \
		-p \
		-d build/$@ \
		-s /workspaces/zmk/app \
		-b nice_nano_v2 \
		-- \
			-DSHIELD=$(kb_name)_$@ \
			-DZMK_CONFIG=$(shell pwd)/config \
			-DZMK_EXTRA_MODULES=$(shell pwd)

	cp build/$@/zephyr/zmk.uf2 target/$(kb_name)-$@.uf2
.PHONY: left right

target:
	mkdir target/
