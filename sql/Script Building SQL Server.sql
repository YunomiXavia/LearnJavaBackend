-- Tạo cơ sở dữ liệu
IF DB_ID(N'Building') IS NULL
BEGIN
    CREATE DATABASE Building;
END
GO

-- Xóa cơ sở dữ liệu nếu tồn tại
IF DB_ID(N'Building') IS NOT NULL
BEGIN
    DROP DATABASE Building;
END
GO

-- Sử dụng cơ sở dữ liệu
USE Building;
GO

-- Tạo bảng `district`
IF OBJECT_ID(N'district', N'U') IS NOT NULL
DROP TABLE district;
GO

CREATE TABLE district (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(255) NOT NULL UNIQUE,
    name NVARCHAR(255) NOT NULL
);
GO


-- Tạo bảng `user`
IF OBJECT_ID(N'user', N'U') IS NOT NULL
DROP TABLE [user];
GO

CREATE TABLE [user] (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    fullname NVARCHAR(255) NULL,
    phone NVARCHAR(255) NULL,
    email NVARCHAR(255) NULL,
    status INT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL
);
GO

-- Tạo bảng `customer`
IF OBJECT_ID(N'customer', N'U') IS NOT NULL
DROP TABLE customer;
GO

CREATE TABLE customer (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fullname NVARCHAR(255) NULL,
    phone NVARCHAR(255) NULL,
    email NVARCHAR(255) NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL
);
GO

-- Tạo bảng `building`
IF OBJECT_ID(N'building', N'U') IS NOT NULL
DROP TABLE building;
GO

CREATE TABLE building (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    street NVARCHAR(255) NULL,
    ward NVARCHAR(255) NULL,
    districtid BIGINT NOT NULL,
    structure NVARCHAR(255) NULL,
    numberofbasement INT NULL,
    floorarea INT NULL,
    direction NVARCHAR(255) NULL,
    level NVARCHAR(255) NULL,
    rentprice INT NOT NULL,
    rentpricedescription NVARCHAR(MAX) NULL,
    servicefee NVARCHAR(255) NULL,
    carfee NVARCHAR(255) NULL,
    motorbikefee NVARCHAR(255) NULL,
    overtimefee NVARCHAR(255) NULL,
    waterfee NVARCHAR(255) NULL,
    electricityfee NVARCHAR(255) NULL,
    deposit NVARCHAR(255) NULL,
    payment NVARCHAR(255) NULL,
    renttime NVARCHAR(255) NULL,
    decorationtime NVARCHAR(255) NULL,
    brokeragefee DECIMAL(13,2) NULL,
    note NVARCHAR(255) NULL,
    linkofbuilding NVARCHAR(255) NULL,
    map NVARCHAR(255) NULL,
    image NVARCHAR(255) NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    managername NVARCHAR(255) NULL,
    managerphonenumber NVARCHAR(255) NULL,
    CONSTRAINT FK_Building_District FOREIGN KEY (districtid) REFERENCES district(id)
);
GO

-- Tạo bảng `assignmentbuilding`
IF OBJECT_ID(N'assignmentbuilding', N'U') IS NOT NULL
DROP TABLE assignmentbuilding;
GO

CREATE TABLE assignmentbuilding (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    staffid BIGINT NOT NULL,
    buildingid BIGINT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    CONSTRAINT FK_AssignmentBuilding_Staff FOREIGN KEY (staffid) REFERENCES [user](id),
    CONSTRAINT FK_AssignmentBuilding_Building FOREIGN KEY (buildingid) REFERENCES building(id)
);
GO

-- Tạo bảng `assignmentcustomer`
IF OBJECT_ID(N'assignmentcustomer', N'U') IS NOT NULL
DROP TABLE assignmentcustomer;
GO

CREATE TABLE assignmentcustomer (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    staffid BIGINT NOT NULL,
    customerid BIGINT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    CONSTRAINT FK_AssignmentCustomer_Staff FOREIGN KEY (staffid) REFERENCES [user](id),
    CONSTRAINT FK_AssignmentCustomer_Customer FOREIGN KEY (customerid) REFERENCES customer(id)
);
GO

-- Tạo bảng `rentarea`
IF OBJECT_ID(N'rentarea', N'U') IS NOT NULL
DROP TABLE rentarea;
GO

CREATE TABLE rentarea (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    value INT NULL,
    buildingid BIGINT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    CONSTRAINT FK_RentArea_Building FOREIGN KEY (buildingid) REFERENCES building(id)
);
GO

-- Tạo bảng `renttype`
IF OBJECT_ID(N'renttype', N'U') IS NOT NULL
DROP TABLE renttype;
GO

CREATE TABLE renttype (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(255) NOT NULL UNIQUE,
    name NVARCHAR(255) NOT NULL
);
GO

-- Tạo bảng `buildingrenttype`
IF OBJECT_ID(N'buildingrenttype', N'U') IS NOT NULL
DROP TABLE buildingrenttype;
GO

CREATE TABLE buildingrenttype (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    buildingid BIGINT NOT NULL,
    renttypeid BIGINT NOT NULL,
    CONSTRAINT FK_BuildingRentType_Building FOREIGN KEY (buildingid) REFERENCES building(id),
    CONSTRAINT FK_BuildingRentType_RentType FOREIGN KEY (renttypeid) REFERENCES renttype(id)
);
GO


-- Tạo bảng `transactiontype`
IF OBJECT_ID(N'transactiontype', N'U') IS NOT NULL
DROP TABLE transactiontype;
GO

CREATE TABLE transactiontype (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    code NVARCHAR(255) NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL
);
GO

-- Tạo bảng `transaction_e`
IF OBJECT_ID(N'transaction_e', N'U') IS NOT NULL
DROP TABLE transaction_e;
GO

CREATE TABLE transaction_e (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    note NVARCHAR(255) NULL,
    customerid BIGINT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    type BIGINT NULL,
    CONSTRAINT FK_Transaction_Customer FOREIGN KEY (customerid) REFERENCES customer(id),
    CONSTRAINT FK_Transaction_TransactionType FOREIGN KEY (type) REFERENCES transactiontype(id)
);
GO

-- Tạo bảng `role`
IF OBJECT_ID(N'role', N'U') IS NOT NULL
DROP TABLE role;
GO

CREATE TABLE role (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    code NVARCHAR(255) NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL
);
GO

-- Tạo bảng `user_role`
IF OBJECT_ID(N'user_role', N'U') IS NOT NULL
DROP TABLE user_role;
GO

CREATE TABLE user_role (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    roleid BIGINT NOT NULL,
    userid BIGINT NOT NULL,
    createddate DATETIME NULL,
    modifieddate DATETIME NULL,
    createdby NVARCHAR(255) NULL,
    modifiedby NVARCHAR(255) NULL,
    CONSTRAINT FK_UserRole_Role FOREIGN KEY (roleid) REFERENCES role(id),
    CONSTRAINT FK_UserRole_User FOREIGN KEY (userid) REFERENCES [user](id)
);
GO

-- Thêm dữ liệu mẫu cho các bảng
INSERT INTO district (code, name) VALUES (N'Q1', N'Quận 1'), (N'Q2', N'Quận 2'), (N'Q4', N'Quận 4');
GO

INSERT INTO building (name, street, ward, districtid, numberofbasement, floorarea, rentprice, rentpricedescription, createdby, managername, managerphonenumber) VALUES 
(N'Nam Giao Building Tower', N'59 phan xích long', N'Phường 2', 1, 2, 500, 15, N'15 triệu/m2', NULL, N'Anh Nam-Chị Linh', N'0915354727'),
(N'ACM Tower', N'96 cao thắng', N'Phường 4', 2, 2, 650, 18, N'18 triệu/m2', NULL, N'Chú Thuận', N'0173546263'),
(N'Alpha 2 Building Tower', N'153 nguyễn đình chiểu', N'Phường 6', 1, 1, 200, 21, N'21 triệu/m2', NULL, N'Cô Hương', N'0915666781');
GO

INSERT INTO buildingrenttype (buildingid, renttypeid) VALUES (1, 1), (1, 2), (2, 1), (3, 3);
GO

INSERT INTO customer (fullname, phone, email) VALUES (N'Nguyễn Hoàng Đức', N'0912301234', N'duc@gmail.com'), (N'Nguyễn Hoàng An', N'0912556789', N'an@gmail.com'), (N'Nguyễn Hoàng Anh', N'0912556799', N'anh@gmail.com');
GO

INSERT INTO rentarea (value, buildingid) VALUES (100, 1), (200, 1), (300, 2), (400, 3), (500, 3), (600, 4), (700, 4);
GO

INSERT INTO renttype (code, name) VALUES (N'Nguyên căn', N'Nguyên căn'), (N'Từng phần', N'Từng phần'), (N'Tầng', N'Tầng');
GO

INSERT INTO role (name, code, createddate, createdby) VALUES (N'Nhân viên', N'STAFF', NULL, NULL), (N'Quản trị', N'MANAGER', NULL, NULL);
GO

INSERT INTO [transaction_e] (note, customerid) VALUES (NULL, 1), (NULL, 2), (NULL, 3);
GO

INSERT INTO transactiontype (name, code, createddate, createdby) VALUES (N'Mua', N'BUY', NULL, NULL), (N'Thuê', N'RENT', NULL, NULL), (N'Ký gửi', N'SEND', NULL, NULL);
GO

INSERT INTO [user] (username, password, status) VALUES (N'hoangducluong', N'Qwe123456@', 1), (N'test1', N'123', 1), (N'test2', N'123', 1);
GO

INSERT INTO user_role (roleid, userid) VALUES (1, 1), (2, 2), (2, 1), (1, 3);
GO

-- Tạo các chỉ mục
CREATE INDEX IDX_Building_District ON building (districtid);
CREATE INDEX IDX_AssignmentBuilding_Staff ON assignmentbuilding (staffid);
CREATE INDEX IDX_AssignmentBuilding_Building ON assignmentbuilding (buildingid);
CREATE INDEX IDX_AssignmentCustomer_Staff ON assignmentcustomer (staffid);
CREATE INDEX IDX_AssignmentCustomer_Customer ON assignmentcustomer (customerid);
CREATE INDEX IDX_Transaction_Customer ON [transaction_e] (customerid);
CREATE INDEX IDX_Transaction_Type ON [transaction_e] (type);
CREATE INDEX IDX_UserRole_Role ON user_role (roleid);
CREATE INDEX IDX_UserRole_User ON user_role (userid);
GO
