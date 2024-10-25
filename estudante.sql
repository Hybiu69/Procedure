create database escola;
use escola;

create table alunos (
codigo int not null primary key auto_increment,
 nome varchar (40) not null,
 idade int not null,
 sexo varchar (1) not null,
 email  varchar (100) not null,
 telefone  varchar (40) not null,
  endereco varchar (70) not null
);


insert into alunos (nome,idade,sexo,email,telefone,endereco)
values ("Giovana",16,"F","giaraujo@gmail",6789,"rua rosa"),
       ("Guilherme",18,"M","guielias@gmail","1234","Rua azul"),
       ("Gustavo",18,"M","gubunelli@gmail","1789","rua verde"),
       ("Isabella",16,"F","isavassao@gmail", "3456","rua roxa"),
       ("Lucas",17,"M","lueduardo@gmail","1525","rua amarela");
       
select * from alunos; 


delimiter $$ 
create procedure lista_alunos (in opcao int)
begin
  if opcao >= 18 then
            select * from alunos where idade >= "18";
      elseif opcao < 18 then
            select * from alunos where idade < "18";
      else 
            select * from alunos;
  
 end if;
end $$ 
delimiter ;
 
 call lista_alunos(18);
 call lista_alunos(17);