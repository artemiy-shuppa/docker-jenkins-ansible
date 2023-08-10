FROM ubuntu 

RUN apt-get update && apt-get install apache2 -y
CMD service apache2 start 

COPY ./webSite/ /var/www/html/

CMD apachectl -D FOREGROUND
EXPOSE 80
