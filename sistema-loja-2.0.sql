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