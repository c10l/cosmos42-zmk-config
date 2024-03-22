kb_name = cosmos42
sides = left right

all: $(sides) reset
.PHONY: all

target:
	mkdir target/

left right: target
	west build \
		-d build/$@ \
		-s $(WORKSPACE_DIR)/app \
		-b nice_nano_v2 \
		-- \
			-DSHIELD=$(kb_name)_$@ \
			-DZMK_CONFIG=$(shell pwd)/config \
			-DZMK_EXTRA_MODULES=$(shell pwd)

	cp build/$@/zephyr/zmk.uf2 target/$(kb_name)-$@.uf2
.PHONY: left right

reset:
	west build \
		-d build/reset \
		-s $(WORKSPACE_DIR)/app \
		-b nice_nano_v2 \
		-- \
		  -DSHIELD=settings_reset

	cp build/reset/zephyr/zmk.uf2 target/settings_reset.uf2
.PHONY: reset
