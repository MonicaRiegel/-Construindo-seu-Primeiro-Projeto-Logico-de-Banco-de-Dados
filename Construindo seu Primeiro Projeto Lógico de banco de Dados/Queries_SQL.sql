use ecommerce;

show tables;


-- Selecionando Lista de Produtos
select idProduct cód, Pname Produto, Category Categoria from product;

-- Menor valor, Maior valor e média dos preços;
select min(Valor) as Menor_valor, max(Valor) as Maior_valor, avg(Valor) as Média_de_Preços from product;

-- Selecionando Clientes aniversatiantes do mês de dezembro
select idClient Cód, Fname Nome, Bdate Aniversário from clients
	where month(Bdate) = 12;
    
-- Quais produtos cada cliente comprou?
select idClient Cód_Cliente, concat(Fname, ' ', Lname) Nome, Pname Produto from clients 
	inner join orders on idClient = idOrderClient
	inner join productOrder using (idOrder)
    inner join product using(idProduct)
    order by idClient;
    
-- Valor total de cada pedido
select idClient Cód_Cliente, concat(Fname, ' ', Lname) Nome, Pname Produto, Valor, Quanty Quantidade, Valor*Quanty Valor_Total  from clients 
	inner join orders on idClient = idOrderClient
	inner join productOrder using (idOrder)
    inner join product using(idProduct)
    order by idOrder;
    
-- Fornecedor de produtos kids
select SocialName Fornecedor, Contact Contato, Pname Produto from  supplier 
	inner join supplierProduct using(idSupplier)
    inner join product using(idProduct)
    where classification_kids = 1;
    
-- Filtrar os clientes que compraram Vestuário
    select Fname Nome, Category Categoria, Quanty Quantidade from clients 
	inner join orders on idClient = idOrderClient
	inner join productOrder using (idOrder)
    inner join product using(idProduct)
    having Category = 'Vestuário';
	
-- Valor total gasto pela cliente Monica
select Fname Nome, sum(Valor*Quanty) Total  from clients
	inner join orders on idClient = idOrderClient
	inner join productOrder  using (idOrder)
    inner join product using(idProduct)
    where Fname='Monica';
    
-- Produto mais vendido
select Pname Produto, sum(Quanty) Total_Vendido from product
	inner join productOrder using(idProduct)
    inner join orders using(idOrder)
    group by Pname
    order by Total_Vendido desc;