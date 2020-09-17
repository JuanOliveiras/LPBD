show databases;
-- 01 - Crie o banco de dados
create database exercicioinnerJoin;
use exercicioinnerJoin;
-- 02 - Crie as tabelas

create table Cliente(
cpf int not null,
nome varchar(60),
dtNasc date,
primary key(cpf));

create table Modelo(
codMod int not null,
Desc_2 varchar(40),
primary key (codMod));

create table Patio(
num int not null,
ender varchar(40),
capacidade int not null,
primary key(num));

create table Veiculo(
placa varchar(8),
Modelo_codMod int not null,
Cliente_cpf int not null,
cor varchar(20),
primary key(placa),
foreign key(Modelo_codMod) references Modelo(codMod),
foreign key(Cliente_cpf) references Cliente(cpf));

create table estaciona (
cod int not null,
Patio_num int,
Veiculo_placa int,
dtEntrada varchar(10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10),
primary key(cod),
foreign key(Patio_num) references patio(num),
foreign key(Veiculo_placa) references patio(num));


-- 3 - Nome e placa de todos os veiculos
select cliente.nome, veiculo.placa from cliente inner join veiculo on
cliente.cpf = veiculo.Cliente_cpf;

-- 4 - CPF e Nome da placa JJJ-2020
select cliente.cpf, cliente.nome, veiculo.placa from cliente inner join veiculo on
cliente.cpf = veiculo.Cliente_cpf where
veiculo.placa = 'JJJ-2020';

-- 5 - Exibir placa e cor do veiculo que possui código de estacionamento 1
select veiculo.placa, veiculo.cor, estaciona.cod from veiculo inner join estaciona on
veiculo.placa = estaciona.veiculo_placa where
estaciona.cod = 1;

-- 6 - Endereço, data de entrada e saida da placa JEG-1010
select veiculo.placa, estaciona.dtEntrada, estaciona.dtSaida, patio.ender from veiculo inner join estaciona inner join patio on
veiculo.placa = estaciona.veiculo_placa and patio.num = estaciona.Patio_num where
veiculo.placa = 'JEG-1010';

-- 7 - Quantidade de vezes que veiculos de cor verde estacionaram
select veiculo.cor, count(estaciona.Veiculo_placa) from veiculo inner join estaciona on
veiculo.placa = estaciona.veiculo_placa where
veiculo.cor = 'verde';

-- 8 - Listar cliente com carro modelo 1
select cliente.nome from cliente inner join modelo inner join veiculo on 
cliente.cpf = veiculo.cliente_cpf and modelo.codMod = veiculo.Modelo_codMod where
modelo.codMod = 1;

-- 9 - Listar placa, horario entrada e saida de veiculos verdes
select veiculo.placa, estaciona.hsEntrada, estaciona.hsSaida from veiculo inner join estaciona on
veiculo.placa = estaciona.Veiculo_placa where
veiculo.cor = 'verde';

-- 10 - Todos estacionamentos da placa JJJ-2020
select estaciona.* from veiculo inner join estaciona on 
veiculo.placa = estaciona.veiculo_placa where
veiculo.placa = 'JJJ-2020';

-- 11 - Cliente cujo veiculo tem codigo de estacionamento 2
select cliente.nome from veiculo inner join estaciona inner join cliente on
veiculo.placa = estaciona.veiculo_placa and cliente.cpf = veiculo.cliente_cpf where
estaciona.cod = 2;

-- 12 - CPF do cliente que possui codigo de estacionamento 3
select cliente.cpf from cliente inner join estaciona inner join veiculo on
veiculo.placa = estaciona.veiculo_placa and cliente.cpf = veiculo.cliente_cpf where
estaciona.cod = 3;

-- 13 - Descrição do veiculo que tem codigo de estacionamento 2
select modelo.desc_2 from estaciona inner join veiculo inner join modelo on
veiculo.placa = estaciona.Veiculo_placa and veiculo.modelo_codMod = modelo.codMod where
estaciona.cod = 2;

-- 14 - Placa, nome do cliente e descrição de todos os veiculos
select cliente.nome, veiculo.placa, modelo.desc_2 from veiculo inner join modelo inner join cliente on
cliente.cpf = veiculo.cliente_cpf and modelo.codMod = veiculo.Modelo_codMod;
