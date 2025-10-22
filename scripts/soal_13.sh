# Menimpa file konfigurasi Nginx dengan aturan kanonisasi baru
cat > /etc/nginx/sites-available/www.K01.com << EOF
# Blok Server 1: Menangkap semua permintaan non-resmi
# Tugas blok ini hanya untuk mengalihkan (redirect) trafik.
server {
    listen 80;
    # Mendengarkan pada IP address dan hostname sirion.K01.com
    server_name 10.64.3.2 sirion.K01.com;
    
    # Mengalihkan permanen (301) ke hostname resmi www.K01.com
    # Variabel $request_uri memastikan path asli tetap disertakan.
    return 301 http://www.K01.com\$request_uri;
}

# Blok Server 2: Melayani konten dari hostname resmi
# Blok ini berisi semua logika aplikasi (proxy, auth, dll).
server {
    listen 80;
    # Hanya merespons pada hostname kanonik www.K01.com
    server_name www.K01.com;
    
    # Konfigurasi untuk Basic Auth di /admin/
    location /admin/ {
        auth_basic "Area Terbatas - Admin K01";
        auth_basic_user_file /etc/nginx/.htpasswd;
        
        alias /var/www/sirion/admin/;
        index index.html;
    }
    
    # Pengalihan dari /admin ke /admin/
    location = /admin {
        return 301 /admin/;
    }
    
    # Aturan reverse proxy untuk konten statis
    location /static/ {
        proxy_pass http://lindon.K01.com/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
    
    # Aturan reverse proxy untuk aplikasi
    location /app/ {
        proxy_pass http://vingilot.K01.com/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
    
    # Konfigurasi untuk halaman utama
    location / {
        root /var/www/sirion;
        index index.html;
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Uji sintaks untuk memastikan tidak ada error
nginx -t

# Terapkan konfigurasi baru tanpa menghentikan layanan
service nginx reload

# Verifikasi 1: Akses via IP harus dialihkan
curl -I http://$IP_SIRION/

# Verifikasi 2: Akses via sirion.K01.com harus dialihkan
curl -I http://sirion.K01.com/

# Verifikasi 3: Akses via www.K01.com harus langsung berhasil (200 OK)
curl -I http://www.K01.com/

# Verifikasi 4: Pengalihan harus mempertahankan path URL
curl -I http://$IP_SIRION/static/
curl -I http://sirion.K01.com/app/