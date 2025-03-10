use ecommerce;

-- Inserindo informações na tabela Clientes

insert into clients(Fname, Mname, Lname, CPF, Address, Bdate)
	values('Monica', '','Riegel', 24354681215,'São Leopoldo-RS',19890529),
			('Gabriel', 'S','Borba', 24654698723,'Novo Hamburgo-RS',19930829),
            ('Maria', 'V','Rosa', 23598764532,'Esteio-RS',19881228),
			('Glaci', 'F','Silva', 95468534568,'São Leopoldo-RS',19611215),
			('Ismael', '','Riegel', 83465976215,'Nova Petropolis-RS',19830414),
             ('Catiane', 'N','Silva', 15946583216,'Novo Hamburgo-RS',19791013);
             
select * from clients;

-- Inserindo informações na tabela Produtos

insert into product(Pname, classification_kids, Category, avaliacao, Size, valor)
	values('Notebook', false,'Eletrônico', 5,'14"', 3500),
			('Bicicleta', true, 'Brinquedo', 4.5, null, 800),
            ('Vestido', false,'Vestuário', 4.9, null, 100),
            ('Armário', false,'Móveis', 5,'200x180x70', 3500),
            ('Chocolate', false,'Alimento', 5, null, 10);
            
select * from product;

-- Inserindo informações na tabela Pedido

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue)
	values('1', 'Entregue', null, 15),
			('1', 'Em andamento', 'compra on-line', 15),
            ('1', 'Enviado', null, 30),
            ('3', 'Entregue', null, 40),
			('2', 'Cancelado', 'compra on-line cancelada', 0),
            ('5', 'Enviado', null, 10),
            ('2', 'Entregue', null, 15),
			('6', 'Em andamento', 'aguardando envio', 15),
            ('3', 'Processando', 'aguardando aprovação', 30);
        
select * from orders;

-- inserindo Dados na tabela Pagamentos

insert into payments( idPaymentClient, idPaymentOrder, statusPayment, typePayment)
	values('1','1','Confirmado','PIX'),
			('1','2','Processando','Boleto'),
            ('1','3','Confirmado','Cartão'),
            ('3','4','Confirmado','Cartão'),
            ('2','5','Recusado','Cartão'),
            ('5','6','Confirmado','Pix'),
            ('2','7','Confirmado','Boleto'),
            ('6','8','Processando','Boleto'),
            ('3','9','processando','Cartão');

select * from payments;

-- inserindo Dados na tabela estoque

insert into productStorage(StorageLocation,Quantity)
	values('RJ', 1500),
            ('SP', 7550),
            ('RS', 1430);
            
select * from productStorage;

-- Inserindo Dados na tabela Fornecedor

insert into supplier(SocialName, CNPJ, Contact)
	values('Made im China Ltda', 12354568000563, 'china@china.com'),
			('Paraguai Ltda', 53698456000151, '51995648532');

select * from supplier;

-- Inserindo Dados na tabela Vendedor

insert into seller(SocialName, CNPJ, Location)
	values('Loja1 Ltda', 26549325000231, 'SP'),
			('Loja2 Ltda', 53269546000986, 'RS');

select * from seller;

-- Inserindo Dados na tabela Venda por Terceiro

insert into productSeller(idSeller, idProduct, Quanty)
	values('1','1',300),
			('2','4',56),
            ('2','5',10),
            ('1','2',80),
            ('1','3',100);

select * from productSeller;

-- Inserindo Dados na tabela Produto Pedido

insert into productOrder(idProduct, idOrder, Quanty, StatusProduct)
	values('3', '1', 1, 'Disponivel'),
			('2', '2', 2, 'Disponivel'),
            ('4', '3', 1, 'Disponivel'),
            ('1', '4', 2, 'Disponivel'),
			('3','5', default, 'Sem disponibilidade'),
            ('5', '6', 10, 'Disponivel'),
            ('3', '7', 5, 'Disponivel'),
			('2', '8', 1, 'Disponivel'),
            ('1', '9', 1, 'Disponivel');
            
select * from productOrder;

-- Inserindo dados na tabela Em Estoque

insert into storageProduct(idProduct, idProductStorage, StatusStorageProduct)
		values(1, 3, 'Disponivel'),
				(2, 1, 'Disponivel'),
                (3, 3, 'Disponivel'),
                (4, 2, 'Disponivel'),
                (5, 1, 'Disponivel');
                
select * from storageProduct;

-- Inserindo Dados na tabela Produto Fornecedor

insert into supplierProduct(idProduct, idSupplier, Quanty)
	values(1, 2, 10),
			(2, 1, 30),
			(3, 2, 20),
			(4, 2, 50),
			(5, 1, 1000);
            
select * from supplierProduct;

select count(*) from clients;

select * from clients c, orders o where c.idClient = o.idOrderClient;

select Fname, Lname, idOrder, orderStatus  from clients c, orders o where c.idClient = o.idOrderClient;

select concat(Fname, ' ', Lname) as Nome, idOrder, orderStatus  from clients c, orders o where c.idClient = o.idOrderClient;

select * from clients left outer join orders on idClient = idOrderClient;

select c.idClient, c.Fname, count(*) as Pedidos from clients c 
	inner join orders o on c.idClient = o.idOrderClient	
    group by idClient;