# GNU Makefile for Khelp

PREFIX := $(HOME)/.local
BINDIR := $(PREFIX)/bin

TARGET := khelp
SRC := khelp.sh

INSTALL_PATH := $(BINDIR)/$(TARGET)

all:
	@echo "Khelp : Nothing to be done for 'all'."
	@echo "Usage : make help|install|uninstall|html|clean"

help:
	@echo 'Khelp Makefile Options.';
	@echo 'Options:'
	@echo '  install   - Install Khelp CLI script'
	@echo '  uninstall - Uninstall Khelp CLI script'
	@echo '  html      - Generate Khelp Static HTML site'
	@echo '  clean     - Clean HTML site'
	@echo '  help      - Show this help menu'

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
