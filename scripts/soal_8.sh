**No 8**

# Di TIRION INI YAA

Tambahkan Zone Baru Untuk Reverse Zone

```
zone "3.64.10.in-addr.arpa" {
type master;
file "/etc/bind/jarkom/10.64.3";
allow-transfer { 10.64.3.5; };  // IP Valmar
also-notify { 10.64.3.5; };
notify yes;
};
```

nano /etc/bind/jarkom/10.64.3

```
;
; BIND reverse data file for 10.64.3.0/24
;
$TTL 604800
@ IN SOA ns1.K01.com. root.K01.com. (
    2025101101 ; Serial
    604800 ; Refresh
    86400  ; Retry
    2419200 ; Expire
    604800 ) ; Negative Cache TTL
;
; Name Servers
@ IN NS ns1.K01.com.
@ IN NS ns2.K01.com.

; PTR Records
2       IN      PTR     sirion.K01.com.
3       IN      PTR     lindon.K01.com.
4       IN      PTR     vingilot.K01.com.
```

**Testing** 

```
dig -x 10.64.3.2
dig -x 10.64.3.3
dig -x 10.64.3.4
```

**INTINYA NO ERROR** 

**JANGAN LUPA** 

**service bind9 restart**

<aside>

Notes

**No 9**

# Di LINDON INI YAA

Ini Kita mulai Menjelajah Ke port baru janlup Update

```
apt-get update
apt-get install -y nginx
```

nano /etc/bind/jarkom/10.64.3

```
;
; BIND reverse data file for 10.64.3.0/24
;
$TTL 604800
@ IN SOA ns1.K01.com. root.K01.com. (
    2025101101 ; Serial
    604800 ; Refresh
    86400  ; Retry
    2419200 ; Expire
    604800 ) ; Negative Cache TTL
;
; Name Servers
@ IN NS ns1.K01.com.
@ IN NS ns2.K01.com.

; PTR Records
2       IN      PTR     sirion.K01.com.
3       IN      PTR     lindon.K01.com.
4       IN      PTR     vingilot.K01.com.
```

**Testing** 

```
dig -x 10.64.3.2
dig -x 10.64.3.3
dig -x 10.64.3.4
```

**INTINYA NO ERROR** 

**JANGAN LUPA** 

**service bind9 restart**

</aside>