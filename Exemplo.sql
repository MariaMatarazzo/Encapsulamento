create database bd_clientes;
use bd_clientes;

create table tbi_clientes (
codigo int not null primary key auto_increment,
 nome varchar (40) not null,
 sexo varchar(1) not null
);

insert into tbi_clientes (nome,sexo)
values ("Humberto","M"),
       ("Ayrton Sena","M"),
       ("Xuxa","F");
       
 select * from tbi_clientes;      
 
 delimiter $$ 
 create procedure sp_lista_clientes(in opcao int)
 begin
  
	if opcao = 0 then
		select * from tbi_clientes where sexo = "F";
	elseif opcao = 1 then
		select * from tbi_clientes where sexo = "M";
	else 
		select * from tbi_clientes;
  
	end if;
  end $$ 
 delimiter ;
 
 show procedure status;

#Lista sexo Feminino
call sp_lista_clientes(0);

#Lista sexo Maculino
call sp_lista_clientes(1);

#Lista todos
call sp_lista_clientes(2);


#stored procedure 2
delimiter $$
create procedure sp_cliente_por_nome (in nome_parcial varchar (100))
begin 
       select * from tbi_clientes
       where nome like concat('%', nome_parcial, '%');
end $$        
 
delimiter ;
  
  
  call sp_cliente_por_nome('A');
  