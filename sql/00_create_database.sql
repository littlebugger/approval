DROP DATABASE IF EXISTS `private_data`;
CREATE DATABASE `private_data`;

CREATE USER 'revolee'@'localhost' IDENTIFIED BY 'revolee';
GRANT ALL PRIVILEGES ON `private_data`.* TO 'revolee'@'localhost';