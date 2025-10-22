# Config Eonwe

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.64.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.64.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.64.3.1
    netmask 255.255.255.0

up echo "nameserver 192.168.122.1" > /etc/resolv.conf


# Config Cirdan
auto eth0
iface eth0 inet static
    address 10.64.1.2
    netmask 255.255.255.0
    gateway 10.64.1.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf

# Config Elrond
auto eth0
iface eth0 inet static
    address 10.64.1.3
    netmask 255.255.255.0
    gateway 10.64.1.1
    dns-nameservers 10.64.3.6 10.64.3.5 192.168.122.1
    

# Config Maglor
auto eth0
iface eth0 inet static
    address 10.64.1.4
    netmask 255.255.255.0
    gateway 10.64.1.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Config Earendil
auto eth0
iface eth0 inet static
    address 10.64.2.2
    netmask 255.255.255.0
    gateway 10.64.2.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf



# Config Elwing
auto eth0
iface eth0 inet static
    address 10.64.2.3
    netmask 255.255.255.0
    gateway 10.64.2.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Config Sirion
auto eth0
iface eth0 inet static
    address 10.64.3.2
    netmask 255.255.255.0
    gateway 10.64.3.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Config Lindon
auto eth0
iface eth0 inet static
    address 10.64.3.3
    netmask 255.255.255.0
    gateway 10.64.3.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
# Config Vingilot
auto eth0
iface eth0 inet static
    address 10.64.3.4
    netmask 255.255.255.0
    gateway 10.64.3.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Config Tirion
auto eth0
iface eth0 inet static
    address 10.64.3.6
    netmask 255.255.255.0
    gateway 10.64.3.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
     up echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Config Valmar
auto eth0
iface eth0 inet static
    address 10.64.3.5
    netmask 255.255.255.0
    gateway 10.64.3.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
    dns-nameservers 10.64.3.6 10.64.3.5 192.168.122.1

