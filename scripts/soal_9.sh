Di LINDON INI YAA

Ini Kita mulai Menjelajah Ke port baru janlup Update

apt-get update
apt-get install bind9 -y
apt-get install -y nginx


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



TEST DARI NODE MANAPUN 
curl http://static.K01.com
curl http://static.K01.com/annals/

