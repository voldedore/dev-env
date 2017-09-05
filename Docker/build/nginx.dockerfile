FROM nginx:1.12-alpine

#RUN mkdir /var/www/html

ADD ./default.conf /etc/nginx/conf.d/

EXPOSE 8080