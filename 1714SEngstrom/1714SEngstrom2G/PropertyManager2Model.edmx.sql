
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/29/2020 20:04:13
-- Generated from EDMX file: C:\Users\stace\OneDrive\Documents\School\Comc1714\1714SEngstrom\1714SEngstrom\1714SEngstrom2G\PropertyManager2Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PropertyManager2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BuildingApartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_BuildingApartment];
GO
IF OBJECT_ID(N'[dbo].[FK_ApartmentInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_ApartmentInvoice];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceLineItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LineItems] DROP CONSTRAINT [FK_InvoiceLineItem];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceReciept]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reciepts] DROP CONSTRAINT [FK_InvoiceReciept];
GO
IF OBJECT_ID(N'[dbo].[FK_TenantApartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_TenantApartment];
GO
IF OBJECT_ID(N'[dbo].[FK_AdminApartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_AdminApartment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Buildings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Buildings];
GO
IF OBJECT_ID(N'[dbo].[LineItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LineItems];
GO
IF OBJECT_ID(N'[dbo].[Apartments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Apartments];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[Reciepts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reciepts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Buildings'
CREATE TABLE [dbo].[Buildings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BuildingName] nvarchar(35)  NOT NULL,
    [Address] nvarchar(50)  NOT NULL,
    [State] nvarchar(5)  NOT NULL,
    [City] nvarchar(25)  NOT NULL,
    [Zip] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'LineItems'
CREATE TABLE [dbo].[LineItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(35)  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL,
    [Invoice_Id] int  NOT NULL
);
GO

-- Creating table 'Apartments'
CREATE TABLE [dbo].[Apartments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ApartmentNum] nvarchar(10)  NOT NULL,
    [SquareFeet] int  NOT NULL,
    [Bathrooms] int  NOT NULL,
    [Rent] decimal(18,0)  NOT NULL,
    [Building_Id] int  NOT NULL,
    [Tenant_Id] int  NOT NULL,
    [Admin_Id] int  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(25)  NOT NULL,
    [LastName] nvarchar(25)  NOT NULL,
    [Phone] nvarchar(15)  NOT NULL,
    [Email] nvarchar(35)  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InvoiceDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [Apartment_Id] int  NOT NULL
);
GO

-- Creating table 'Reciepts'
CREATE TABLE [dbo].[Reciepts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RecieptDate] datetime  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Invoice_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [PK_Buildings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [PK_LineItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [PK_Apartments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reciepts'
ALTER TABLE [dbo].[Reciepts]
ADD CONSTRAINT [PK_Reciepts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Building_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_BuildingApartment]
    FOREIGN KEY ([Building_Id])
    REFERENCES [dbo].[Buildings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuildingApartment'
CREATE INDEX [IX_FK_BuildingApartment]
ON [dbo].[Apartments]
    ([Building_Id]);
GO

-- Creating foreign key on [Apartment_Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_ApartmentInvoice]
    FOREIGN KEY ([Apartment_Id])
    REFERENCES [dbo].[Apartments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApartmentInvoice'
CREATE INDEX [IX_FK_ApartmentInvoice]
ON [dbo].[Invoices]
    ([Apartment_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [FK_InvoiceLineItem]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceLineItem'
CREATE INDEX [IX_FK_InvoiceLineItem]
ON [dbo].[LineItems]
    ([Invoice_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'Reciepts'
ALTER TABLE [dbo].[Reciepts]
ADD CONSTRAINT [FK_InvoiceReciept]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceReciept'
CREATE INDEX [IX_FK_InvoiceReciept]
ON [dbo].[Reciepts]
    ([Invoice_Id]);
GO

-- Creating foreign key on [Tenant_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_TenantApartment]
    FOREIGN KEY ([Tenant_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TenantApartment'
CREATE INDEX [IX_FK_TenantApartment]
ON [dbo].[Apartments]
    ([Tenant_Id]);
GO

-- Creating foreign key on [Admin_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_AdminApartment]
    FOREIGN KEY ([Admin_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminApartment'
CREATE INDEX [IX_FK_AdminApartment]
ON [dbo].[Apartments]
    ([Admin_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------