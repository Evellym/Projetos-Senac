CREATE TABLE produtos (
id_produto VARCHAR PRIMARY KEY,
descricao VARCHAR NOT NULL,
preco DECIMAL NOT NULL
);
CREATE TABLE clientes(
id_cliente VARCHAR PRIMARY KEY,
cpf CHAR(11) NOT NULL,
nome VARCHAR NOT NULL,
email VARCHAR NOT NULL,
telefone VARCHAR NOT NULL
);
CREATE TABLE vendas (
fkcliente VARCHAR REFERENCES clientes(id_cliente),
fkproduto VARCHAR REFERENCES produtos(id_produto),
formapgto VARCHAR CHECK (formapgto = 'Dinheiro' OR formapgto = 'Débito' OR formapgto ='Crédito' OR formapgto = 'PIX'),
datahora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (id_produto,descricao,preco)
VALUES('01', 'Arroz', 50.90),
('02', 'Feijão', 32.29),
('03', 'Maçã', 4.50),
('04', 'Café', 35.50),
('05', 'Macarrão', 4.50),
('06', 'Frango', 24.00),
('07', 'Água Sanitária', 8.50),
('08', 'Pão', 2.50);

/*  */
--mine

INSERT INTO clientes (id_cliente, cpf, nome, email, telefone)
VALUES ('01','18287686008', 'Dhyson', 'feiradamarreta@gmail.com', '(62) 60987-1853'),
('02','81505324041', 'Saul', 'saulrodrigues@gmail.com', '(62) 21683-9775'),
('03','07319750066', 'Vinicius', 'vinigameplay@gmail.com', '(62) 23427-2741'),
('04','60454015062', 'Pedro', 'developer@gmail.com', '(62) 85355-9588'),
('05','47639626048', 'Jaqueline', 'jaqueteles@gmail.com', '(62) 52555-1560');

INSERT INTO vendas (fkcliente,fkproduto,formapgto,datahora)
VALUES ('01','01','Dinheiro',current_timestamp ),
('01','02','Dinheiro',current_timestamp ),
('02','04','Dinheiro',current_timestamp ),
('03','07','Crédito',current_timestamp ),
('04','02','PIX',current_timestamp ),
('04','01','PIX',current_timestamp ),
('05','05','Débito',current_timestamp );

UPDATE produtos SET preco = preco * 1.10;

DELETE FROM produtos WHERE preco < 30.00;

SELECT * FROM produtos WHERE preco >= 50.00 AND preco <= 100.00;

SELECT * FROM vendas WHERE datahora::time > '18:00:00';
SELECT * FROM vendas WHERE fkcliente = '01';
