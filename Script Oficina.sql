-- criação do banco de dados para o cenário da Oficina
use oficina;

-- criar tabela cliente
create table client(
		idClient int auto_increment primary key,
        Fname varchar(45),
        Telefone varchar(10),
        Endereco varchar(20),
        CPF varchar(11),
        DtNasc date,
        constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criar tabela veículo

create table vericulo(
		idVeiculo int auto_increment primary key,
        Marca varchar(10),
        Cor varchar(10),
        Modelo varchar(10),
        AnoFabricacao date,
        numeroChassi varchar(10),
        Placa varchar(10)
);

create table payments(
	idClient int,
    id_payment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)    
);

-- criar tabela pedido
create table orders(
	   idOrder int auto_increment primary key,
       idOrderClient int,
       orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
       orderDescription varchar(255),
       sendValue float default 10,
       paymentCash boolean default false,
       constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);
desc orders;

-- criar tabela estoque
create table productStorage(
	   idProdStorage int auto_increment primary key,
       storageLocation varchar(255),
       quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	   idSupplier int auto_increment primary key,
       SocialName varchar(255) not null,
       CNPJ char(15) not null,
       Contact char(11) not null,
       constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
	   idSeller int auto_increment primary key,
       SocialName varchar(255) not null,
       AbstName varchar(255),
       CNPJ char(15),
       Location varchar(255),
       Contact char(11) not null,
       constraint unique_cnpj_seller unique (CNPJ),
       constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	   idSeller int auto_increment primary key,
	   idProduct int,
       prodQuantity int default 1,
       primary key (idPseller, idProduct),
       constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
       constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

CREATE TABLE productOrder (
    idPOproduct INT AUTO_INCREMENT PRIMARY KEY,
    idPOorder INT,
    prodQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct , idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct)
        REFERENCES product (idPOproduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder)
        REFERENCES orders (idPOorder)
);

create table storageLocation(
	   idLproduct int,
       idLstorage int,
       location varchar(255) not null,
       primary key (idLproduct, idLstorage),
       constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
       constraint fk_storage_location_storage foreign key (idLstorage) references ordersStorage(idProdStorage)
);

create table productSupplier(
	   idPsSupplier int,
       idPsProduct int,
       quantity int not null,
       primary key (idPsSupplier, idPsProduct),
       constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idPsSupplier),
       constraint fk_product_supplier_product foreign key (idPsProduct) references product(idPsProduct)
);

desc productSupplier;

show tables;

show databases;
use information_shema;
show tables;
desc referetial_constraints;
select * from referetial_constraints where constraint_schema = 'ecommerce';