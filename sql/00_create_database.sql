DROP DATABASE IF EXISTS `private_data`;
CREATE DATABASE `private_data`;

CREATE USER 'revolee'@'localhost' IDENTIFIED WITH mysql_native_password BY 'revolee';
GRANT ALL PRIVILEGES ON `private_data`.* TO 'revolee'@'localhost';

CREATE USER 'revolee'@'%' IDENTIFIED WITH mysql_native_password BY 'revolee';
GRANT ALL PRIVILEGES ON `private_data`.* TO 'revolee'@'%';
