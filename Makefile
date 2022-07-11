#
#
#
.PHONY: install blank unblank moderne

BASE = /home/putnamjm

PACKAGES = $(BASE)/moderne/modules:$(BASE)/.local/lib/python3.9/site-packages

install:
	@sudo apt install -y python3-pip pigpiod
	@pip3 install pigpio dbus-python
	@sudo make -C ../service install

unblank:
	@sudo env "PYTHONPATH=$(PACKAGES)" python3 unblank.py

blank:
	@sudo env "PYTHONPATH=$(PACKAGES)" python3 blank.py

moderne:
	@sudo env "PYTHONPATH=$(PACKAGES)" python3 moderne.py

