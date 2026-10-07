-- CREATE DATABASE Castello_Relacionamentos;

-- USE Castello_Relacionamentos;

-- CREATE TABLE Produto (
--     Id_Produto int AUTO_INCREMENT primary key,
--     Nome_Produto varchar(100) not null

-- );

-- CREATE TABLE Estoque (
--     Id_Estoque int auto_increment primary key,
--     Id_Produto int not null unique,
--     quantidade int not null,
--     Foreign Key (Id_Produto) REFERENCES Produto(Id_Produto)
-- );

-- CREATE TABLE Clientes (
--     Id_Cliente int AUTO_INCREMENT PRIMARY key,
--     Nome_Cliente varchar(60) not null
-- );

-- CREATE TABLE Pedidos (
--     Id_Pedidos int AUTO_INCREMENT primary key,
--     Data_Pedido datetime not null,
--     Id_Cliente int not null,
--     Foreign Key (Id_Cliente) REFERENCES Clientes(Id_Cliente)
-- );

-- CREATE TABLE Fornecedores (
--     Id_Fornecedores int AUTO_INCREMENT PRIMARY key,
--     Nome_Fornecedor varchar(60) not null
-- );

-- DROP TABLE fornecedor

-- CREATE TABLE Fornecedores_Produto (
--     Id_Fornecedores int not null,
--     Id_Produto int not null,
--     PRIMARY KEY (Id_Fornecedores, Id_Produto),
--     Foreign Key (Id_Fornecedores) REFERENCES Fornecedores(Id_Fornecedores),
--     Foreign Key (Id_Produto) REFERENCES Produto(Id_Produto)
-- );

-- SELECT * FROM Produto

-- INSERT INTO Produto (Nome_Produto) VALUES ('Camiseta');

-- desafio cardinalidade
-- questao 1
-- CATEGORIA -- PERTENCE -- PRODUTO
-- 1,N                    1,1
-- QUESTAO 2
--FUNCIONARIO -- REGISTRAR -- PEDIDOS
--1,N                      1,1
--QUESTAO 3
--FORNECEDOR -- COMERCIALIZA --PRODUTO
-- 1,N                           1,N
--QUESTAO 4
--MESA -- RESERVA -- CLIENTE
-- 0,N                   1,1
--QUESTAO 5
--PEDIDO -- POSSUI -- ITENS
-- 1,N                  1,1 