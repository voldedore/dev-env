FROM nginx:1.12-alpine

# environment
#ARG LOCAL_UID
#ENV LOCAL_UID $LOCAL_UID

#RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
#RUN apk --no-cache add shadow && usermod -u $LOCAL_UID nginx

ADD ./default.conf /etc/nginx/conf.d/

EXPOSE 7777
EXPOSE 5555
