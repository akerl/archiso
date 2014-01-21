V=14

INSTALL_FILES=$(wildcard archiso/initcpio/install/*)
HOOKS_FILES=$(wildcard archiso/initcpio/hooks/*)
SCRIPT_FILES=$(wildcard archiso/initcpio/script/*)

INSTALL_DIR=$(DESTDIR)/usr/lib/initcpio/install
HOOKS_DIR=$(DESTDIR)/usr/lib/initcpio/hooks
SCRIPT_DIR=$(DESTDIR)/usr/lib/initcpio

all:

install: install-program install-initcpio

install-program:
	install -D -m 755 archiso/mkarchiso $(DESTDIR)/usr/bin/mkarchiso

install-initcpio:
	install -d $(SCRIPT_DIR) $(HOOKS_DIR) $(INSTALL_DIR)
	install -m 755 -t $(SCRIPT_DIR) $(SCRIPT_FILES)
	install -m 644 -t $(HOOKS_DIR) $(HOOKS_FILES)
	install -m 644 -t $(INSTALL_DIR) $(INSTALL_FILES)

.PHONY: install install-program install-initcpio dist
