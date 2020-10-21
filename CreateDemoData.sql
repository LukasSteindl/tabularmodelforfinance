--dieses script als sa (pw demo) und nicht als lukast ausführen!
use master
Drop Database if exists BankPurbach
Go
Drop Database if exists BankBruck
Go
Create Database BankPurbach
GO
Use BankPurbach
GO
Create Table Kunden (KundenNr int primary key identity, Nachname varchar(255))
Insert Into Kunden values ('Mayer'), ('Huber')

Drop Table if exists Konten 
Create Table Konten (KontoNr int primary key identity, Bezeichnung varchar(255))

Insert Into Konten Values ('Anlagevermögen')
Insert Into Konten Values ('Barmittel')
Insert Into Konten Values ('Beteiligungen')
Insert Into Konten Values ('Forderungen Kreditnehmer')
Insert Into Konten Values ('Verbindlichkeiten Kreditnehmer')
Insert Into Konten Values ('Zinsertrag')
Insert Into Konten Values ('Eigenkapital')

Select * from Konten

Drop Table if exists Buchungen

Create Table Buchungen (BuchungsNr int primary key identity, KontoNr int references Konten, Betrag int, Buchungsdatum date, KundenNr int references Kunden)

--vergabe eines Kredits: Buchungssatz Forderungen Kreditnehmer an Verbindlichkeiten Kreditnehmer: 
Insert Into Buchungen values (4,3500, '2020-01-01',1)
Insert Into Buchungen values (5,-3500,'2020-01-01',1)  

--auszahlung eines Kredits Verbindlichkeit Kreditnehmer an Barmittel 
Insert Into Buchungen values (5,3500, '2020-01-01',1)
Insert Into Buchungen values (2,-3500,'2020-01-01',1)  

--Zinsertrag: Forderung an Zinsertrag
Insert Into Buchungen values (5,300, '2020-06-30',1)
Insert Into Buchungen values (6,-300,'2020-06-30',1)  

--Tilgung des Darlehns Kassa an Forderung
Insert Into Buchungen values (2,3800, '2020-09-30',1)
Insert Into Buchungen values (4,-3800,'2020-09-30',1)  

--Jahresabschluss Zinsertrag and EK
Insert Into Buchungen values (6,300, '2020-12-31',1)
Insert Into Buchungen values (7,-300,'2020-12-31',1)  

--Gehaltsbuchung Steindl Barmittel an Verbindlichkeiten gegenüber Kreditnehmer (um hier kein neues Verbindlichkeitskonto anlegen zu müssen)
Insert Into Buchungen values (2,2500, '2020-01-01',1)
Insert Into Buchungen values (5,-2500, '2020-01-01',1)

--Überweisung Steindl an Huber: Verbindlichkeit gegenüber Steindl nimmt ab, verbindlichkeit gegenüber Huber nimmt zu:
-- 
Insert Into Buchungen values (5,-1000, '2020-01-31',2)
Insert Into Buchungen values (5,1000, '2020-01-31',1)


----ein zweites jahr



--vergabe eines Kredits: Buchungssatz Forderungen Kreditnehmer an Verbindlichkeiten Kreditnehmer: 
Insert Into Buchungen values (4,3500, '2021-01-01',1)
Insert Into Buchungen values (5,-3500,'2021-01-01',1)  

--auszahlung eines Kredits Verbindlichkeit Kreditnehmer an Barmittel 
Insert Into Buchungen values (5,3500, '2021-01-01',1)
Insert Into Buchungen values (2,-3500,'2021-01-01',1)  

--Zinsertrag: Forderung an Zinsertrag
Insert Into Buchungen values (5,300, '2021-06-30',1)
Insert Into Buchungen values (6,-300,'2021-06-30',1)  

--Tilgung des Darlehns Kassa an Forderung
Insert Into Buchungen values (2,3800, '2021-09-30',1)
Insert Into Buchungen values (4,-3800,'2021-09-30',1)  

--Jahresabschluss Zinsertrag and EK
Insert Into Buchungen values (6,300, '2021-12-31',1)
Insert Into Buchungen values (7,-300,'2021-12-31',1)  

--Gehaltsbuchung Steindl Barmittel an Verbindlichkeiten gegenüber Kreditnehmer (um hier kein neues Verbindlichkeitskonto anlegen zu müssen)
Insert Into Buchungen values (2,2500, '2021-01-01',1)
Insert Into Buchungen values (5,-2500, '2021-01-01',1)

--Überweisung Steindl an Huber: Verbindlichkeit gegenüber Steindl nimmt ab, verbindlichkeit gegenüber Huber nimmt zu:
-- 
Insert Into Buchungen values (5,-1000, '2021-01-31',2)
Insert Into Buchungen values (5,1000, '2021-01-31',1)


Select SUM(Betrag) from Buchungen where KundenNr = 2
Select SUM(Betrag) from Buchungen where KundenNr = 2 and KontoNr = 5
Select SUM(Betrag) from Buchungen where KundenNr = 1 and KontoNr = 5

GO
--Saldo der Barmittel am Jahresende:
Create Database BankBruck

GO
Use BankBruck
GO

Create Table Kunden (KundenNr int primary key identity, Nachname varchar(255))
Insert Into Kunden values ('Mustermann'), ('Baumgartner')

Drop Table if exists Konten 
Create Table Konten (KontoNr int primary key identity, Bezeichnung varchar(255))

Insert Into Konten Values ('Anlagevermögen')
Insert Into Konten Values ('Barmittel')
Insert Into Konten Values ('Beteiligungen')
Insert Into Konten Values ('Forderungen Kreditnehmer')
Insert Into Konten Values ('Verbindlichkeiten Kreditnehmer')
Insert Into Konten Values ('Zinsertrag')
Insert Into Konten Values ('Eigenkapital')

Select * from Konten

Drop Table if exists Buchungen

Create Table Buchungen (BuchungsNr int primary key identity, KontoNr int references Konten, Betrag int, Buchungsdatum date, KundenNr int references Kunden)


--vergabe eines Kredits: Buchungssatz Forderungen Kreditnehmer an Verbindlichkeiten Kreditnehmer: 
Insert Into Buchungen values (4,1500, '2020-01-01',1)
Insert Into Buchungen values (5,-1500,'2020-01-01',1)  

--auszahlung eines Kredits Verbindlichkeit Kreditnehmer an Barmittel 
Insert Into Buchungen values (5,1500, '2020-01-01',1)
Insert Into Buchungen values (2,-1500,'2020-01-01',1)  

--Zinsertrag: Forderung an Zinsertrag
Insert Into Buchungen values (5,300, '2020-06-30',1)
Insert Into Buchungen values (6,-300,'2020-06-30',1)  

--Tilgung des Darlehns Kassa an Forderung
Insert Into Buchungen values (2,1800, '2020-09-30',1)
Insert Into Buchungen values (4,-1800,'2020-09-30',1)  

--Jahresabschluss Zinsertrag and EK
Insert Into Buchungen values (6,300, '2020-12-31',1)
Insert Into Buchungen values (7,-300,'2020-12-31',1)  

--Gehaltsbuchung Steindl Barmittel an Verbindlichkeiten gegenüber Kreditnehmer (um hier kein neues Verbindlichkeitskonto anlegen zu müssen)
Insert Into Buchungen values (2,2500, '2020-01-01',1)
Insert Into Buchungen values (5,-2500, '2020-01-01',1)

--Überweisung Steindl an Huber: Verbindlichkeit gegenüber Steindl nimmt ab, verbindlichkeit gegenüber Huber nimmt zu:
-- 
Insert Into Buchungen values (5,-1500, '2020-01-31',2)
Insert Into Buchungen values (5,1500, '2020-01-31',1)


Select SUM(Betrag) from Buchungen where KundenNr = 2
Select SUM(Betrag) from Buchungen where KundenNr = 2 and KontoNr = 5
Select SUM(Betrag) from Buchungen where KundenNr = 1 and KontoNr = 5
go


use master
go
Drop Database if exists BankDWH 
go
Create Database BankDWH
go
use BankDWH
GO

Drop Table if exists FactBuchungen
Drop Table if exists DimBuchungskonten
Drop Table if exists DimKunden
Create Table DimKunden (ID int primary key identity, KundenNr int, Nachname varchar(255), Bankleitzahl int)

Insert Into DimKunden
Select *,33078 from [BankPurbach].dbo.Kunden
UNION ALL
Select *,32073 from [BankBruck].dbo.Kunden
GO

Select * from DimKunden

Drop Table if exists DimBuchungskonten
GO
Create Table DimBuchungskonten (ID int primary key, Bezeichnung varchar(255))
GO
Insert Into DimBuchungskonten Select * from  [BankPurbach].dbo.Konten
GO

Select * from DimBuchungskonten
GO
Drop Table if exists FactBuchungen
GO
Create Table FactBuchungen (ID int primary key identity,BuchungsNr int,KontoNr int references DimBuchungskonten, 
Betrag int, Buchungsdatum date, KundenNr int references DimKunden, Bankleitzahl int) 

Insert Into FactBuchungen 
Select [BuchungsNr], [KontoNr], [Betrag], [Buchungsdatum], K.[ID], B.Bankleitzahl from (
Select *,33078 as Bankleitzahl from [BankPurbach].dbo.Buchungen 
UNION ALL
Select *,32073 from [BankBruck].dbo.Buchungen) B join DimKunden K on B.KundenNr  = K.KundenNr and B.Bankleitzahl = K.Bankleitzahl


Select * from FactBuchungen

Drop Table if exists MitarbeiterPermission
go
Create Table MitarbeiterPermission (ID int primary key identity, Nachname varchar(255), Bankleitzahl int, UserName varchar(255))
Insert Into MitarbeiterPermission values ('Steindl',33078,'europe\lukast'), ('Hirscher',32073,'DESKTOP-TP27DNG\hirscher')



use BankDWH
Select DATABASE_PRINCIPAL_ID(),USER_NAME()

use BankDWH
GO
CREATE SCHEMA Security;  
GO  

go
Create FUNCTION Security.fn_securitypredicate(@BLZ AS int)  
    RETURNS TABLE  
WITH SCHEMABINDING  
AS  
    RETURN 
	
	SELECT 1 as 'fn_securitypredicate' where exists 
	(Select 1 from dbo.MitarbeiterPermission 
	where UserName = USER_NAME() and Bankleitzahl = @BLZ
	or USER_NAME() = 'dbo'
	)
;
GO

use BankDWH
GO
Drop Security Policy if exists OnlyWithSameBLZ
go
CREATE SECURITY POLICY OnlyWithSameBLZ
ADD FILTER PREDICATE Security.fn_securitypredicate(Bankleitzahl)
ON dbo.FactBuchungen  
WITH (STATE = ON);

--Demo: Als lukast und als admin anmelden und folgende Abfrage vergleichen.
use BankDWH
Select * from FactBuchungen