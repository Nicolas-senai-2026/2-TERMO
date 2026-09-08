create database OFICINA_DE_VEICULOS;

use OFICINA_DE_VEICULOS ;

create table CLIENTES (
Id_Clientes varchar(100) auto_increment primary key not null,
Nome_Cliente varchar(60) not null,
CPF_Cliente varchar (14) not null,
Servico_Cliente varchar(65) not null,
Contato_Cliente varchar(13) not null,
Endereco_Cliente varchar(65) not null
);

create table VEICULOS (
Id_Veiculos varchar(100) auto_increment primary key not null,
Nome_Veiculo varchar(40) not null,
Tipo_Veiculo varchar(30) not null,
Defeito_Veiculo text not null,
Placa_Veiculo varchar(7) not null,
Modelo_Veiculo varchar(30) not null
);

create table MARCAS (
Id_Marcas varchar(100) auto_increment primary key not null,
Nome_Marca varchar(30) not null,
Franquia_Marca varchar (100),
Marcas_Carros varchar(100),
Marcas_Motos varchar(100),
Marcas_Pecas varchar(100)
);

create table MODELOS (
Id_Modelos varchar(100) auto_increment primary key not null,
Nome_Modelo varchar(50) not null,
Cor_Modelo varchar (50) not null,
Ano_Modelo int(4),
Fabricante_Modelo varchar(50) not null,
Tamanho_Modelo varchar(10) not null
)

create table FUNCIONARIOS (
Id_Funcionarios varchar(100) auto_increment primary key not null,
Nome_Funcionario varchar(65) not null,
Cargo_Funcionario varchar (65) not null,
Turno_Funcionario varchar(10),
Horario_Funcionamento datetime,
Salario_Funcionario decimal
)

create table SERVICOS (
Id_Servicos varchar(100) auto_increment primary key not null,
Tipo_Servicos varchar(40) not null,
Funcionario_Responsavel varchar (62) not null,
Horario_Servico datetime not null,
Termino_Servico datetime,
Pecas_Trocadas text
)

create table PECAS (
Id_Pecas varchar(100) auto_increment primary key not null,
Ferramentas text,
Estoque_Pecas text,
Pecas_Novas text,
Pecas_Semi_Novas text,
Pecas_Quebradas text
)

create table ORDENS DE SERVICOS (
Id_Ordens varchar(100) auto_increment primary key not null,
Tipo_Servico varchar(100) not null,
Data_Servico datetime not null,
Horario_Servico datetime not null,
Informacao_Servico text not null,
Valor_Total_Servico decimal not null
)

create table PAGAMENTOS (
Id_Pagamentos varchar(100) auto_increment primary key not null,
Forma_Pagamento decimal not null,
A_Vista decimal,
Cartao decimal,
Boleto decimal,
Parcelado decimal
)

create table FORNECEDORES (
Id_Fornecedores varchar(100) auto_increment primary key not null,
Fornecedor_Pecas text,
Fornecedor_Ferramentas text,
Fornecedores_Motores text,
Fornecedor_Pneus text,
Fornecedor_Hidraulica text
)