# Jarkom-Modul-2-2025-K-01

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

