
- https://superuser.com/questions/175475/ip-address-alias-assigned-by-dhcp
- https://serverfault.com/questions/170185/ifconfig-alias-address-assigned-by-dhcp

```text
# ip link add link eth0 name eth1 address 00:11:22:33:44:55 type macvlan

# ifconfig -a
docker0   Link encap:Ethernet  HWaddr 02:42:70:1e:89:96
          inet addr:172.17.0.1  Bcast:0.0.0.0  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr ec:a8:6b:ff:b9:96
          inet addr:192.168.11.11  Bcast:192.168.11.255  Mask:255.255.255.0
          inet6 addr: fe80::eea8:6bff:feff:b996/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1762300 errors:0 dropped:6 overruns:0 frame:0
          TX packets:514225 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1382412817 (1.3 GB)  TX bytes:40939359 (40.9 MB)
          Interrupt:20 Memory:f7c00000-f7c20000

eth1      Link encap:Ethernet  HWaddr 00:11:22:33:44:55
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:2111618 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2111618 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:117970393 (117.9 MB)  TX bytes:117970393 (117.9 MB)

# dhclient eth1

# ifconfig
docker0   Link encap:Ethernet  HWaddr 02:42:70:1e:89:96
          inet addr:172.17.0.1  Bcast:0.0.0.0  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr ec:a8:6b:ff:b9:96
          inet addr:192.168.11.11  Bcast:192.168.11.255  Mask:255.255.255.0
          inet6 addr: fe80::eea8:6bff:feff:b996/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1762374 errors:0 dropped:14 overruns:0 frame:0
          TX packets:514297 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1382421088 (1.3 GB)  TX bytes:40952550 (40.9 MB)
          Interrupt:20 Memory:f7c00000-f7c20000

eth1      Link encap:Ethernet  HWaddr 00:11:22:33:44:55
          inet addr:192.168.11.17  Bcast:192.168.11.255  Mask:255.255.255.0
          inet6 addr: fe80::211:22ff:fe33:4455/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:33 errors:0 dropped:0 overruns:0 frame:0
          TX packets:46 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:4108 (4.1 KB)  TX bytes:8175 (8.1 KB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:2111682 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2111682 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:117974981 (117.9 MB)  TX bytes:117974981 (117.9 MB)

# ip link delete dev eth1

# ifconfig -a
docker0   Link encap:Ethernet  HWaddr 02:42:70:1e:89:96
          inet addr:172.17.0.1  Bcast:0.0.0.0  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr ec:a8:6b:ff:b9:96
          inet addr:192.168.11.11  Bcast:192.168.11.255  Mask:255.255.255.0
          inet6 addr: fe80::eea8:6bff:feff:b996/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1762948 errors:0 dropped:198 overruns:0 frame:0
          TX packets:514505 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1382482671 (1.3 GB)  TX bytes:40986486 (40.9 MB)
          Interrupt:20 Memory:f7c00000-f7c20000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:2112671 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2112671 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:118029053 (118.0 MB)  TX bytes:118029053 (118.0 MB)

# uname -a
Linux nuc54250b 4.4.0-116-generic #140~14.04.1-Ubuntu SMP Fri Feb 16 09:25:20 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

# lsb_release  -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:  Ubuntu 14.04.5 LTS
Release:  14.04
Codename: trusty
```
