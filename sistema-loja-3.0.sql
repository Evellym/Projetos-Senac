INSERT INTO produtos (id_produto, descricao, preco)
VALUES ('09', 'Monange desodorante', 22.00), 
	('10', 'Monange sabonete líquido', 18.00),
	('11', 'Monange shampoo revitalizador', 18.00);
	
INSERT INTO produtos (id_produto, descricao, preco)
VALUES 
	('12', 'Refrigerante Coca Cola', 9.00),
	('13', 'Refrigerante Guaraná', 8.50);
	
SELECT * FROM produtos WHERE descricao LIKE '%Monange%';

SELECT * FROM produtos WHERE descricao LIKE '%Refrigerante%' AND preco < 10.00;

SELECT * FROM clientes WHERE nome LIKE '%A%';

SELECT * FROM clientes WHERE cpf like '%00%';

ALTER TABLE clientes ALTER COLUMN cpf TYPE varchar;
--MD5 pra criptografar o cpf
INSERT INTO clientes (id_cliente,cpf,nome,email,telefone)
VALUES ('10',md5('12345678900'),'Bianca', 'biancaandrade@gmail.com',' (62) 95522-4477'),
	('09',md5('12345678950'),'Ana', 'anaandrade@gmail.com',' (62) 95882-4477');

SELECT * FROM clientes WHERE nome LIKE 'B_____';

SELECT * FROM vendas WHERE datahora = '2023-05-16';

SELECT * FROM  vendas WHERE fkproduto = '01';

SELECT * FROM vendas WHERE fkproduto = '02';

-- PRA CONTAR REGISTROS DO CLIENTE - SELECT COUNT(*) FROM clientes;

-- MSM COISA DO COUNT SÓ Q PRA CONTAR OS DIFERENTES - SELECT COUNT (DISTINCT descricao) FROM produtos;

-- SELECT 'Monange' AS descricao, produtos FROM produtos;

-- VER O MAIS O PRODUTO CARO
--SELECT MAX (preco) FROM produtos;

--1) Crie o campo "categoria" na tabela "produtos".
ALTER TABLE produtos ADD categoria VARCHAR;

--2) Edite seus registros de modo que haja pelo menos 3 categorias de produtos.
UPDATE produtos SET categoria = 'Bebida' WHERE descricao = 'Refrigerante Guaraná';
UPDATE produtos SET categoria = 'Pó' WHERE descricao = 'Café';
UPDATE produtos SET categoria = 'Cuidados' WHERE descricao = 'Monange desodorante';

--3) Mostre o produto mais caro de cada categoria.
SELECT categoria, MAX (preco) categoria FROM produtos GROUP BY categoria;
--AS preco_mais_caro dps (preco) funciona e add um nome pra coluna:preco_mais_caro not null
--ao invés de ficar como 'count'

--4) Mostre a quantidade de produtos adquiridos na venda feita para o cliente 1.
INSERT INTO vendas (fkcliente,fkproduto,formapgto,datahora)
VALUES ('01','01','Dinheiro',current_timestamp ),
('01','02','Dinheiro',current_timestamp ),
('02','04','Dinheiro',current_timestamp ),
('03','07','Crédito',current_timestamp ),
('04','02','PIX',current_timestamp ),
('04','01','PIX',current_timestamp ),
('05','05','Débito',current_timestamp ),
('05','02','Débito',current_timestamp );

SELECT COUNT (fkproduto) FROM vendas WHERE fkcliente = '01';

--5) Mostre qual o produto menos vendido e em quantas vendas este produto apareceu.
SELECT fkproduto, COUNT (fkproduto) AS total FROM vendas GROUP BY fkproduto ORDER BY total;
--ORDER BY total DESC maior pro menor

--6) Mostre qual o cliente que realizou mais compras.
SELECT fkcliente, COUNT (fkcliente) AS total FROM vendas GROUP BY fkcliente ORDER BY total DESC;]


/* EXERCÍCIO DE FIXAÇÃO VIII
1) CRIE RELATÓRIOS QUE MOSTREM O TOTAL DE VENDAS(QUANTIDADE)
a) por cliente, ordenado pelo total (descrescente)*/

SELECT fkcliente, COUNT (fkcliente) AS total_vendas_cliente FROM vendas GROUP BY fkcliente ORDER BY total_vendas_cliente;

--b) por produto ordenado pelo total (descrescente)
SELECT fkproduto, COUNT(*) AS total_vendas_produto FROM vendas GROUP BY fkproduto ORDER BY total_vendas_produto DESC;

--c) por data da mais recente p/mais antiga
SELECT datahora, COUNT (*) AS total_vendas_data FROM vendas GROUP BY datahora ORDER BY total_vendas_data;

/*2) MODIFIQUE O RELATÓRIO VENDAS POR DATA PARA QUE MOSTRA O TOTAL DE VENDAS
a) por mês */
SELECT DATE_PART ('MONTH', CURRENT_DATE) AS datahora;

/* SAUL -  SELECT fkcliente, fkproduto, to_char(datahora, 'MONTH') AS mes FROM vendas ORDER BY mes; */
--b)por ano 
SELECT DATE_PART('YEAR',CURRENT_TIMESTAMP) AS AnoAtual;

--c)por dia da semana
SELECT fkProduto,fkCliente, TO_CHAR(datahora, 'Day') AS dia_da_semana
FROM vendas order by dia_da_semana;


/*SELECT fkProduto, fkCliente, EXTRACT(DOW FROM datahora) AS dia_da_semana
FROM vendas
ORDER BY dia_da_semana;*/