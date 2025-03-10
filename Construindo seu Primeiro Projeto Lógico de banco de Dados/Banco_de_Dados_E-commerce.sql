-- Criação do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;
-- Criando tabela cliente

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10) not null,
    Mname varchar(3),
    Lname varchar(10) not null,
    CPF char(11) not null,
    Address varchar(45),
    Bdate date,
    constraint unique_CPF_client unique (CPF)
);

alter table clients auto_increment=1;

-- Criando tabela Produto

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(45) not null,
    classification_kids bool default false,
    Category enum('Eletrônico','Vestuário','Brinquedo','Alimento','Móveis') not null,
	avaliacao float default 0,
    Pdescription varchar(255),
    Size varchar(45),
    Valor float
);

alter table product auto_increment=1;

-- Criando tabela Pedido

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Em andamento', 'Processando', 'Enviado', 'Entregue', 'Cancelado') default 'Processando',
	orderDescription varchar(255),
    sendValue float default 10,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

alter table orders drop constraint fk_orders_client;
alter table orders add constraint fk_orders_client foreign key (idOrderClient) references clients(idClient) on update cascade;

alter table orders auto_increment=1;

-- DESAFIO -> Criando tabelas de Pagamentos

create table boleto(
	idBoleto int auto_increment primary key,
    Cod_Boleto varchar(255) not null,
    Data_Vencimento date not null,
    constraint unique_Cod_Boleto unique (Cod_Boleto)
);

alter table boleto auto_increment=1;

create table cartao(
	idCartao int auto_increment primary key,
    Number_cartao int(16) not null,
    Name_cartao varchar(45) not null,
    Date_cartao char(5),
    CVV int(3)
);

alter table cartao auto_increment=1;

create table pix(
	idPix int auto_increment primary key,
    key_Pix varchar(45) not null
);

alter table pix auto_increment=1;

create table payments(
	idPaymentClient int,
    idPaymentOrder int,
    statusPayment enum('Confirmado', 'Recusado', 'Processando') default 'Processando',
    typePayment enum ('Boleto', 'Cartão', 'PIX') default 'Boleto',
	idBoleto int,
    idCartao int,
    idPix int,
    constraint pk_payments primary key (idPaymentClient, idPaymentOrder),
	constraint fk_pay_client foreign key (idPaymentClient) references clients(idClient),
    constraint fk_pay_order foreign key (idPaymentOrder) references orders(idOrder),
    constraint fk_pay_boleto foreign key (idBoleto) references boleto(idBoleto),
    constraint fk_pay_cartao foreign key (idCartao) references cartao(idCartao),
    constraint fk_pay_Pix foreign key (idPix) references pix(idPix)
);

-- Criando tabela Estoque

create table productStorage(
	idProductStorage int auto_increment primary key,
    StorageLocation varchar(45) not null,
    Quantity int not null default 0
);

alter table productStorage auto_increment=1;

-- Criando tabela Fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(45) not null,
    CNPJ char(14) not null,
	Contact	varchar(45) not null,
    constraint unique_CNPJ_Supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- Criando tabela Vendedor

create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(45) not null,
    AbstName varchar(45),
    CNPJ char(14) not null,
	Location varchar(45),
    constraint unique_CNPJ_Seller unique (CNPJ)
);

alter table seller auto_increment=1;

-- Criando tabela Venda por Terceiro

create table productSeller(
	idSeller int,
    idProduct int,
    Quanty int default 1,
    primary key (idSeller, idProduct),
    constraint fk_Product_Seller foreign key (idSeller) references seller(idSeller),
    constraint fk_Seller_Product foreign key (idProduct) references product(idProduct)
);

-- Criando tabela Produto Pedido

create table productOrder(
	idProduct int,
    idOrder int,
    Quanty int default 1,
    StatusProduct enum ('Disponivel','Sem disponibilidade') default 'Disponivel',
	primary key (idOrder, idProduct),
    constraint fk_Product_Order foreign key (idOrder) references Orders(idOrder),
    constraint fk_Order_Product foreign key (idProduct) references product(idProduct)
);

-- Criando tabela Em Estoque

create table storageProduct(
	idProduct int,
    idProductStorage int,
    StatusStorageProduct enum ('Disponivel','Sem disponibilidade') default 'Disponivel',
    primary key (idProductStorage, idProduct),
    constraint fk_Product_Storage foreign key (idProductStorage) references productStorage(idProductStorage),
    constraint fk_Storage_Product foreign key (idProduct) references product(idProduct)
);

-- Criando tabela Produto Fornecedor

create table supplierProduct(
	idProduct int,
    idSupplier int,
    Quanty int not null,
    primary key (idSupplier, idProduct),
    constraint fk_Product_Supplier foreign key (idSupplier) references supplier(idSupplier),
    constraint fk_Supplier_Product foreign key (idProduct) references product(idProduct)
);

show tables;

show databases;

use information_schema;

show tables;

desc REFERENTIAL_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS where constraint_schema = 'ecommerce';