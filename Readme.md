#clean everything

docker system prune -a
docker volume prune -a

docker run -d --name mariadb_c mariadb -e SQL_DATABASE=yourdb -e SQL_USER=youruser -e SQL_PASSWORD=yourpass -e SQL_ROOT_PASSWORD=yourrootpass

wp core install --url=www.test.com --title=WPTITLE --admin_user=WPADMIN --admin_password=WPPASSWORD --admin_email=stuartrapop@gmail.com --skip-email --allow-root

#allow url mapping
edit /etc/hosts
add
127.0.0.1 www.srapopor.42.fr srapopor.42.fr

how to add docker to virtualbox
https://medium.com/@abhi.in/how-to-install-docker-on-local-virtual-machine-caa7979f60b4
