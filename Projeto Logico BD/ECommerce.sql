-- Exercício de Criação Banco de dados para um E-commerce

create database test;
use test;

	-- Criação tabela Cliente --
	create table clients (
	idClient int auto_increment primary key, 
    FullName varchar(45), 
    PFouPJ enum('Pessoa Física', 'Pessoa Jurídica'), 
    Document int, 
    Phone int, 
    Address varchar(45), 
    CEP int
    );

    -- Criação tabela Entrega --
    create table Shipping (
    Tracking varchar(45) primary key,
    Company varchar(45),
    TrackingStatus ENUM('Aguardando Envio', 'Enviado', 'Entregue')
    );

	-- Criação tabela Pedido --
	create table Ordered (
	idOrder int primary key, 
    idOrderClient int,
    idOrderTracking varchar(45),
    idOrderPayment int,
    constraint fk_idOrderClient foreign key (idOrderClient) references clients(idClient),
    Shipping float, 
    Price float,  
    constraint fk_idOrderTracking foreign key (idOrderTracking) references shipping(Tracking),
    Address varchar(45) not null, 
    ZIP int not null,
	TotalPrice float
	);
    
	-- Criação tabela ProdutosPedido --
	create table ProductsOrder (
	idOrder int, 
    idClient int, 
    SKU int,
	constraint fk_idOrder foreign key (idOrder) references Ordered(idOrder),
    constraint fk_idClient foreign key (idClient) references clients(idClient),
	constraint fk_SKU foreign key (SKU) references products(SKU),
    Quantity int
    );
    
    -- Criação tabela Produto --
	create table Products (
    SKU int primary key, 
    Nome varchar(45),
    ValorUnitario float, 
    Category varchar(45),
    ProductDescription varchar(45)
    );
    -- Criação tabela Estoque --
    create table inventory (
    Product varchar(45),
    SKUinventory int,
    constraint fk_SKUinventory foreign key (SKUinventory) references Products(SKU),
    Quantity int,
    Category varchar(45) 
    );
    
    -- Criação tabela PedidoCompra --
	create table Purchase_Supplies (
    SKUSupplies int,
    idProvider int, 
	constraint fk_SKUSupplies foreign key (SKUSupplies) references Products(SKU),
    Quantity float, 
    constraint fk_idProvider foreign key (idProvider) references Provider(idProvider)
    );
    
    -- Criação tabela Fornecedor --
    create table Provider (
    idProvider int primary key, 
    NameProvider varchar(45), 
    Address varchar(45),
    Phone int
    );
    
    -- Criação tabela Pagamento --
    create table Payment (
    idClientpayment int, 
    idCreditCard int, 
    idBankSlip int, 
    idPayment int primary key,
    constraint fk_idClientpayment foreign key (idClientpayment) references Clients(idClient),
	constraint fk_idCreditCard foreign key (idCreditCard) references CreditCard(CardNumber),
	constraint fk_idBankSlip foreign key (idBankSlip) references BankSlip(CodBarras)
    );
    
    -- Criação tabela CartaodeCredito --
    create table CreditCard (
    CardNumber int primary key, 
    titularName varchar(45), 
    validity date, 
    securityCode int 
    );
    
    -- Criação tabela Boleto --
    create table BankSlip (
    CodBarras int primary key
    );
    