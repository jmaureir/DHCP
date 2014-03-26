//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import inet.world.radio.ChannelControl;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.wireless.AccessPoint;
import inet.nodes.inet.WirelessHost;

import inet.nodes.ethernet.Eth100M;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;

import DHCPClient;
import inet.nodes.inet.Router;
//
// TODO auto-generated module
//
network DHCP_Test_1
{
    @display("bgb=590,407;bgl=2");
    int numWirelessHosts;

    submodules:
        channelControl: ChannelControl {
            @display("p=64,34");
            pMax = 100mW;
            numChannels = 5;
        }
        router: Router {
            @display("p=241,136");
            routingFile = "router.rt";
        }
        standardHost: StandardHost {
            @display("p=418,134");
            routingFile = "host.rt";
        }
        wirelessHost[numWirelessHosts]: WirelessHost {
            numUdpApps = 1;
            numPingApps = 1;
            udpApp[0].typename = "DHCPClient";
            @display("p=345,259");
        }
        wirelessRouter: WirelessHost {
            @display("p=154,207");
            routingFile = "wirelessRouter.rt";
            numUdpApps = 1;
            udpApp[0].typename = "DHCPServer";
            IPForward = true;
            networkLayer.proxyARP = true;
            wlan[0].mgmtType = default("Ieee80211MgmtAP");
            wlan[0].mgmt.encapDecap = "true";
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=71,374");
            config = xml("<config></config>\n");
            addStaticRoutes = false;
            addDefaultRoutes = false;
            addSubnetRoutes = false;
        }
    connections:
        standardHost.ethg++ <--> Eth100M <--> router.ethg++;
        wirelessRouter.ethg++ <--> Eth100M <--> router.ethg++;
}