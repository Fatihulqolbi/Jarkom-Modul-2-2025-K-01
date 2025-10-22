## **VALMAR**

## **nano /etc/bind/named.conf.local** 

zone "[K01.com](http://k01.com/)" {
type slave;
file "/etc/bind/jarkom/K01.com";
masters { 10.64.3.6; };
};

nano /etc/bind/named.conf.options

```
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};

```

**TIRION**

nano /etc/bind/jarkom/K01.com

```
;
; BIND data file for [k01.com](http://k01.com/)
;
$TTL    604800
@       IN      SOA     [K01.com](http://k01.com/). [ns1.K01.com](http://ns1.k01.com/). (
2025101201 ; Serial
604800     ; Refresh
86400      ; Retry
2419200    ; Expire
604800 )   ; Negative Cache TTL
;
; Name Servers
@       IN      NS      [ns1.K01.com](http://ns1.k01.com/).
@       IN      NS      [ns2.K01.com](http://ns2.k01.com/).
@       IN      A       10.64.3.2;
ns1     IN      A       10.64.3.6   ; Tirion
ns2     IN      A       10.64.3.5   ; Valmar
```

nano /etc/bind/named.conf.options

```
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };
};
```

**nano /etc/bind/named.conf.local** 

```
zone "[K01.com](http://k01.com/)" {
type master;
file "/etc/bind/jarkom/K01.com";
allow-transfer { 10.64.3.5; };  // IP Valmar
also-notify { 10.64.3.5; };      // Notify Valmar
};
```

**JANGAN LUPA** 

**service bind9 restart**