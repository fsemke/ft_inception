# ft_inception
This project aims to broaden the knowledge of system administration by using Docker and docker-compose.
We virtualize several Docker images, to create a working wordpress Website.

## I used 3 Different Containers
### Nginx
As Webserver that accepts only connections over Port 443 (https) with a self signed certificate created directly in this container.
### MariaDB
The content from wordpress will be saved and managed with MariaDB. It's a SQL-Database that saves all the information on a volume on the Host-Machine.
### Wordpress
Wordpress is the most popular CMS (Content-Management-System). It's a simple tool to create a website or a blog.
