create database bs_clients;

use bs_clients;

create table tbl_clients(
codigo int not null primary key auto_increment,
nome varchar(40) not null,
sexo char(1) not null
);

create table tbl_clientes2(
id int primary key auto_increment,
nome varchar(100),
idade int,
sexo char(1),
email varchar(100),
telefone varchar(15),
endereco varchar(100)
);

insert into tbl_clients (nome,sexo)
values("Humberto","H"),("Ayrton Senna","H"),("Xuxa","F");

select * from tbl_clients;

delimiter $$
create procedure sp_lista_clients (in opcao int)
begin
	if opcao = 0 then
		select * from tbl_clients where sexo = 'F';
    elseif opcao = 1 then
		select * from tbl_clients where sexo = 'H';
    else
		select * from tbl_clients;
    end if;
end $$
delimiter ;

show procedure status;

call sp_lista_clients (0);
call sp_lista_clients (1);
call sp_lista_clients (2);

delimiter $$
create procedure sp_busca_clients_nomes(in nome_parcial varchar(100))
begin
	select * from tbl_clients
    where nome like concat('%', nome_parcial, '%');
end %%

delimiter ;

call sp_busca_clients_nome ('s');
