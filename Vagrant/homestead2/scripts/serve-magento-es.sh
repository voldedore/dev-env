#!/usr/bin/env bash

echo "Installation Magento vHost on nginx (Elastic Search)"
block="server {
    listen ${3:-80};
    server_name $1;
    root \"$2\";

    charset utf-8;

    # This is for FooMan Speedter
    rewrite /skin/m/([0-9]+)(/.*\.(js|css)) /lib/minify/m.php?f=\$2&d=\$1 last;

    location ~ ^/(app/|includes/|pkginfo/|var/|errors/local.xml|media/downloadable/) { deny all; }
    location ~ ^/lib/(?!minify/) { deny all; }
    location ~ /\. { deny all; }
    location / {
        index  index.php index.html index.htm;
        try_files \$uri \$uri/ @rewrite;
    }

    location @rewrite {
        #rewrite ^(/[a-zA-z0-9]+/)(.*) \$1/index.php/\$2;
        rewrite ^(.*) /index.php/\$1;
    }

    location ~ \.php/ { ## Forward paths like /js/index.php/x.js to relevant handler
        rewrite ^(.*.php)/ \$1;
    }

    #location = /favicon.ico { access_log off; log_not_found off; }
    #location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/$1-error.log error;

    #sendfile off;

    #client_max_body_size 100m;

    location ~ \.php$ {
        if (!-e \$request_filename) {
            rewrite / /index.php last;
        }
        fastcgi_split_path_info ^(.+\.php)(.*)$;
        fastcgi_pass  unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_script_name;
        try_files \$uri =404;
        fastcgi_send_timeout 36000;
        fastcgi_read_timeout 36000;
    }

    location ~ /\.ht {
        deny all;
    }
}
"
echo "$block" > "/etc/nginx/sites-available/$1"
ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
service nginx restart
service php5-fpm restart
service hhvm restart
