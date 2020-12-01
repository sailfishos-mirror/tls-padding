# Default device names to preload is "", which matches nothing.
DEV_NAMES_TO_PRELOAD_GLOB ?= \"\"

all: libtls-padding.so ld_preload_tls_padding.sh
.PHONY: all

libtls-padding.so: tls-padding.cpp
	$(CXX) -shared -o $@ $^

ld_preload_tls_padding.sh: ld_preload_tls_padding.sh.in
	sed \
		-e s/@DEV_NAMES_TO_PRELOAD_GLOB@/"$(DEV_NAMES_TO_PRELOAD_GLOB)"/ \
		$< >$@

.PHONY: clean
clean:
	rm -rf libtls-padding.so ld_preload_tls_padding.sh