**Tambahkan ke Setiap Node**

```
# Node Eonwe
echo "eonwe" > /etc/hostname
hostname -F /etc/hostname

# Node Earendil
echo "earendil" > /etc/hostname
hostname -F /etc/hostname

# Node Elwing
echo "elwing" > /etc/hostname
hostname -F /etc/hostname

# Node Cirdan
echo "cirdan" > /etc/hostname
hostname -F /etc/hostname

# Node Elrond
echo "elrond" > /etc/hostname
hostname -F /etc/hostname

# Node Maglor
echo "maglor" > /etc/hostname
hostname -F /etc/hostname

# Node Sirion
echo "sirion" > /etc/hostname
hostname -F /etc/hostname

# Node Tirion
echo "tirion" > /etc/hostname
hostname -F /etc/hostname

# Node Valmar
echo "valmar" > /etc/hostname
hostname -F /etc/hostname

# Node Lindon
echo "lindon" > /etc/hostname
hostname -F /etc/hostname

# Node Vingilot
echo "vingilot" > /etc/hostname
hostname -F /etc/hostname
```

nano /etc/bind/jarkom/K01.com

```
Dan ubah di atas

ns1.K01.com. admin.K01.com.

TAmbahkan Ini

eonwe.K01.com.      IN      A       10.64.1.1
earendil.K01.com.   IN      A       10.64.2.2
elwing.K01.com.     IN      A       10.64.2.3
cirdan.K01.com.     IN      A       10.64.1.2
elrond.K01.com.     IN      A       10.64.1.3
maglor.K01.com.     IN      A       10.64.1.4
sirion.K01.com.     IN      A       10.64.3.2
lindon.K01.com.     IN      A       10.64.3.3
vingilot.K01.com.   IN      A       10.64.3.4
```

**Testing ( BEBAS NODE MANA PUN )**

```
ping maglor.K01.com.
```

**JANGAN LUPA** 

**service bind9 restart**