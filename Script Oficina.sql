-- criação do banco de dados para o cenário da Oficina
use oficina;

-- criar tabela cliente
create table cliente(
		idCliente int auto_increment primary key,
        Nome varchar(45),
        Telefone varchar(10),
        Endereco varchar(20),
        CPF varchar(11),
        DtNasc date,
        constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment=1;

-- criar tabela veículo

create table veiculo(
		idVeiculo int auto_increment primary key,
        Marca varchar(10),
        Cor varchar(10),
        Modelo varchar(10),
        AnoFabricacao date,
        numeroChassi varchar(10),
        Placa varchar(10)
);

-- criar tabela orçamento
create table orders(
	   idOrcamento int auto_increment primary key,
       NomeMecanico varchar(30),
       DataEntrada date,
       DataSaida date,
       Aprovado boolean default false,
       Finalizado boolean default false,
       constraint fk_Veiculo_idVeiculo foreign key (idVeiculo) references cliente(idCliente)
);

-- criar tabela item orçamento
create table productStorage(
	   idItemOrcamento int auto_increment primary key,
       Tipo int,
       Quantidade float,
       constraint fk_Veiculo_idVeiculo foreign key (idVeiculo) references cliente(idCliente)
       constraint fk_PecasMaoObra_idPecasMaoObra foreign key (idPecasMaoObra) references PecasMaoObra(idPecasMaoObra)

-- criar tabela PecasMaoObra
create table PecasMaoObra(
	   idPecasMaoObra int auto_increment primary key,
       Descricao varchar(30),
       Preco float

);
