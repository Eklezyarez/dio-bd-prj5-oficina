-- inserção de dados e queries

use oficina;

show tables;
-- idCliente, Nome, Telefone, Endereco, DataNascimento
insert into Cliente (Nome, Telefone, Endereco, DataNascimento) values
				  ('Joao', 40229938, 'Rua Ricardo Melo, 120 Jd Rosália - São Sebastião'),
				  ('Maria', 90229938, 'Avenida América, 20 Vila Amélia - São Sebastião');

-- idVeiculo,Marca, Cor, Modelo, AnoFabricacao, numeroChassi,Placa
insert into Veiculo (Marca, Cor, Modelo, AnoFabricacao, numeroChassi,Placa) values
				  ('Fiat', 'Azul', 'Uno', 1990, 4831894641684, 'ESA8964'),
				  ('Volkswagen', 'Branco', 'Golf', 2008, 5831894641684, 'FSE8964');

-- idOrcamento, NomeMecanico, DataEntrada, DataSaida, Aprovado, Finalizado
insert into Orcamento (NomeMecanico, DataEntrada, DataSaida, Aprovado, Finalizado) values
				  ('Francisco', '25/03/2022', '30/03/2022', true, true),
				  ('Marcos', '30/04/2022', '07/05/2022', true, false);
              
                          