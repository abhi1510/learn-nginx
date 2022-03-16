FROM nginx:1.19.10

# remove default config and html contents
RUN rm -f /etc/nginx/conf.d/* /usr/share/nginx/html/* /etc/nginx/mime.types

# copy mime types & configuration
COPY default.conf /etc/nginx/conf.d/
COPY mime.types /etc/nginx/

# copy the website
COPY website1 /usr/share/nginx/html/
COPY website2 /usr/share/nginx/website2/

# docker build -t nginx . (build image)
# docker run --name nginx -p 8080:80 -d nginx (run container)
