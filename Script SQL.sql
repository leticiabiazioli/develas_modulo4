
CREATE TABLE public.email (
                id_email INTEGER NOT NULL,
                email VARCHAR NOT NULL,
                CONSTRAINT email_pk PRIMARY KEY (id_email)
);


CREATE TABLE public.telefone (
                id_telefone INTEGER NOT NULL,
                telefone VARCHAR NOT NULL,
                CONSTRAINT telefone_pk PRIMARY KEY (id_telefone)
);


CREATE TABLE public.cidade (
                id_cidade INTEGER NOT NULL,
                cidade VARCHAR NOT NULL,
                estado VARCHAR NOT NULL,
                CONSTRAINT cidade_pk PRIMARY KEY (id_cidade)
);


CREATE TABLE public.tipo_cliente (
                id_tipo_cliente INTEGER NOT NULL,
                tipo_cliente VARCHAR NOT NULL,
                CONSTRAINT tipo_cliente_pk PRIMARY KEY (id_tipo_cliente)
);


CREATE TABLE public.cliente (
                id_cliente INTEGER NOT NULL,
                id_cidade INTEGER NOT NULL,
                id_tipo_cliente INTEGER NOT NULL,
                id_telefone INTEGER NOT NULL,
                id_email INTEGER NOT NULL,
                cliente VARCHAR NOT NULL,
                CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);


CREATE TABLE public.loja (
                id_loja INTEGER NOT NULL,
                id_telefone INTEGER NOT NULL,
                id_cidade INTEGER NOT NULL,
                loja VARCHAR NOT NULL,
                receita REAL NOT NULL,
                CONSTRAINT loja_pk PRIMARY KEY (id_loja)
);


CREATE TABLE public.tipo_carro (
                id_tipo_carro INTEGER NOT NULL,
                tipo_carro VARCHAR NOT NULL,
                CONSTRAINT tipo_carro_pk PRIMARY KEY (id_tipo_carro)
);


CREATE TABLE public.carro (
                id_carro INTEGER NOT NULL,
                carro VARCHAR NOT NULL,
                marca VARCHAR NOT NULL,
                modelo VARCHAR NOT NULL,
                cor VARCHAR NOT NULL,
                placa VARCHAR NOT NULL,
                id_tipo_carro INTEGER NOT NULL,
                CONSTRAINT carro_pk PRIMARY KEY (id_carro)
);


CREATE TABLE public.vendedor (
                id_vendedor INTEGER NOT NULL,
                vendedor VARCHAR NOT NULL,
                apelido_vendedor VARCHAR NOT NULL,
                data_admissao DATE NOT NULL,
                CONSTRAINT vendedor_pk PRIMARY KEY (id_vendedor)
);


CREATE TABLE public.venda (
                cod_venda INTEGER NOT NULL,
                comissao VARCHAR NOT NULL,
                data_venda DATE NOT NULL,
                valor REAL NOT NULL,
                id_carro INTEGER NOT NULL,
                id_vendedor INTEGER NOT NULL,
                id_loja INTEGER NOT NULL,
                id_cliente INTEGER NOT NULL,
                CONSTRAINT venda_pk PRIMARY KEY (cod_venda)
);


ALTER TABLE public.cliente ADD CONSTRAINT email_cliente_fk
FOREIGN KEY (id_email)
REFERENCES public.email (id_email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cliente ADD CONSTRAINT telefone_cliente_fk
FOREIGN KEY (id_telefone)
REFERENCES public.telefone (id_telefone)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.loja ADD CONSTRAINT telefone_loja_fk
FOREIGN KEY (id_telefone)
REFERENCES public.telefone (id_telefone)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cliente ADD CONSTRAINT cidade_cliente_fk
FOREIGN KEY (id_cidade)
REFERENCES public.cidade (id_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.loja ADD CONSTRAINT cidade_loja_fk
FOREIGN KEY (id_cidade)
REFERENCES public.cidade (id_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cliente ADD CONSTRAINT tipo_cliente_cliente_fk
FOREIGN KEY (id_tipo_cliente)
REFERENCES public.tipo_cliente (id_tipo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.venda ADD CONSTRAINT cliente_venda_fk
FOREIGN KEY (id_cliente)
REFERENCES public.cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.venda ADD CONSTRAINT loja_venda_fk
FOREIGN KEY (id_loja)
REFERENCES public.loja (id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.carro ADD CONSTRAINT tipo_carro_carro_fk
FOREIGN KEY (id_tipo_carro)
REFERENCES public.tipo_carro (id_tipo_carro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.venda ADD CONSTRAINT carro_venda_fk
FOREIGN KEY (id_carro)
REFERENCES public.carro (id_carro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.venda ADD CONSTRAINT vendedor_venda_fk
FOREIGN KEY (id_vendedor)
REFERENCES public.vendedor (id_vendedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
