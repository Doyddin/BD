-- Dias e Dias Parados Informática Ltda. 

-- avivah
drop database if exists avivah;
create database if not exists avivah;
use avivah;

-- Funcionarios nome,sexo,datanasc,endereco,contato,rg,cepeéfi
drop table if exists funcionarios;
create table if not exists funcionarios(
idFunc int not null auto_increment primary key,
cpfFunc bigint(11) not null,
rgFunc bigint(9) not null,
nomeFunc varchar(60) not null,
sexoFunc enum("M","F") not null,
datanascFunc date not null);

-- contatos Funcosieoaufha
drop table if exists contatos;
create table if not exists contatos(
idcontato int not null auto_increment primary key,
idFunc int,
idforn int,
celular int(9) not null,
telefone int(8),
telefoneempresa int(8),
emailpessoal varchar(100) not null,
emailInst varchar(100) not null,
foreign key(idFunc) references funcionarios(idFunc),
foreign key(idforn) references fornecedores(idforn));

-- fornecedores
drop table if exists fornecedores;
create table if not exists fornecedores(
idempresa int not null,
empresaFor int,
idfor int not null primary key,
numctps int(7) not null,
cnpjFor bigint(14) not null,
cpfFor bigint(11) not null,
rgfor bigint(9) not null,
nomeFor varchar(60) not null,
sexoFor enum("M","F") not null,
foreign key(idempresa) references empresas(idempresa));

-- produtos
drop table if exists produtos;
create table if not exists produtos(
idproduto int not null primary key auto_increment,
empresafor int,
foreign key(empresafor) references fornecedores(empresaFor),
nomeproduto varchar(20) not null,
corproduto varchar(20) not null,
fabricante varchar (50) not null,
peso smallint not null,
tamanhoa int not null,
tamanhol int not null,
material varchar(120),
codbarra bigint(12),
preco decimal(5,2) not null,
composicao varchar(130));

-- enderecos
drop table if exists Enderecos;
create table if not exists Enderecos(
idendereco int not null primary key auto_increment,
idfunc int,
idfor int,
EnderecoFixoFunc varchar(150) not null,
CEP char(8) not null,
Complementos varchar(160),
foreign key(idfunc) references funcionarios(idFunc),
foreign key(idfor) references fornecedores(idfor));

-- setores
drop table if exists setores;
create table if not exists setores(
idsetor int not null auto_increment primary key,
nomesetor varchar(30) not null,
idfilial int not null,
idchefe int not null);

insert into setores(nomesetor,idfilial,idchefe) values(
"Cama",1,1),
("Banho",1,1),
("Moveis",2,2),
("Utilidades domesticas",2,1),
("Banho",2,3),
("Cozinha",3,2),
("Garagem",3,1),
("Jardinagem",3,3);

-- Filias
drop table if exists filiais;
create table if not exists filiais(
idfilial int not null auto_increment primary key,
cidadefilial varchar(36) not null,
idchefe int not null,
foreign key(idchefe) references chefes(idchefe));

-- chefes
drop table if exists chefes;
create table if not exists chefes(
idfunc int not null,
idchefe int not null auto_increment primary key,
nomechefe varchar(60) not null,
foreign key(idfunc) references funcionarios(idFunc));

-- empresas
drop table if exists empresas;
create table if not exists empresas(
idempresa int not null primary key auto_increment,
nomemepresa varchar(35) not null,
sedelocalcomplementada varchar(160) not null
);



desc funcionarios;

insert into funcionarios(cpfFunc,rgFunc,nomeFunc,sexoFunc,datanascFunc) values ('12345678910','123456789',"Mario Antonio","M","1978/08/26"),
																			   ('32445167812','987654321',"Teonorio Sergio","M","1969/05/23"),
																			   ('48356209513','729428493',"Eurico Fagundes","M","1990/02/08"),
																			   ('72346792314','283934934',"Macedo Alexandre","M","2001/07/30"),
																			   ('83293421815','204248204',"Marcelo e Rogerio","M","1998/04/28"),
																			   ('49822404312','428594594',"Ana Carolina","F","1992/12/27"),
																		       ('32891432015','483489694',"Marcia Leticia","F","1995/05/13"),
																			   ('73644039317','284392859',"Gabriela Vitzner","F","1986/08/11"),
																	           ('83495349518','438934914',"Oliver Jagundes","M","1998/02/07"),
																		       ('43874183419','784834847',"Charles Nascimento","M","1981/09/29"),
																		       ('57589747410','647287325',"Adriano Xavier","M","1976/02/01"),
																			   ('27598632517','329478348',"Katia Fernanda","F","1991/08/05"),
																			   ('90439543915','393493489',"Taric Luan","M","2001/01/08"),
																			   ('64142794815','271948934',"Clever Rodrigo","M","1996/05/11"),
																			   ('59539463516','390430294',"Yasmin Gabriele","F","1998/10/20"),
																			   ('39828433213','237847832',"Marllon Raspante","M","2001/03/27"),
																		       ('37483448411','788277386',"Bruno Araujo","M","1997/06/30");
select * from funcionarios;

insert into fornecedores(idfor,idempresa,sexoFor,nomeFor,cpfFor,cnpjFor,numctps,rgfor) values
(18,2,"F","Joana Perereira",'123456789','12345678910111',1234567,'213465219'),
(19,1,"M","Moreira Korein",'123546789','13245678910111',1324567,'234615978'),
(20,2,"M","Kao Chin",'132456789','21345678910111',3241567,'263379421'),
(21,2,"F","Koroi Manune",'312456789','13420645791423',2431576,'236451266'),
(22,1,"M","Huneat Bnar",'0959845723','86950238574123',8695835,'321306413'),
(23,3,"M","Carloso Caitano",'654897841','12365148796145',2137564,'316054912'),
(24,3,"M","Mariano Soza",'461325649','12304567914230',2134561,'302164510'),
(25,2,"F","Matilde Feliciana",'387598843','54831976431876',7865129,'312461597'),
(26,1,"F","Luiza Tafarel",'798463125','85146575951436',9436127,'231640215'),
(27,3,"M","Huan Munkei",'943167861','97531652943153',7651342,'33491572'),
(28,2,"M","Elmo Kennedy",'467827913','79846879316482',6813575,'302460519'),
(29,1,"M","Scott Arceneaux",'412762348','94236761351735',9632485,'326415679'),
(30,1,"M","Malcolm Graves",'438764293','7896124765118',7831549,'154673259'),
(31,2,"M","Gabriel Silva",'242104298','48784615434816',4614618,'130246157'),
(32,3,"F","Silvana Schultz",'281864124','98731256483298',8642593,'213456791'),
(33,2,"M","Joano Sanos",'123045619','22345166021321',2316540,'342165798');
select * from fornecedores;
insert into contatos(idFunc,idforn,celular,telefone,telefoneempresa,emailpessoal,emailinst) values
("1","0","118498394","78643154","1282389","marioantonio78@yahoo.com","mario.antonio@yahoo.com.br"),
("2","0","921345645","00000000","15256431","kkkk@outlook.com","kkkk@fras.com.br"),
("3","0","978461348","79164826","4874618","eurico.f@outlook.com","eurico.fagundes385@goiaba.com.br"),
("4","0","348349204","00000000","2937863","macedo293@gmail.com","macedo.alexandre284@gmail.com.br"),
("5","0","175834394","14569761","43847896","marceloerogerio@gmail.com","marcelo.e22@outlook.com.eu"),
("6","0","439283283","00000000","93894389","anacarol22@gmail.com","ana.carolina204@outlook.com.br"),
("7","0","341849282","00000000","37381838","marclet@outlook.com","marcia.leticia81@fabi.com.br"),
("8","0","292480439","00000000","14893934","gabivitz@gmail.com","gabriela.vietzner042@saas.com.us"),
("9","0","828943984","46134976","82892398","oliver.jag2@gmail.com","oliver.jagundes928@gmail.com.br"),
("10","0","289239323","00000000","23274242","charles.nasc922@outlook.com","charles.nascimento19@outlook.com.br"),
("11","0","929042042","00000000","56092390","adri.xavi@gmail.com","adriano.xavier202@gmail.com.br"),
("12","0","132904029","00000000","28437847","kat.fernanda@outlook.com","katia.fernanda22@outlook.com.br"),
("13","0","348934893","00000000","18344390","taric.lu5@gmail.com","taric.luan24@gmail.com.br"),
("14","0","293209234","48761543","90454058","cleclerod0@gmail.com","cleber.rodrigo02@gmail.com.br"),
("15","0","183923894","00000000","20044939","yaya.gabs@yahoo.com","yasmin.gabriele82@yahoo.com.br"),
("16","0","284782734","00000000","84848924","marlin.raspante@yahoo.com","marllon.raspante@yahoo.com.br"),
("17","0","906905966","46781634","92839239","brunin.araujo@outlook.com","bruno.araujo2490@outlook.com.br"),
("0","18","956421135","00000000","35442121","jooj.perere@gmail.com","joana.perere@klii.c"),
("0","19","956648471","00000000","35442121","morko@outlook.com","moreira.kore@makro.br"),
("0","20","968487213","00000000","82892398","kaoo@outlook.com","kao.chin@gmail.com.br"),
("0","21","984598545","00000000","34839209","koromanu@gmail.com","koroi.manune23@chuuhc.br"),
("0","22","936734764","00000000","19843488","hunhein@outlook.com","huneat.bnar1@gmail.com.br"),
("0","23","943898395","00000000","34344334","carlocait@gmail.com","carloso.caitano@outlook.com.br"),
("0","24","943565623","00000000","84589434","marinso87@gmail.com","mariano.soza23@yahoo.com.br"),
("0","25","943734437","00000000","27247425","matildefeli@gmail.com","matilde.feliciano@gamei.com.br"),
("0","26","934674373","00000000","31724278","luizat@farel.com","luiza.tafarel@recicla.com.br"),
("0","27","926746743","00000000","28493874","huan.m@outlook.com","huan.munkei@hacter.com.br"),
("0","28","923742764","00000000","14818484","elmo.kennedy@oconnor.com","elmo.kennedy@gmail.com.br"),
("0","29","947363746","00000000","23743784","scott.arc@sbs.com","scott.arceneaux@com.com"),
("0","30","938743466","00000000","72837287","malcolmgraves@12gauge.com","malcom.graves@pirata.com"),
("0","31","926743674","00000000","72343984","gabriel.silva@gmail.com","gabriel.silve38@tecnico.com"),
("0","32","926326673","00000000","68283983","silvana.schultz@gawer.com","silvana.schultz245@gamega.com"),
("0","33","934762445","00000000","24243432","joano.sanosi@werager.com","joano.sanos242@hotmial.com");













-- EVENTOS droga ;-;
drop database if exists eventos;
create database eventos;
use eventos;

-- participantes

drop table if exists participantes;
create table if not exists participantes(
idparticipantes int not null primary key auto_increment,
nomeparticipante varchar(80) not null,
telefoneparticipante varchar(14) not null,
emailparticipante varchar(50) not null,
membroparticipante enum("S","N") not null);

insert into participantes(nomeparticipante,telefoneparticipante,emailparticipante,membroparticipante) values("Carlos Carlindo de Carla","14997019926","hehuheas@outlook.com","N"),
("Matheus Zeus da Zilva","14964578123","zeuszika@outlook.com","S"),
("Marcelo Rogerio Paulo","14235641148","marceloooooo@outlook.com","S"),
("Leila da Silsa Sansos","14235642315","leilasilsa@outlook.com","N"),
("Fabiula Fernanda do Carlos","12345167945","fabiulafer@hotmail.com","S"),
("Elisanda Seila da Silva","13465218794","lissandracongele@yahoo.com","N");

alter table participantes add column sexoparticipante enum("M","F") not null;

update participantes
set sexoparticipante = "F"
where idparticipantes = 4 or
idparticipantes = 5 or
idparticipantes = 6;

-- eventos
drop table if exists eventos;
create table eventos(
idEvento int not null primary key auto_increment,
descevento varchar(200) not null,
obsevento text not null,
dataevento date not null);

insert into eventos(descevento,obsevento,dataevento) values(
"Nada, incrivelmente nada e o preco do ingresso nao e grande coisa! So 600 reais!!!","e verdade esse bilhete","2020/02/24"),
("Tudo, incrivelmente tudo no espaco mais pequeno! menor que o Adrian! e e de graça!","tudo mentira, nao tem nada la","2020/03/14"),
("Parcialmente, nada de incrivel so tem tudo pela metade","cara ja nao sei dizer se e verdade ou mentira","2019/11/10"),
("Quase Nada, que lixo, cada vez tem menos o trem","verdade cada vez mais menos","2030/10/12"),
("Quase tudo, SO TEM QUASE TUDO","depende da sua interpretacao","2040/10/13");

-- participacao
drop table if exists participacao;
create table participacao(
idevento int not null,
idparticipantes int not null,
Constraint Fk_Participante foreign key(idparticipantes)
references participantes(idparticipantes),
Constraint Fk_Evento foreign key(idevento)
references eventos(idenvento));

alter table participacao add column certificadoparticipacao enum("S","N") not null;

insert into participacao(idevento,idparticipantes,certificadoparticipacao) values(1,1,"S"),(1,2,"S"),(1,3,"N"),(1,4,"N"),(2,1,"N");

select p.nomeparticipante, e.descevento, a.certificadoparticipacao
from participantes p, eventos e, participacao a
where p.idparticipantes = a.idparticipantes and e.idevento = a.idevento;


