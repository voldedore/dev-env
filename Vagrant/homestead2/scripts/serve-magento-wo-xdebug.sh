#!/usr/bin/env bash
#!/usr/bin/env bash

echo "Installation Magento vHost on nginx (without xdebug)"

block="server {
    listen ${3:-88};
    server_name $1;
    root \"$2\";

	charset utf-8;
    access_log off;
    error_log  /var/log/nginx/$1-error.log error;

	location ~ ^/(app/|includes/|pkginfo/|var/|errors/local.xml|lib/|media/downloadable/) { deny all; }
	location ~ /\. { deny all; }
    location / {
        index  index.php index.html index.htm;
		try_files \$uri \$uri/ @rewrite;
    }

	location @rewrite {
        #rewrite ^(/[a-zA-z0-9]+/)(.*) \$1/index.php/\$2;
        rewrite ^(.*) /index.php/\$1;
	}

	## Forward paths like /js/index.php/x.js to relevant handler
	location ~ \.php/ {
		rewrite ^(.*.php)/ \$1;
	}


    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
	location ~ \.php$ {
		if (!-e \$request_filename) {
			rewrite / /index.php last;
		}
		fastcgi_split_path_info ^(.+\.php)(.*)$;
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
		fastcgi_param PATH_INFO \$fastcgi_script_name;
		try_files \$uri =404;
		fastcgi_read_timeout 3600;
	}

    # deny access to .htaccess files, if Apaches document root
    # concurs with nginx s one
    location ~ /\.ht {
        deny  all;
    }

    ssl_certificate     /etc/nginx/ssl/$1.crt;
    ssl_certificate_key /etc/nginx/ssl/$1.key;
}
"

echo "$block" > "/etc/nginx/sites-available/$1"
ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
service nginx restart
service hhvm restart
service php5-fpm restart
