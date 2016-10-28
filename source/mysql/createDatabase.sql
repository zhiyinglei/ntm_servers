grant all privileges on *.* to 'root'@'%' identified by '1';
grant all privileges on *.* to 'root'@'localhost' identified by '1';
CREATE DATABASE reactor;
CREATE USER 'reactor'@'localhost' IDENTIFIED BY 'p@ssword';
GRANT ALL ON reactor.* TO 'reactor'@'localhost';
CREATE USER 'reactor'@'%' IDENTIFIED BY 'p@ssword';
GRANT ALL ON reactor.* TO 'reactor'@'%';
