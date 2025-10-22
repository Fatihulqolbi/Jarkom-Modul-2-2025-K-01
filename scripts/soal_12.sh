apt-get update
apt-get install -y apache2-utils

# Buat password file dengan user 'admin' dan password 'admin123'
htpasswd -c -b /etc/nginx/.htpasswd admin admin123

# Set permissions untuk keamanan
chmod 644 /etc/nginx/.htpasswd
chown www-data:www-data /etc/nginx/.htpasswd

cat > /etc/nginx/sites-available/www.K01.com << 'EOF'
server {
    listen 80;
    server_name www.K01.com sirion.K01.com;
    
    # Melindungi /admin/ dengan Basic Auth
    location /admin/ {
        auth_basic "Restricted Access - Admin Area";
        auth_basic_user_file /etc/nginx/.htpasswd;
        
        # Menyajikan konten admin dari direktori lokal di Sirion
        alias /var/www/sirion/admin/;
        index index.html;
    }
    
    # Redirect /admin ke /admin/ (Best Practice)
    location = /admin {
        return 301 /admin/;
    }
    
    # Proxy ke Lindon (Static)
    location /static/ {
        proxy_pass http://lindon.K01.com/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    # Proxy ke Vingilot (App)
    location /app/ {
        proxy_pass http://vingilot.K01.com/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    # Halaman utama Sirion
    location / {
        root /var/www/sirion;
        index index.html;
        try_files $uri $uri/ =404;
    }
}
EOF

# Buat direktori dan halaman admin
mkdir -p /var/www/sirion/admin

# Buat konten HTML yang unik untuk halaman admin
cat > /var/www/sirion/admin/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <style>
        body {
            background-color: #121212;
            color: #00ff00;
            font-family: 'Consolas', 'Menlo', 'monospace';
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .panel {
            border: 2px solid #00ff00;
            padding: 30px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0, 255, 0, 0.3);
        }
        h1 {
            margin: 0;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="panel">
        <h1>ACCESS GRANTED</h1>
        <p>Welcome to the Sirion administrative console.</p>
    </div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data /var/www/sirion

nginx -t
service nginx reload

# Test 1: Tanpa kredensial (harus 401 Unauthorized)
curl -i http://www.K01.com/admin/

# Test 2: Dengan kredensial salah (harus 401 Unauthorized)
curl -i -u admin:wrongpass http://www.K01.com/admin/

# Test 3: Dengan kredensial benar (harus 200 OK dan menampilkan HTML admin)
curl -u admin:admin123 http://www.K01.com/admin/

# Test 4: Path lain tidak terproteksi
curl http://www.K01.com/
curl http://www.K01.com/static/
curl http://www.K01.com/app/