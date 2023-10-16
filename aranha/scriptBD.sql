CREATE DATABASE bdR;
USE bdR;

CREATE TABLE dadosDia(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    Dia DATE,
    mediaTempMax DECIMAL,
    mediaTempMin DECIMAL, 
    umidade DECIMAL
);
SELECT * FROM dadosDia;