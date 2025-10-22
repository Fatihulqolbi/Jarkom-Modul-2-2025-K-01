# **No 7**

# Di TIRION INI YAA

Tambahkan ini di nano /etc/bind/jarkom/K01.com

```
www.K01.com.        IN      CNAME   sirion.K01.com.
static.K01.com.     IN      CNAME   lindon.K01.com.
app.K01.com.        IN      CNAME   vingilot.K01.com.
```

```
service bind9 restart
```

**Testing** 

```
dig www.K01.com
dig static.K01.com
dig app.K0.com
```

**JANGAN LUPA** 

**service bind9 restart**