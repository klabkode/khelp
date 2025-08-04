# GNU Makefile for Khelp

PREFIX := $(HOME)/.local
BINDIR := $(PREFIX)/bin

TARGET := khelp
SRC := khelp.sh

INSTALL_PATH := $(BINDIR)/$(TARGET)

install:
	@echo "Installing Khelp ..."
	mkdir -p $(BINDIR)
	install -m 755 $(SRC) $(INSTALL_PATH)

uninstall:
	@echo "Removing Khelp ..."
	rm -vf $(INSTALL_PATH)

html:
	@# Build Static HTML Site
	python scripts/build_html.py

clean:
	rm -f index.html

.PHONY: html clean install uninstall
