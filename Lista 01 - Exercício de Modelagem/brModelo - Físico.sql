/* Lógico_1: */

CREATE TABLE CLIENTES (
    Cod_Clientes                        INTEGER PRIMARY KEY,
    Nome                                VARCHAR(50),
    Sobrenome                           VARCHAR(50),
    DDD                                 CHAR(2),
    Telefone                            VARCHAR(15),
    Saldo                               DECIMAL,
    Inicial                             CHAR
);

CREATE TABLE FATURA (
    Num_Fatura                           INTEGER PRIMARY KEY,
    Data_Fatura                          DATE,
    FK_CLIENTES_Cod_Clientes             INTEGER
);

CREATE TABLE LINHAS (
    Num_Linha                            INTEGER PRIMARY KEY,
    Unidades                             INTEGER,
    Valor                                DECIMAL,
    FK_FATURA_Num_Fatura                 INTEGER,
    FK_PRODUTOS_Cod_Produto              INTEGER
);

CREATE TABLE PRODUTOS (
    Cod_Produto                           INTEGER PRIMARY KEY,
    Data_Compra                           DATE,
    Descricao                             VARCHAR(150),
    Desconto                              DECIMAL,
    Quantidade                            INTEGER,
    FK_FORNECEDORES_Cod_Fornecedor        INTEGER
);

CREATE TABLE FORNECEDORES (
    Cod_Fornecedor                        INTEGER PRIMARY KEY,
    Cidade                                VARCHAR(50),
    DDD                                   CHAR(2),
    Nome                                  VARCHAR(50),
    Contato                               VARCHAR(50),
    Telefone                              VARCHAR(15),
    Estado                                CHAR(2)
);
 
ALTER TABLE FATURA ADD CONSTRAINT FK_FATURA_2
    FOREIGN KEY (FK_CLIENTES_Cod_Clientes)
    REFERENCES CLIENTES (Cod_Clientes)
    ON DELETE CASCADE;
 
ALTER TABLE LINHAS ADD CONSTRAINT FK_LINHAS_1
    FOREIGN KEY (FK_FATURA_Num_Fatura)
    REFERENCES FATURA (Num_Fatura)
    ON DELETE RESTRICT;
 
ALTER TABLE LINHAS ADD CONSTRAINT FK_LINHAS_2
    FOREIGN KEY (FK_PRODUTOS_Cod_Produto)
    REFERENCES PRODUTOS (Cod_Produto)
    ON DELETE CASCADE;
 
ALTER TABLE PRODUTOS ADD CONSTRAINT FK_PRODUTOS_2
    FOREIGN KEY (FK_FORNECEDORES_Cod_Fornecedor)
    REFERENCES FORNECEDORES (Cod_Fornecedor)

    ON DELETE CASCADE;

