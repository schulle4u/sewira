# SeWiRa - the Selfmade Wifi Radio
# Copyright (c) 2024 Steffen Schultz

# Target directory for sewira
BIN_DIR = /usr/local/bin

# We must run as sudo, so make sure to get the correct home directory
USER_HOME = $(if $(SUDO_USER),$(shell eval echo ~$(SUDO_USER)),$(HOME))

# Who are you?
USER_NAME = $(if $(SUDO_USER),$(SUDO_USER),$(USER))

# Target directory for streams
CONFIG_DIR = $(USER_HOME)/sewira

.PHONY: all install clean

all: install
install: $(BIN_DIR)/sewira $(CONFIG_DIR)/streams

$(BIN_DIR)/sewira: sewira
	install -m 755 sewira $(BIN_DIR)

$(CONFIG_DIR)/streams: streams
	@mkdir -p $(CONFIG_DIR)
	@cp -r streams $(CONFIG_DIR)
	@chown -R $(USER_NAME):$(USER_NAME) $(CONFIG_DIR)

clean:
	@echo "Nothing to do."
