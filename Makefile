# http://www.sqlite.org/download.html
SQLITE_VERSION  ?= 3080704
SQLITE_BASENAME := sqlite-amalgamation-$(SQLITE_VERSION)
SQLITE_URL      := http://www.sqlite.org/2014/$(SQLITE_BASENAME).zip

# Build/Compile
libs/armeabi/sqlite3-static: build/sqlite3.c
	ndk-build

# Unpack
build/sqlite3.c: $(SQLITE_BASENAME).zip
	unzip -oq "$<"
	rm -rf build
	mv "$(SQLITE_BASENAME)" build
	touch "$@"

# Download
$(SQLITE_BASENAME).zip:
	wget -N -c "$(SQLITE_URL)"

clean:
	rm -f "$(SQLITE_BASENAME).zip"
	rm -rf "$(SQLITE_BASENAME)"
	rm -rf build
	rm -rf obj
	rm -rf libs
