-- inserção de dados e queries

use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address) values
				  ('Maria', 'M', 'Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das Flores'),
				  ('Matheus', 'O', 'Pimentel', 987656432, 'rua alemeda 234, Centro - Cidade das Flores'),
				  ('Ricardo', 'F', 'Silva', 98764131, 'avenida prata 30, Centro - Cidade das Flores'),
				  ('Joana', 'G', 'Souza', 84689759, 'alameda alice 40, Anhancaras - Cidade das Flores'),
				  ('Maraiana', 'W', 'Horto', 48963188, 'vale do rio 300, Mundiane - Cidade das Flores'),
				  ('Roson', 'F', 'Moreira', 86764131, 'rua quatro petálas 39, Centro - Cidade das Flores');

-- idProduct, Pname, classification_kids boolean,  category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids,  category, avaliação, size) values
					('Fone de ouvido', false, 'Eletrônico', '4', null),
					('Barbie', true, 'Brinquedos', '3', null),
					('Body Carters', true, 'Vestimenta', '5', null),
					('Microfone', false, 'Eletrônico', '2', null),
					('Sofá retrátil', false, 'Móveis', '3', '3x57x80', null),
					('Farinha de arroz', false, 'Alimentos', '4', null),
					('Fire Stick', false, 'Eletrônico', '2', null);
                
select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into orders (idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
					(1, null, 'compra via aplicativo', null, 1),
					(2, null, 'compra via aplicativo', null, 50,0),
					(3,'Confirmado', null, 1),
					(4, null, 'compra via web site', null, 150,0);
                
-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,null),
						 (2,1,1,null),
                         (3,2,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation, quantity) values
							('Rio de Janeiro','1000'),
                            ('Rio de Janeiro','500'),
                            ('São Paulo','10'),
                            ('São Paulo','100'),
                            ('São Paulo','10'),
                            ('Brasília','60');
                            
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
                            (1,2,'RJ'),
                            (2,6,'GO');
                            
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (idSupplier, SocialName, CNPJ, contact) values
					 ('Almeida e filhos', 123456789123456, '21895474'),
					 ('Eletrônicos Silva', 123456789123458, '24895474'),	
                     ('Eletrônicos Souza', 223456789123458, '44895474');
                     
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,8,300),
                            (1,3,800),
                            (142,80);
                            
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (idSeller, SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, 123456789486321, null, 'Rio de Janeiro', 419946287),
                    ('Kids World', null, 423456789456321, null, 'São Paulo', 819946287);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
						  (1,6,80),
                          (2,5,10);
                          
select * from productSeller;

select count(*) from clients;                          
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select contact(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
					(2, default, 'compra via aplicativo', null, 1);
                          
select count(*) from clients c, orders o 
		where c.idClient = idOrderClient;

select * from product;
select * from clients inner join orders ON idClient = idOrderClient
					  inner join product on;
	

                            