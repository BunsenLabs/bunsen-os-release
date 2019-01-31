# Makefile for building and installing man pages
# Copyright (C) 2015 Jens John <dev@2ion.de>
# Licensed under the GNU General Public License v3+

include config.mk

all: $(MANPAGE_TARGETS) $(RELEASE_FILE_TARGETS)

.PHONY: clean
clean:
	rm -f -- $(MANPAGE_TARGETS) $(RELEASE_FILE_TARGETS) *.sed

install: $(MANPAGE_TARGETS) $(RELEASE_FILE_TARGETS)
	$(foreach m,$^,$(shell install -Dm644 $(m) $(DESTDIR)$(PREFIX)/usr/share/man/man$(call mancat,$(m))/$(m)))
	install -Dm644 $(LSB_RELEASE_FILE_TARGET) $(DESTDIR)$(PREFIX)/etc/$(LSB_RELEASE_FILE_TARGET)
	install -Dm644 $(OS_RELEASE_FILE_TARGET) $(DESTDIR)$(PREFIX)/etc/$(OS_RELEASE_FILE_TARGET)

$(LSB_RELEASE_FILE_TARGET): config.mk
	printf '%s\n' "$$LSB_RELEASE_FILE" > $@
	bash -n $@

$(OS_RELEASE_FILE_TARGET): config.mk
	printf '%s\n' "$$OS_RELEASE_FILE" > $@
	bash -n $@

%.gz: %.mkd
	sed "s/%VERSION%/$(OS_VERSION_ID)/" $< > $(<).sed
	pandoc -s -f markdown -t man -o $(@:.gz=) $(<).sed
	gzip -f9 $(@:.gz=)
