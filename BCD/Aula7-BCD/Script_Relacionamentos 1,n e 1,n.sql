-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Fornecedores (
ID_Fornecedores int auto_increment primary key PRIMARY KEY,
Razao_Social varchar(100) not null
)

CREATE TABLE Produtos (
Id_Produtos int auto_increment primary key PRIMARY KEY,
Nome_Produto varchar(100) not null
)

CREATE TABLE Fornece (
Id_Produtos int unique,
ID_Fornecedores int unique,
Qtde int not null,
Obs text(400),
Id_Item int auto_incement primary key PRIMARY KEY,
FOREIGN KEY(Id_Produtos) REFERENCES Produtos (Id_Produtos)/*falha: chave estrangeira*/
)

