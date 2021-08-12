FROM finvmharborp01.finbel.intra/trv-base-images/nginx-unprivileged:1.18@sha256:73b2ce5d2a269af58ca2d858b0e895965c06c131689ed74334e3d67867e72783

# Files /usr/share/nginx/html/50x.html & /usr/share/nginx/html/index.html created by root user
#RUN rm -rf /usr/share/nginx/html/*

COPY ./src/docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./src/docker/config.json /config.json

#If the application is big, consider copying the images and other static assets first
COPY ./dist /usr/share/nginx/html

EXPOSE 8080

CMD /bin/sh -c "envsubst < ./config.json > /usr/share/nginx/html/assets/config.json && nginx -g 'daemon off;'"