
# Directory where is installed VCPKG package manager. 
VCPKG_ROOT := /home/archbox/build/vcpkg/
CACHE      := ./cache

cachefile := $(CACHE)/CMakeCache.txt

$(cachefile):
	cmake -B$(CACHE) -H. \
		-DCMAKE_TOOLCHAIN_FILE=$(VCPKG_ROOT)/scripts/buildsystems/vcpkg.cmake

install: $(cachefile)
	cmake --build $(CACHE) --target install

run: $(cachefile)
	cmake --build $(CACHE) --target install
	python3 client1.py

clean:
	rm -rf -v $(CACHE)
	rm -v *.so
