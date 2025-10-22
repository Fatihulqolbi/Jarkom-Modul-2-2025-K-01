# Jarkom-Modul-2-2025-K-01

### SOAL 1

## SCRIPT

```
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

```

## HASIL TOPOLOGI
<img width="1395" height="807" alt="Screenshot 2025-10-22 231248" src="https://github.com/user-attachments/assets/a7a5dc92-e575-4cf7-8a72-386c60b2e19c" />

### Soal 2

## SCRIPT
```
# DI EONWE 

apt update
apt install -y procps iptables

iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT

TESTING 

ping 8.8.8.8
ping google.com
```

## UJI COBA
<img width="822" height="379" alt="image" src="https://github.com/user-attachments/assets/28df6d2e-151d-4590-a932-10b644ad6f77" />

### Soal 3

## SCRIPT
```
KARENA SOAL NO 2 , SUDAH TERMASUK NO 3 

JADI UNTUK SOAL NO 3 Kita TESTING AJA

# Dari earendil / elwing

ping 10.64.1.2
ping 10.64.1.3
ping 10.64.1.4

UNTUK YANG LAIN SESUAIKAN DENGAN SOAL SEPERTI DARI BARAT KE TIMUR , TIMUR KE BARAT, Dll
```

## UJI COBA
<img width="668" height="513" alt="image" src="https://github.com/user-attachments/assets/0acf2ab6-b90d-4f33-9d44-2bf9534ef87b" />

### Soal 4

## SCRIPT
```
**VALMAR**

apt-get update
apt-get install -y bind9 dnsutils

**nano /etc/bind/named.conf.local** 

ISI DENGAN INI
zone "[K01.com](http://k01.com/)" {
type slave;
file "/etc/bind/jarkom/K01.com";
masters { 10.64.3.6; };
};

nano /etc/bind/named.conf.options

``
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};

``

**TIRION**

apt-get update
apt-get install -y bind9 dnsutils

mkdir -p /etc/bind/jarkom

nano /etc/bind/jarkom/K01.com

``
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
``

nano /etc/bind/named.conf.options

``
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };
};
``

**nano /etc/bind/named.conf.local** 

``
zone "[K01.com](http://k01.com/)" {
type master;
file "/etc/bind/jarkom/K01.com";
allow-transfer { 10.64.3.5; };  // IP Valmar
also-notify { 10.64.3.5; };      // Notify Valmar
};
``

JANGAN LUPA TAMBAHKAN DI SETIAP NODE 
nano /etc/resolv.conf

nameserver 10.64.3.6
nameserver 10.64.3.5
nameserver 192.168.122.1
```

## UJI COBA
<img width="742" height="510" alt="image" src="https://github.com/user-attachments/assets/70fe0606-c8fc-4225-b392-32c64dc43b42" />

### Soal 5

## SCRIPT

```
**Tambahkan ke Setiap Node**

``
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
``

nano /etc/bind/jarkom/K01.com

``
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
``

**Testing ( BEBAS NODE MANA PUN )**

``
ping maglor.K01.com.
``

**JANGAN LUPA** 

**service bind9 restart**
```
## UJI COBA

<img width="594" height="175" alt="image" src="https://github.com/user-attachments/assets/0ab21a65-6177-416a-b977-584398c9cf9f" />

### Soal 6

## SCRIPTS
```
UJI COBA UNTUK SOA DI VELMAR DAN TIRION
dig @10.64.3.5 K01.com SOA
dig @10.64.3.6 K01.com SOA
```

## UJI COBA
<img width="1912" height="632" alt="image" src="https://github.com/user-attachments/assets/a6069352-294c-4e4a-bd05-e8a13db97a62" />

### Soal 7

## SCRIPTS
```
# Di TIRION INI YAA

Tambahkan ini di nano /etc/bind/jarkom/K01.com

``
www.K01.com.        IN      CNAME   sirion.K01.com.
static.K01.com.     IN      CNAME   lindon.K01.com.
app.K01.com.        IN      CNAME   vingilot.K01.com.
``

JANGAN LUPA RESTART
``
service bind9 restart
ATAU
service named restart
``

**Testing**

# Node Earendil
dig www.K01.com A +short
dig static.K01.com A +short
dig app.K01.com A +short

# Node Cirdan
dig www.K01.com A +short
dig static.K01.com A +short
dig app.K01.com A +short
```

## UJI COBA
<img width="422" height="189" alt="image" src="https://github.com/user-attachments/assets/61f2c340-05df-4220-80a9-1d478accf356" />


### Soal 8

## SCRIPTS
```
# Di TIRION INI YAA

Tambahkan Zone Baru Untuk Reverse Zone

nano /etc/bind/named.conf.local

``
zone "3.64.10.in-addr.arpa" {
type master;
file "/etc/bind/jarkom/10.64.3";
allow-transfer { 10.64.3.5; };  // IP Valmar
also-notify { 10.64.3.5; };
notify yes;
};
``

nano /etc/bind/jarkom/10.64.3

``
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
``

**VALMAR** 

nano /etc/bind/named.conf.local

``
zone "3.64.10.in-addr.arpa" {
type master;
file "/etc/bind/jarkom/10.64.3";
allow-transfer { 10.64.3.5; };  // IP Valmar
also-notify { 10.64.3.5; };
notify yes;
};
``

**Testing**
dig -x 10.64.3.2
dig -x 10.64.3.3
dig -x 10.64.3.4
```

## UJI COBA
<img width="568" height="936" alt="image" src="https://github.com/user-attachments/assets/cee556c5-1a1a-4df1-b4cd-ca9f0e83b355" />


### Soal 9

## SCRIPTS

```
Ini Kita mulai Menjelajah Ke port baru janlup Update

``
apt-get update
apt-get install bind9 -y
apt-get install -y nginx
``

# Node Lindon
nano /etc/nginx/jarkom/static.K01.com
server {
    listen 80;
    server_name static.K01.com lindon.K01.com;
    
    root /var/www/static;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    location /annals/ {
        alias /var/www/static/annals/;
        autoindex on;
        autoindex_exact_size off;
        autoindex_localtime on;
    }
}

# Node Lindon
ln -sf /etc/nginx/jarkom/static.K01.com /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

mkdir -p /var/www/static/annals

echo "<h1>Welcome to Lindon - Static Archives</h1>" > /var/www/static/index.html
echo "Archive 1: The Fall of Beleriand" > /var/www/static/annals/archive1.txt
echo "Archive 2: The Ships of Cirdan" > /var/www/static/annals/archive2.txt
echo "Archive 3: The Grey Havens" > /var/www/static/annals/archive3.txt

nginx -t
service nginx restart

# Test dari Node mana aja
curl http://static.K01.com
curl http://static.K01.com/annals/
```

## UJI COBA
<img width="1029" height="210" alt="image" src="https://github.com/user-attachments/assets/9c60a43b-e922-41d4-aafe-45370af8ef9b" />


### Soal 10

## SCRIPTS

```
# Di VINGILOT INI YAA

Ini Kita mulai Menjelajah Ke port baru janlup Update

``
apt-get update
apt-get install -y nginx php8.4-fpm
``

``
nano /etc/nginx/sites-available/app.K01.com

server {
    listen 80;
    server_name app.K01.com vingilot.K01.com;
    
    root /var/www/app;
    index index.php;
    
    location / {
        try_files $uri $uri/ @rewrite;
    }
    
    location @rewrite {
        rewrite ^/(.+)$ /$1.php last;
    }
    
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    
    location ~ /\.ht {
        deny all;
    }
}

# Node Vingilot
ln -sf /etc/nginx/sites-available/app.K01.com /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

mkdir -p /var/www/app

nano /var/www/app/index.php
****
<!DOCTYPE html>
<html>
<head>
    <title>Vingilot - Dynamic Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        h1 { margin-bottom: 10px; }
        .info { background: rgba(255,255,255,0.1); padding: 15px; border-radius: 5px; margin: 20px 0; }
        a { color: #ffd700; }
    </style>
</head>
<body>
    <h1>Welcome to Vingilot</h1>
    <p>The ship that sails through dynamic waters</p>
    
    <div class="info">
        <h2>Server Information</h2>
        <p><strong>Server Time:</strong> <?php echo date('Y-m-d H:i:s'); ?></p>
        <p><strong>Client IP:</strong> <?php echo $_SERVER['REMOTE_ADDR']; ?></p>
        <p><strong>User Agent:</strong> <?php echo $_SERVER['HTTP_USER_AGENT']; ?></p>
    </div>
    
    <p><a href="/about">Learn more about Vingilot</a></p>
</body>
</html>

nano /var/www/app/about.php

<!DOCTYPE html>
<html>
<head>
    <title>About Vingilot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        h1 { margin-bottom: 10px; }
        .content { background: rgba(255,255,255,0.1); padding: 20px; border-radius: 5px; margin: 20px 0; }
        a { color: #ffd700; }
    </style>
</head>
<body>
    <h1>About Vingilot</h1>
    
    <div class="content">
        <h2>The Star Ship</h2>
        <p>Vingilot adalah kapal yang dipandu oleh Earendil, membawa Silmaril melintasi langit sebagai bintang paling terang.</p>
        
        <h3>Technical Details</h3>
        <p><strong>Powered by:</strong> PHP <?php echo phpversion(); ?></p>
        <p><strong>Server:</strong> Nginx</p>
        <p><strong>Current Path:</strong> <?php echo $_SERVER['REQUEST_URI']; ?></p>
        <p><strong>Access Time:</strong> <?php echo date('Y-m-d H:i:s'); ?></p>
    </div>
    
    <p><a href="/">Back to Home</a></p>
</body>
</html>

# Node Vingilot
chown -R www-data:www-data /var/www/app
nginx -t
service nginx restart
service php8.4-fpm restart
``

**Testing**
# Test dari Node MANA AJA
curl http://app.K01.com
curl http://app.K01.com/about
```

## UJI COBA
<img width="806" height="831" alt="image" src="https://github.com/user-attachments/assets/7146fbac-89ee-4a50-8993-673cf56e3e62" />


### Soal 11

`/static/ $\rightarrow$` diarahkan ke server Lindon.
`/app/ $\rightarrow$` diarahkan ke server Vingilot.
Meneruskan header Host dan X-Real-IP.
Menerima permintaan untuk www.K01.com dan sirion.K01.com.

Implementasi ini dicapai dengan membuat satu blok server di Nginx yang menangani kedua hostname yang diminta:
```
server {
    listen 80;
    server_name www.K01.com sirion.K01.com;
    ...
}
```
`server_name www.K01.com sirion.K01.com;`: Direktif ini memenuhi syarat agar Nginx merespons kedua nama domain tersebut.

Di dalam blok server ini, path-based routing diimplementasikan menggunakan blok location
``` 
location /static/ {
        proxy_pass http://lindon.K01.com/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
```
`location /static/`: Mencocokkan setiap permintaan yang URL-nya diawali dengan `/static/`. 

`proxy_pass http://lindon.K01.com/;`: Ini adalah perintah inti reverse proxy. Nginx akan mengambil permintaan klien dan meneruskannya ke alamat `http://lindon.K01.com/`. Tanda `/` di akhir URL `proxy_pass` penting untuk memetakan path dengan benar.

`proxy_set_header Host $host;`: Memenuhi syarat penerusan header Host. Ini mengambil header Host asli dari permintaan klien (misalnya, `www.K01.com`) dan meneruskannya ke Lindon.

`proxy_set_header X-Real-IP $remote_addr;`: Memenuhi syarat penerusan `X-Real-IP`. Ini membuat header baru bernama `X-Real-IP` yang diisi dengan alamat IP asli klien (tersimpan di variabel Nginx `$remote_addr`), sehingga Lindon dapat mengetahui siapa pengunjung aslinya.

Blok `location /app/ { ... }` bekerja dengan cara yang sama, namun mengarahkan lalu lintas ke `http://vingilot.K01.com/` sesuai permintaan soal.


### Soal 12

Pembuatan Kredensial:
```
apt-get install -y apache2-utils
htpasswd -c -b /etc/nginx/.htpasswd admin admin123
```

`apache2-utils` diinstal untuk mendapatkan utilitas htpasswd.

`htpasswd` digunakan untuk membuat file `/etc/nginx/.htpasswd`. File ini berisi username `(admin)` dan password `(admin123)` yang sudah di-hash (dienkripsi).

Konfigurasi Nginx: Blok `location /admin/` baru ditambahkan ke file konfigurasi Sirion:
```
location /admin/ {
    auth_basic "Restricted Access - Admin Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    alias /var/www/sirion/admin/;
    index index.html;
}
```

`auth_basic "..."`: Ini adalah direktif yang mengaktifkan HTTP Basic Authentication dan menetapkan pesan yang akan ditampilkan pada dialog login.

`auth_basic_user_file /etc/nginx/.htpasswd;`: Ini adalah direktif kunci. Ini memberitahu Nginx untuk memvalidasi username dan password yang dimasukkan klien terhadap file kredensial yang kita buat sebelumnya.

`alias /var/www/sirion/admin/;`: Berbeda dengan proxy, alias memberitahu Nginx untuk menyajikan konten dari direktori lokal di server Sirion itu sendiri.

Verifikasi menggunakan `curl` mengkonfirmasi bahwa akses tanpa kredensial atau dengan kredensial salah mengembalikan kode status 401, dan akses dengan kredensial benar men


### Soal 13

Solusi ini dicapai dengan memisahkan file konfigurasi menjadi dua blok `server` yang berbeda, masing-masing dengan tugas spesifik:

Blok Server 1 (Pengalih / Redirector):
```
server {
    listen 80;
    server_name 10.64.3.2 sirion.K01.com;
    return 301 http://www.K01.com$request_uri;
}
```

`server_name 10.64.3.2 sirion.K01.com;`: Blok ini secara khusus "menangkap" semua lalu lintas yang masuk ke alamat IP server `(10.64.3.2)` atau hostname non-resmi `(sirion.K01.com)`.

`return 301 http://www.K01.com$request_uri;`: Ini adalah satu-satunya perintah di blok ini.

`return 301`: Mengirim respons "Moved Permanently", yang memberitahu browser/klien bahwa alamat ini telah pindah secara permanen.

`http://www.K01.com`: Alamat kanonik (resmi) yang baru.

`$request_uri`: Variabel Nginx ini sangat penting. Ia menyimpan path asli yang diminta (misalnya, `/app/` atau `/static/`). Dengan menambahkannya, pengguna yang mengakses `http://10.64.3.2/app/` akan dialihkan dengan benar ke `http://www.K01.com/app/`, bukan hanya ke halaman utama.

Blok Server 2 (Kanonik / Pelayan Konten):
```
server {
    listen 80;
    server_name www.K01.com;

    # ... (Semua konfigurasi /admin, /static, /app) ...
}
```
Blok `server` kedua (yang berisi semua logika `location` dari soal 11 dan 12) kini diubah `server_name`-nya menjadi hanya `www.K01.com`.

Ini memastikan bahwa konten aplikasi hanya akan disajikan jika diakses melalui hostname resmi.

Verifikasi menggunakan curl -I mengkonfirmasi bahwa akses ke IP dan `sirion.K01.com` mengembalikan status 301, sementara akses ke `www.K01.com` mengembalikan status 200 OK.

