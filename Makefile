###############################################################
# @author: QuocBuu
# @date: 29/02/2024
###############################################################

FILE_RULES = 50-usb-conf.rules

all: install $(FILE_RULES)

install:
	@cp $(FILE_RULES) /etc/udev/rules.d