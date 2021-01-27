CREATE DATABASE testdb;
CREATE USER testuser@localhost IDENTIFIED BY "lol";
GRANT ALL ON testdb.* TO testuser@localhost;
FLUSH PRIVILEGES;