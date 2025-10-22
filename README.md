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
