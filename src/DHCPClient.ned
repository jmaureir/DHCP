//
// DHCP Client
//
// Juan-Carlos Maureira
// INRIA 2008

package DHCP;

import inet.applications.udpapp.UDPApp;

simple DHCPClient like UDPApp
{
    parameters:
        string iface = default("wlan");
        double startingTime @unit("s") = default(0s); // dhcp request starting. 0 to disable it
        @display("i=device/card");
    gates:
        input udpIn;
        output udpOut;
}



