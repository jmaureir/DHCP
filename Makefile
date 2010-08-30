#
# OMNeT++/OMNEST Makefile for DHCP
#
# This file was generated with the command:
#  opp_makemake -f --deep --nolink -O out -d src -L../inetmanet/out/$(CONFIGNAME)/src -L./out/$(CONFIGNAME)/src -linet -KINETMANET_PROJ=../inetmanet
#

# C++ include paths (with -I)
INCLUDE_PATH = -I. -Isimulations

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS =

# Message files
MSGFILES =

# Other makefile variables (-K)
INETMANET_PROJ=../inetmanet

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target

all: $(OBJS) submakedirs Makefile
	@# Do nothing

submakedirs:  src_dir

.PHONY: src
src: src_dir

src_dir:
	cd src && $(MAKE)

.SUFFIXES: .cc

$O/%.o: %.cc
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)
	cd src && $(MAKE) msgheaders

clean:
	-rm -rf $O
	-rm -f DHCP DHCP.exe libDHCP.so libDHCP.a libDHCP.dll libDHCP.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f simulations/*_m.cc simulations/*_m.h

	-cd src && $(MAKE) clean

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc simulations/*.cc
	-cd src && if [ -f Makefile ]; then $(MAKE) depend; fi

# DO NOT DELETE THIS LINE -- make depend depends on it.

