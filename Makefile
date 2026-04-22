###############################################################
# @author: QuocBuu
# @date: 29/02/2024
###############################################################

FILE_RULES = usb-conf.rules
UDEV = /etc/udev/rules.d

.PHONY: all install reload debug
all: install reload

install:
	@echo "Install file ${FILE_RULES} into ${UDEV}"
	@sudo cp $(FILE_RULES) $(UDEV)

reload:
	@echo "Reload usb config rules"
	@sudo udevadm control --reload-rules
	@sudo udevadm trigger

debug:
	@echo "Debug: Remove brltty (avoid tty conflict)"
	@sudo apt remove brltty
	@$(MAKE) reload
