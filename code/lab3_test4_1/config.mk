###########################################################################
# This is the user project configuration file for the makefile.
# You should have to edit only this file to get things to build.
# This file is included when USER_PROJ is set to the parent directory of this
# file. you should set that variable in the Makefile first before editing
# this file.
#
# Available Variables:
#
# USER_PROJ - readable user project path this config file belongs to
# USER_PROJ_INC - settable list of paths to look for include files in
# USER_PROJ_CCFLAGS - settable list of flags to send to the compiler & assembler
# USER_PROJ_ASFLAGS - settable list of flags to send to the assembler only
# USER_PROJ_LDFLAGS - settable list of flags to send to the linker
# USER_PROJ_LIBS - settable list of library files to link
# U_C_SRC - settable list of c source files to compile
# U_AS_SRC - settable list of asm source files to compile
#
###########################################################################

# Enable debug symbols
USER_PROJ_CCFLAGS = -g

###########################################################################
# User program include directories
###########################################################################
# A list of all include directories where you have .h files
# ex: USER_PROJ_INC += $(USER_PROJ_INC)/inc/

USER_PROJ_INC = newlib/349include
USER_PROJ_INC += $(USER_PROJ)/include

###########################################################################
# C source code files
###########################################################################
# A list of the C files you want compiled
# ex: U_C_SRC += $(USER_PROJ)/src/file.c

U_C_SRC += $(USER_PROJ)/src/main.c

###########################################################################
# Assembly source files
###########################################################################
# A list of the ARM assembly files you want compiled
# ex: U_AS_SRC += $(USER_PROJ)/src/file.S

U_AS_SRC += newlib/349include/swi_stubs.S
U_AS_SRC += newlib/349include/crt0.S

###########################################################################
# Library files
###########################################################################
# A list of library files to be linked in
# ex: USER_PROJ_LIBS += library/file.a

USER_PROJ_LIBS += newlib/libm.a
USER_PROJ_LIBS += newlib/libc.a
