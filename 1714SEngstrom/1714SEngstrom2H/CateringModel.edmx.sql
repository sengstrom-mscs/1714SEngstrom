
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/08/2020 16:38:34
-- Generated from EDMX file: C:\Users\stace\OneDrive\Documents\School\Comc1714\1714SEngstrom\1714SEngstrom\1714SEngstrom2H\CateringModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CompanyCatering];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(25)  NOT NULL,
    [LastName] nvarchar(25)  NOT NULL
);
GO

-- Creating table 'Caterers'
CREATE TABLE [dbo].[Caterers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(35)  NOT NULL,
    [Address] nvarchar(35)  NOT NULL,
    [City] nvarchar(35)  NOT NULL,
    [State] nvarchar(2)  NOT NULL,
    [Zip] int  NOT NULL,
    [Phone] nvarchar(15)  NOT NULL,
    [Email] nvarchar(35)  NOT NULL
);
GO

-- Creating table 'Menus'
CREATE TABLE [dbo].[Menus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Item] nvarchar(25)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DepartmentName] nvarchar(25)  NOT NULL
);
GO

-- Creating table 'EmpStatus'
CREATE TABLE [dbo].[EmpStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Person_Id] int  NOT NULL,
    [Department_Id] int  NOT NULL,
    [Employment_Id] int  NOT NULL
);
GO

-- Creating table 'Contracts'
CREATE TABLE [dbo].[Contracts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Total] decimal(18,0)  NOT NULL,
    [Caterer_Id] int  NOT NULL,
    [Menu_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Caterers'
ALTER TABLE [dbo].[Caterers]
ADD CONSTRAINT [PK_Caterers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Menus'
ALTER TABLE [dbo].[Menus]
ADD CONSTRAINT [PK_Menus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmpStatus'
ALTER TABLE [dbo].[EmpStatus]
ADD CONSTRAINT [PK_EmpStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [PK_Contracts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Person_Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_PersonEmployee]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonEmployee'
CREATE INDEX [IX_FK_PersonEmployee]
ON [dbo].[Employees]
    ([Person_Id]);
GO

-- Creating foreign key on [Department_Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_DepartmentEmployee]
    FOREIGN KEY ([Department_Id])
    REFERENCES [dbo].[Departments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentEmployee'
CREATE INDEX [IX_FK_DepartmentEmployee]
ON [dbo].[Employees]
    ([Department_Id]);
GO

-- Creating foreign key on [Employment_Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmploymentEmployee]
    FOREIGN KEY ([Employment_Id])
    REFERENCES [dbo].[EmpStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmploymentEmployee'
CREATE INDEX [IX_FK_EmploymentEmployee]
ON [dbo].[Employees]
    ([Employment_Id]);
GO

-- Creating foreign key on [Caterer_Id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [FK_CatererContract]
    FOREIGN KEY ([Caterer_Id])
    REFERENCES [dbo].[Caterers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CatererContract'
CREATE INDEX [IX_FK_CatererContract]
ON [dbo].[Contracts]
    ([Caterer_Id]);
GO

-- Creating foreign key on [Menu_Id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [FK_MenuContract]
    FOREIGN KEY ([Menu_Id])
    REFERENCES [dbo].[Menus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuContract'
CREATE INDEX [IX_FK_MenuContract]
ON [dbo].[Contracts]
    ([Menu_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------