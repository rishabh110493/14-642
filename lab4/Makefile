obj-m += motor.o
obj-m += motor_pwm.o
obj-m += encoder.o


RPI_SRC = ./rpi
LINUX_SRC = $(RPI_SRC)/linux
FIRMWARE_SRC = $(RPI_SRC)/firmware
CONFIG_FILE = raspbian.config
MOD_SRC = $(PWD)
JOBS = 2
TOOL_PREFIX = ../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-
MAKE_FLAGS = ARCH=arm CROSS_COMPILE=$(TOOL_PREFIX) -j $(JOBS) -C $(LINUX_SRC)

.PHONY: all linux sources doc clean

# build only this module against the kernel source with kernel tools
all: linux
	make $(MAKE_FLAGS) M=$(MOD_SRC) modules
	$(CC) testebbchar.c -o test

# build all modules and dependencies
linux: sources
	make $(MAKE_FLAGS) prepare
	make $(MAKE_FLAGS) scripts

# download and configure sources
# Moudle.symvers and .config are very important to building a module that will
# load in the running kernel. We use the config from an ARM7 kernel, so we use
# Module7.symvers to match.
ifeq ($(wildcard $(RPI_SRC)/*),)
sources: getconfigs
	@echo "Couldn't find linux sources. Will download and build now."
	./get_sources.sh
	@echo "Configuring linux sources..."
	make $(MAKE_FLAGS) mrproper
	cp $(FIRMWARE_SRC)/extra/Module7.symvers $(LINUX_SRC)/Module.symvers
	cp ./$(CONFIG_FILE) $(LINUX_SRC)/.config
	make $(MAKE_FLAGS) oldconfig
else
# but only if we haven't already
sources: getconfigs
	@echo "Found linux sources."
endif

ifeq ($(wildcard $(CONFIG_FILE)),)
getconfigs:
	@echo "Couldn't find \"$(CONFIG_FILE)\". We need the RPi's kernel configuration to continue!"
	exit 1
else
getconfigs:
	@echo "Found \"$(CONFIG_FILE)\"."
endif

doc:
	doxygen doxygen.conf

# just clean the kernel module
clean:
	# rm *.o *.ko *.mod.c *.order *.symvers
	make $(MAKE_FLAGS) M=$(MOD_SRC) clean

# also delete linux sources and docs
veryclean: clean
	rm -rf doc doxygen.warn
	rm -rf $(RPI_SRC)
