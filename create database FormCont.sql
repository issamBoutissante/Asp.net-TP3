create database FormCont
go
use FormCont
go
create table [Session](
numSession int primary key,
dateDebutSession date,
dateFinSession date,
NomStage varchar(15)
)
insert into [Session] values(1,GETDATE(),DATEADD(dd,1,GETDATE()),'nomStage1')
insert into [Session] values(2,GETDATE(),DATEADD(dd,1,GETDATE()),'nomStage2')
insert into [Session] values(3,GETDATE(),DATEADD(dd,1,GETDATE()),'nomStage3')
insert into [Session] values(4,GETDATE(),DATEADD(dd,1,GETDATE()),'nomStage4')
create table Condidat(
codeCand int primary key,
nomCand varchar(15),
dateInscription date,
numSession int,
nomSociete varchar(15),
constraint fk_condidat_session foreign key(numSession) references [Session](numSession)
)
insert into Condidat values(1,'bouti1',GETDATE(),1,'societe1')
insert into Condidat values(2,'bouti2',GETDATE(),1,'societe2')
insert into Condidat values(3,'bouti3',GETDATE(),1,'societe3')
insert into Condidat values(4,'bouti4',GETDATE(),2,'societe4')
insert into Condidat values(5,'bouti5',GETDATE(),3,'societe5')
insert into Condidat values(6,'bouti6',GETDATE(),4,'societe6')
insert into Condidat values(7,'bouti7',GETDATE(),4,'societe7')
insert into Condidat values(8,'bouti8',GETDATE(),2,'societe8')
create table Module(
codeMod int primary key,
nomMod varchar(15),
masseHoraire int,
nomFormateur varchar(15),
)
insert into Module values(1,'WCC',20,'Aginane')
insert into Module values(2,'WCS',50,'Aginane')
insert into Module values(3,'Mobile',30,'Messosi')
create table Enseigne(
codeMod int,
nomFormateur varchar(15),
numSession int,
constraint pk_enseigne primary key(codeMod,nomFormateur,numSession),
constraint fk_enseigne_Module foreign key(codeMod) references Module(codeMod),
constraint fk_enseigne_Session foreign key(numSession) references [Session](numSession)
)
insert into Enseigne values(1,'aginane',1)
insert into Enseigne values(3,'messosi',2)
insert into Enseigne values(2,'aginane',1)
create table Utilisateur(
nom varchar(15) primary key,
[password] varchar(10)
)
insert into Utilisateur values('nki','123')
insert into Utilisateur values('nkiDagh','123')