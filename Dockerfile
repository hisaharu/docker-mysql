FROM ubuntu
RUN : \
 && apt-get update \
 && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
 && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
 && apt-get -y --no-install-recommends install mysql-server \
 && :
RUN : \
 && mysqld_safe & : \
 && sleep 10 \
 && echo "grant all on *.* to root@'localhost' identified by 'root' with grant option" | mysql -uroot -proot \
 && :
CMD ["mysqld"]

