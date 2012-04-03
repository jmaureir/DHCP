#
# OMNeT++/OMNEST Makefile for libDHCP
#
# This file was generated with the command:
#  opp_makemake -f --deep --make-so -I../../inet-stable/src/networklayer/ldp -I../../inet-stable/src/networklayer/ipv6 -I../../inet-stable/src/base -I../../inet-stable/src/applications/udpapp -I../../inet-stable/src/linklayer/mfcore -I../../inet-stable/src/transport/udp -I../../inet-stable/src/linklayer/contract -I../../inet-stable/src/transport/contract -I../../inet-stable/src/networklayer/mpls -I../../inet-stable/src/transport/sctp -I../../inet-stable/src/applications/pingapp -I../../inet-stable/src/util/headerserializers -I../../inet-stable/src/networklayer/ipv4 -I../../inet-stable/src/networklayer/common -I../../inet-stable/src/networklayer/ted -I../../inet-stable/src/world -I../../inet-stable/src/networklayer/icmpv6 -I../../inet-stable/src/transport/tcp -I../../inet-stable/src/networklayer/contract -I../../inet-stable/src/networklayer/rsvp_te -I../../inet-stable/src/networklayer/arp -I../../inet-stable/src/util -L../../inet-stable/out/$(CONFIGNAME)/src -linet-stable -KINET_STABLE_PROJ=../../inet-stable
#

# Name of target to be created (-o option)
TARGET = libDHCP$(SHARED_LIB_SUFFIX)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I../../inet-stable/src/networklayer/ldp \
    -I../../inet-stable/src/networklayer/ipv6 \
    -I../../inet-stable/src/base \
    -I../../inet-stable/src/applications/udpapp \
    -I../../inet-stable/src/linklayer/mfcore \
    -I../../inet-stable/src/transport/udp \
    -I../../inet-stable/src/linklayer/contract \
    -I../../inet-stable/src/transport/contract \
    -I../../inet-stable/src/networklayer/mpls \
    -I../../inet-stable/src/transport/sctp \
    -I../../inet-stable/src/applications/pingapp \
    -I../../inet-stable/src/util/headerserializers \
    -I../../inet-stable/src/networklayer/ipv4 \
    -I../../inet-stable/src/networklayer/common \
    -I../../inet-stable/src/networklayer/ted \
    -I../../inet-stable/src/world \
    -I../../inet-stable/src/networklayer/icmpv6 \
    -I../../inet-stable/src/transport/tcp \
    -I../../inet-stable/src/networklayer/contract \
    -I../../inet-stable/src/networklayer/rsvp_te \
    -I../../inet-stable/src/networklayer/arp \
    -I../../inet-stable/src/util \
    -I.

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L../../inet-stable/out/$(CONFIGNAME)/src  -linet-stable
LIBS += -Wl,-rpath,`abspath ../../inet-stable/out/$(CONFIGNAME)/src`

# Output directory
PROJECT_OUTPUT_DIR = ../out
PROJECTRELATIVE_PATH = src
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = $O/DHCPServer.o $O/DHCPClient.o $O/DHCP_m.o

# Message files
MSGFILES = \
    DHCP.msg

# Other makefile variables (-K)
INET_STABLE_PROJ=../../inet-stable

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

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppenvir$D $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

# we want to recompile everything if COPTS changes,
# so we store COPTS into $COPTS_FILE and have object
# files depend on it (except when "make depend" was called)
COPTS_FILE = $O/.last-copts
ifneq ($(MAKECMDGOALS),depend)
ifneq ("$(COPTS)","$(shell cat $(COPTS_FILE) 2>/dev/null || echo '')")
$(shell $(MKPATH) "$O" && echo "$(COPTS)" >$(COPTS_FILE))
endif
endif

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(SHLIB_LD) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(AS_NEEDED_OFF) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS) $(LDFLAGS)
	$(SHLIB_POSTPROCESS) $O/$(TARGET)

.PHONY: all clean cleanall depend msgheaders

.SUFFIXES: .cc

$O/%.o: %.cc $(COPTS_FILE)
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f DHCP DHCP.exe libDHCP.so libDHCP.a libDHCP.dll libDHCP.dylib
	-rm -f ./*_m.cc ./*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/DHCPClient.o: DHCPClient.cc \
	Byte.h \
	DHCPClient.h \
	DHCPLease.h \
	DHCPOptions.h \
	DHCP_m.h \
	$(INET_STABLE_PROJ)/src/applications/udpapp/UDPAppBase.h \
	$(INET_STABLE_PROJ)/src/base/INETDefs.h \
	$(INET_STABLE_PROJ)/src/base/INotifiable.h \
	$(INET_STABLE_PROJ)/src/base/ModuleAccess.h \
	$(INET_STABLE_PROJ)/src/base/NotificationBoard.h \
	$(INET_STABLE_PROJ)/src/base/NotifierConsts.h \
	$(INET_STABLE_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/arp/ARP.h \
	$(INET_STABLE_PROJ)/src/networklayer/arp/ARPPacket_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPAddressResolver.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPRoute.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/RoutingTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INET_STABLE_PROJ)/src/transport/contract/UDPControlInfo_m.h
$O/DHCPServer.o: DHCPServer.cc \
	Byte.h \
	DHCPLease.h \
	DHCPOptions.h \
	DHCPServer.h \
	DHCP_m.h \
	$(INET_STABLE_PROJ)/src/applications/udpapp/UDPAppBase.h \
	$(INET_STABLE_PROJ)/src/base/INETDefs.h \
	$(INET_STABLE_PROJ)/src/base/INotifiable.h \
	$(INET_STABLE_PROJ)/src/base/ModuleAccess.h \
	$(INET_STABLE_PROJ)/src/base/NotificationBoard.h \
	$(INET_STABLE_PROJ)/src/base/NotifierConsts.h \
	$(INET_STABLE_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/arp/ARP.h \
	$(INET_STABLE_PROJ)/src/networklayer/arp/ARPPacket_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INET_STABLE_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPAddressResolver.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPRoute.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INET_STABLE_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INET_STABLE_PROJ)/src/transport/contract/UDPControlInfo_m.h
$O/DHCP_m.o: DHCP_m.cc \
	Byte.h \
	DHCPOptions.h \
	DHCP_m.h \
	$(INET_STABLE_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_STABLE_PROJ)/src/networklayer/contract/IPAddress.h

