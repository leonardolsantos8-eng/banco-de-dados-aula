-- ==========
-- aula: banco de dados MySQL
-- comeÃ§o projeto TechShop
-- =============

  -- CREATE DATABASE techshop;
-- criado o banco de dados

USE techshop;
-- usar o banco de dados techshop

 CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	descricao VARCHAR(255),
	preco DECIMAL(10, 2) NOT NULL,
	estoque INT DEFAULT 0,
	ativo BOOLEAN DEFAULT TRUE
);	
-- criaÃ§ao da table produtos

INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
	('Mouser Gamer', 'Mouse com 6 botoes', 129.90, 35),
    ('Teclado Mecanico', 'Teclado RGB switch blue', 249.90, 20),
    ('Monitor Ultrawide', 'Monitor 29 polegadas Full HD 75Hz', 1199.00, 12),
    ('Headset Sem Fio','Headset com som surround 7.1',389.50, 15),
    ('Webcam Full HD', 'Webcam 1080p com microfone embutido', 189.90, 50),
    ('SSd NVMe 1TB', 'SSD M.2 leitura ate 3500MB/s', 450.00, 40),
    ('Cadeira Gamer', 'Cadeira ergonomica com apoio de breaco 3D', 899.90, 8),
    ('Hub USB-C', 'Hub 7 em 1 com porta HDMI e leitores de cartao', 159.00, 25),
    ('Microfone Condesador', 'Microfone USB para streaming com pop filter', 279.90, 18);
 
 -- cadastrando produtos e valores ao banco de dados
 
 -- SELECT * FROM produtos;
 -- mostra toda tabela da table produtos
 
SELECT nome, preco FROM produtos;
-- printa os nomes e preÃ§o dos produtos vitrine da loja

SELECT * FROM produtos WHERE PRECO > 500;
-- printa as fileiras dos produtos com preÃ§o maior de 500 

SELECT nome, estoque FROM produtos WHERE estoque < 15; 
-- busca printa os produtos com estoque menor de 15 alerta de repociÃ§ao

SELECT nome, preco FROM produtos ORDER BY preco;
-- ordena os produtos por preÃ§o 

CREATE TABLE categorias (
		id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL
);
-- criar outra tabela chamada categorias

INSERT INTO categorias (nome) VALUES
	('Periféricos e Conectividade'),
    ('Áudio e Vídeo'),
    ('Componentes e Mobiliário');
-- cadastra valores na tabela categorias

ALTER TABLE produtos ADD COLUMN categorias_id INT;
-- altera a tabela produtos addd a coluna cat...alter

ALTER TABLE produtos
	ADD FOREIGN KEY (categorias_id) REFERENCES categorias(id);
-- add um atalho? para a tabela categorias

INSERT INTO produtos (nome, descricao, preco, estoque, categorias_id) VALUES
	('SSD 480GB', 'SSd SATA de 480GB', 289.90, 40, 3);

INSERT INTO produtos (nome, descricao, preco, estoque, categorias_id) VALUES
	('Mousepad Extra Grande', 'Mousepad Speed 900x400mm com bordas costuradas', 79.90, 30, 1),
    ('Memória RAM 16GB', 'Memória DDR4 3200MHz com dissipador de calor', 289.90, 22, 3);

CREATE INDEX idx_produtos_nome ON produtos(nome);
-- criar um index apontando? para a tabela produtos coluna nome

SELECT id, nome, categorias_id FROM produtos; 

CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produtos_id INT,
    quantidade INT NOT NULL DEFAULT 1
);

ALTER TABLE pedidos
ADD FOREIGN KEY  (cliente_id) REFERENCES clientes(id),
ADD FOREIGN KEY (produtos_id) REFERENCES produtos(id);
-- a tabela pedidos teria cliente_id int com FOREIGN KEY para tabela clientes(id)
-- e produtos_id INT com FOREIGN KEY para tabela produtos(id)


SELECT * FROM pedidos;


DROP TABLE pedidos;

CREATE TABLE pedidos (
	pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100),
    produtos VARCHAR(100),
    categoria VARCHAR(100)
); 

INSERT INTO pedidos (cliente, cliente_email, produtos, categoria) VALUES
	('Joao Reis','joao@mail.com','SSD, Webcam','Perifericos'),
    ('Carla Dias','carla@mail.com','Headset','Audio');
    
    SELECT * FROM pedidos;

ALTER TABLE pedidos;

UPDATE pedidos
	SET produtos = 'SSD'
    WHERE pedido_id = 1;
    
INSERT INTO pedidos (cliente, cliente_email, produtos, categoria) VALUES
	('Joao Reis', 'joao@mail.com', 'Webcam', 'Perifericos');





    
    
ALTER TABLE pedidos
	ADD COLUMN cliente_id INT,
    ADD COLUMN produtos_id INT,
    ADD COLUMN categoria_id INT;
    
 ALTER TABLE  pedidos
	ADD COLUMN quantidade INT;
    
SET SQL_SAFE_UPDATES = 0;


UPDATE pedidos p 
	JOIN clientes c ON p.cliente_email = c.email
    SET p.cliente_id = c.id;
    
UPDATE pedidos p 
	JOIN categorias cat ON p.categoria = cat.nome
    SET p.categoria_id = cat.id;
    
UPDATE pedidos p 
	JOIN produtos pr ON p.produtos = pr.nome
    SET p.produtos_id = pr.id;

INSERT INTO produtos (nome, descricao, preco, estoque)
	VALUES ('Braço Articulado para Monitor', 'Suporte a gas com ajuste de altura e inclinacao', 219.90, 14),
('Fonte 650W 80 Plus', 'Fonte de alimentacao modular para PC gamer', 349.90, 10);

SELECT nome,preco,estoque FROM  produtos
WHERE id = 6;

 SELECT * FROM produtos;
	 
UPDATE produtos SET preco = (preco * 0.1) + preco WHERE id = 6;

UPDATE produtos SET estoque = estoque - 3 WHERE id = 6;

DELETE FROM produtos WHERE id = 13;
    

	


