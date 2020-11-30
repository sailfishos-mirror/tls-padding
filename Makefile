all: tls-padding.so
.PHONY: all

tls-padding.so: tls-padding.cpp
	$(CXX) -shared -o $@ $^

.PHONY: clean
clean:
	rm -rf tls-padding.so