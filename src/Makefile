#
# OMNeT++/OMNEST Makefile for libDHCP
#
# This file was generated with the command:
#  opp_makemake -f --deep --make-so -O out -I../../inetmanet/src/networklayer/arp -I../../inetmanet/src/transport/sctp -I../../inetmanet/src/transport/contract -I../../inetmanet/src/world -I../../inetmanet/src/linklayer/mfcore -I../../inetmanet/src/applications/udpapp -I../../inetmanet/src/util -I../../inetmanet/src/networklayer/ted -I../../inetmanet/src/linklayer/ieee80211/mac -I../../inetmanet/src/networklayer/ipv6 -I../../inetmanet/src/networklayer/common -I../../inetmanet/src/applications/pingapp -I../../inetmanet/src/networklayer/ldp -I../../inetmanet/src/transport/tcp -I../../inetmanet/src/util/headerserializers -I../../inetmanet/src/networklayer/rsvp_te -I../../inetmanet/src/transport/udp -I../../inetmanet/src/networklayer/ipv4 -I../../inetmanet/src/networklayer/icmpv6 -I../../inetmanet/src/base -I../../inetmanet/src/networklayer/contract -I../../inetmanet/src/networklayer/manetrouting/base -I../../inetmanet/src/networklayer/mpls -I../../inetmanet/src/linklayer/contract -L../../inetmanet/out/$(CONFIGNAME)/src -linet -KINETMANET_PROJ=../../inetmanet
#

# Name of target to be created (-o option)
TARGET = libDHCP$(SHARED_LIB_SUFFIX)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I../../inetmanet/src/networklayer/arp \
    -I../../inetmanet/src/transport/sctp \
    -I../../inetmanet/src/transport/contract \
    -I../../inetmanet/src/world \
    -I../../inetmanet/src/linklayer/mfcore \
    -I../../inetmanet/src/applications/udpapp \
    -I../../inetmanet/src/util \
    -I../../inetmanet/src/networklayer/ted \
    -I../../inetmanet/src/linklayer/ieee80211/mac \
    -I../../inetmanet/src/networklayer/ipv6 \
    -I../../inetmanet/src/networklayer/common \
    -I../../inetmanet/src/applications/pingapp \
    -I../../inetmanet/src/networklayer/ldp \
    -I../../inetmanet/src/transport/tcp \
    -I../../inetmanet/src/util/headerserializers \
    -I../../inetmanet/src/networklayer/rsvp_te \
    -I../../inetmanet/src/transport/udp \
    -I../../inetmanet/src/networklayer/ipv4 \
    -I../../inetmanet/src/networklayer/icmpv6 \
    -I../../inetmanet/src/base \
    -I../../inetmanet/src/networklayer/contract \
    -I../../inetmanet/src/networklayer/manetrouting/base \
    -I../../inetmanet/src/networklayer/mpls \
    -I../../inetmanet/src/linklayer/contract \
    -I.

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L../../inetmanet/out/$(CONFIGNAME)/src  -linet
LIBS += -Wl,-rpath,`abspath ../../inetmanet/out/$(CONFIGNAME)/src`

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
INETMANET_PROJ=../../inetmanet

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

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $(TARGET)

$(TARGET) : $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(SHLIB_LD) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(LIBS) $(OMNETPP_LIBS) $(LDFLAGS)
	$(SHLIB_POSTPROCESS) $O/$(TARGET)

.PHONY:

.SUFFIXES: .cc

$O/%.o: %.cc
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
$O/DHCPServer.o: DHCPServer.cc \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPRoute.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	Byte.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	DHCPOptions.h \
	DHCPServer.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INETMANET_PROJ)/src/applications/udpapp/UDPAppBase.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	DHCP_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddressResolver.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARPPacket_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	DHCPLease.h
$O/DHCP_m.o: DHCP_m.cc \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	Byte.h \
	DHCP_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	DHCPOptions.h
$O/DHCPClient.o: DHCPClient.cc \
	$(INETMANET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPv4InterfaceData.h \
	$(INETMANET_PROJ)/src/base/NotificationBoard.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTable.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceEntry.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPControlInfo.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPRoute.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/RoutingTableAccess.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram.h \
	Byte.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddress.h \
	$(INETMANET_PROJ)/src/base/INotifiable.h \
	$(INETMANET_PROJ)/src/base/ModuleAccess.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceTableAccess.h \
	$(INETMANET_PROJ)/src/transport/contract/UDPControlInfo_m.h \
	$(INETMANET_PROJ)/src/networklayer/common/InterfaceToken.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INETMANET_PROJ)/src/base/INETDefs.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARP.h \
	DHCPOptions.h \
	DHCPClient.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IPDatagram_m.h \
	$(INETMANET_PROJ)/src/applications/udpapp/UDPAppBase.h \
	$(INETMANET_PROJ)/src/networklayer/common/IInterfaceTable.h \
	DHCP_m.h \
	$(INETMANET_PROJ)/src/networklayer/ipv4/IRoutingTable.h \
	$(INETMANET_PROJ)/src/networklayer/contract/IPAddressResolver.h \
	$(INETMANET_PROJ)/src/base/NotifierConsts.h \
	$(INETMANET_PROJ)/src/networklayer/arp/ARPPacket_m.h \
	$(INETMANET_PROJ)/src/linklayer/contract/MACAddress.h \
	DHCPLease.h

