# cosmos42-zmk-config

## Building

* Open in VS Code devcontainer
* run `make [all|left|right]`

After building, the firmware files can be found in `target/cosmos42_(left|right).uf2`

## What is this?

This is the ZMK firmware config for my split 42-key keyboard.

The devcontainer is based on the upstream ZMK one, but it puts the zmk-config at the centre and uses the upstream code as a build dependency.
