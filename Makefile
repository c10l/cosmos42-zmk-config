kb_name = cosmos42
sides = left right

all: $(sides)
.PHONY: all

left right:
	west build \
		-p \
		-d build/$@ \
		-s /workspaces/zmk/app \
		-b nice_nano_v2 \
		-- \
			-DSHIELD=$(kb_name)_$@ \
			-DZMK_CONFIG=$(shell pwd)/config \
			-DZMK_EXTRA_MODULES=$(shell pwd)
.PHONY: left right
