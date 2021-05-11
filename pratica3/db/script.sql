CREATE DATABASE IF NOT EXISTS seminarios2021;

USE seminarios2021;

CREATE TABLE IF NOT EXISTS cursos (
    id INT(11) AUTO_INCREMENT,
    nome VARCHAR(255),
    professor VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO cursos VALUE(0,'Oficina 1','Aluan Cabral');
INSERT INTO cursos VALUE(0,'Oficina 2','Jonas Teixeira');
INSERT INTO cursos VALUE(0,'Oficina 3','Rodrigo Jose');
INSERT INTO cursos VALUE(0,'Oficina 4','Elton Fonseca');
INSERT INTO cursos VALUE(0,'Oficina 5','Vinicius Martins');




