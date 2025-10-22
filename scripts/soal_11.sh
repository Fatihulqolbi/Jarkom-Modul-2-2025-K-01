apt-get update
apt-get install -y nginx

cat > /etc/nginx/sites-available/www.K01.com << 'EOF'
server {
    listen 80;
    server_name www.K01.com sirion.K01.com;
    
    location /static/ {
        proxy_pass http://lindon.K01.com/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
 
    location /app/ {
        proxy_pass http://vingilot.K01.com/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    location / {
        root /var/www/sirion;
        index index.html;
        try_files $uri $uri/ =404;
    }
}
EOF

ln -sf /etc/nginx/sites-available/www.K01.com /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

mkdir -p /var/www/sirion
cat > /var/www/sirion/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sirion Proxy</title>
    <style>
        body {
            background-color: #1a1a2e;
            color: #e0e0e0;
            font-family: 'Courier New', Courier, monospace;
            text-align: center;
            padding-top: 5%;
        }
        .container {
            max-width: 600px;
            margin: auto;
            border: 1px solid #0f3460;
            padding: 2rem;
            border-radius: 8px;
            background-color: #16213e;
        }
        h1 {
            color: #53a8b6;
        }
        a {
            color: #c7f9cc;
            text-decoration: none;
            display: block;
            margin: 0.5rem 0;
            font-size: 1.1em;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>[ Sirion Gateway ]</h1>
        <p>Proxy Server untuk Jaringan K01</p>
        <hr>
        <h3>Tujuan Tersedia:</h3>
        <a href="/static/">» /static/ (Menuju Lindon)</a>
        <a href="/app/">» /app/ (Menuju Vingilot)</a>
    </div>
</body>
</html>
EOF

# Set permissions
chown -R www-data:www-data /var/www/sirion

nginx -t
service nginx restart
service nginx status

# Test Sirion root
curl http://www.K01.com
curl http://sirion.K01.com

# Test static
curl http://www.K01.com/static/
curl http://www.K01.com/static/annals/

# Test app
curl http://www.K01.com/app/
curl http://www.K01.com/app/about

# Verifikasi 
curl -v http://www.K01.com/static/ 2>&1 | grep -i "host\|x-real-ip"
curl -v http://www.K01.com/app/ 2>&1 | grep -i "host\|x-real-ip"