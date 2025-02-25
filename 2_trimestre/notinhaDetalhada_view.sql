select * from produto; 

select * from cliente;

select * from funconario;
select * from cargo;

select* from venda;
select * from itensvenda;


/*No projeto da Lanchonete, criar uma VIEW (vi_notinha) que mostre o código de cada venda, 
o nome de cada item vendido, a respectiva quantidade vendida e o preço de venda de cada item. 
Exiba também o valor a ser pago pelos mesmos tipos de item.*/
create view vi_notinha as (
select iv.venda_codVenda, p.nome, iv.quantVenda as "Quantidade Vendida", 
format(p.precoVenda,2) as "Preço de venda", format(iv.quantVenda * p.precoVenda,2) as "Valor a ser pago" from produto as p 
inner join itensVenda as iV on p.codProduto = iV.produto_codProduto);
select * from vi_notinha;


<<<<<<< HEAD
select v.codVenda, c.nomeCliente, v.tipoPagamento from venda as v inner join cliente as c on v.cliente_codCliente= c.codCliente;
=======
>>>>>>> 8fb14e9fb3261a7fc8d079013819bcb2de449b73


/*No projeto da Lanchonete, criar uma VIEW (vi_totalPagarPorVenda) que mostre o código de cada
venda, o nome do respectivo cliente, o valor total a pagar e o método de pagamento.*/

create view vi_totalPagarporVenda as(
select v.codVenda, c.nomeCliente, v.tipoPagamento, 
sum(format(iv.quantVenda * p.precoVenda,2)) as "Total da Compra" from venda as v 
inner join cliente as c on v.cliente_codCliente = c.codCliente 
inner join itensVenda as iV on iv.venda_codVenda = v.codVenda 
inner join produto as p on p.codProduto = iv.produto_codProduto 
group by v.codVenda, c.nomeCliente, v.tipoPagamento);
select * from vi_totalPagarporVenda;


