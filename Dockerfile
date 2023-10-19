FROM opentracing/nginx-opentracing:nginx-1.23.4

COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY njs/util.js /etc/nginx/njs/util.js
COPY zipkin-config.json /etc/zipkin-nginx/zipkin-config.json