create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100) Null,
Password nvarchar(100) Null,
Email nvarchar(100) Null,
Name nvarchar(100) Null,
Usertype nvarchar(50) Null
)
select * from tblUsers

CREATE TABLE TileCompany(
	[BrandID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](500) NULL,
)
select * from TileCompany

CREATE TABLE Tile(
	[CatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[CatName] [nvarchar](max) NULL,
)
select * from Tile

CREATE TABLE TileCategory
(
	[SubCatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[SubCatName] [nvarchar](max) NULL,
	[MainCatID] [int] NULL,
CONSTRAINT [FK_TileCategory_Tile] FOREIGN KEY([MainCatID]) REFERENCES Tile ([CatID])
)
select * from TileCategory

create table tblSizes
(
SizeID int identity(1,1) primary key,
SizeName   nvarchar(500),
BrandID int,
CategoryID int,
Constraint [FK_tblSizes_ToBrand] FOREIGN KEY ([BrandID]) REFERENCES [TileCompany] ([BrandID]),
Constraint [FK_tblSizes_ToCat] FOREIGN KEY ([CategoryID]) REFERENCES [Tile] ([CatID])
)
select * from tblSizes

create table tblProducts
(
PID int identity(1,1) primary key ,
PName   nvarchar(MAX),
PBrandID int,
PCategoryID int,
Constraint [FK_tblProducts_ToTable] FOREIGN KEY ([PBrandID]) REFERENCES [TileCompany] ([BrandID]),
Constraint [FK_tblProducts_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [Tile] ([CatID])
)
select * from tblProducts

create table tblProductSizeQuantity
(
PrdSizeQuantID int identity(1,1) primary key,
PID int,
SizeID int,
Constraint [FK_tblProductSizeQuantity_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID]),
Constraint [FK_tblProductSizeQuantity_ToTable1] FOREIGN KEY ([SizeID]) REFERENCES [tblSizes] ([SizeID])
)
select * from tblProductSizeQuantity


Create procedure sp_InsertProduct
(
@PName nvarchar(MAX),
@PBrandID int,
@PCategoryID int
)
as

insert into tblProducts values(@PName, @PBrandID, @PCategoryID)
Select SCOPE_IDENTITY()
RETURN 0

Create procedure procBindAllProducts
AS
select A.*,B.Name , B.Name as BrandName from tblProducts A
inner join TileCompany B on B.BrandID = A.PBrandID
order by A.PID desc

Return 0

------

create procedure [dbo].[procBindAllProducts2]
AS
select A.*,B.Name , B.Name as BrandName 
from tblProducts A
inner join TileCompany B on B.BrandID =A.PBrandID
inner join Tile as t2 on t2.CatID=A.PCategoryID 
order by A.PID desc

Return 0

------

drop table tblUsers
drop table TileCompany
drop table Tile
drop table TileCategory
drop table tblSizes
drop table tblProducts
drop table tblProductSizeQuantity
drop procedure procBindAllProducts