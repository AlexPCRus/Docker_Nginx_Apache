FROM ubuntu
LABEL maintainer="AlexPC (alexmed2000@mail.ru)"
EXPOSE 8080 8081 8082
RUN apt-get update && apt-get upgrade 
RUN apt-get -y install systemctl
RUN apt-get -y install nginx
RUN apt-get -y install apache2
COPY ./settings/apache2/ports.conf /etc/apache2/ports.conf
COPY ./settings/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir -p /var/www/html/8081
RUN mkdir -p /var/www/html/8082
COPY ./settings/www/8081/index.html /var/www/html/8081/index.html
COPY ./settings/www/8082/index.html /var/www/html/8082/index.html
COPY ./settings/nginx/sites-available/default /etc/nginx/sites-available/default
COPY ./settings/nginx/sites-available/upstream /etc/nginx/sites-available/upstream
RUN ln -s /etc/nginx/sites-available/upstream /etc/nginx/sites-enabled/upstream
ENTRYPOINT systemctl start apache2 && systemctl start nginx.service && /bin/bash
