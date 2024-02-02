-- Criar tabela public.estado
CREATE TABLE public.estado (
    id_estado  PRIMARY KEY,
    uf CHAR(2) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    latitude VARCHAR(20) NOT NULL,
    longitude VARCHAR(20) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES public.regiao(id_regiao)
);

-- Criar tabela public.regiao
CREATE TABLE public.regiao (
    id_regiao INT PRIMARY KEY,
    regiao VARCHAR(255) NOT NULL
);

-- Criar tabela public.tipo_pesquisa
CREATE TABLE public.tipo_pesquisa (
    cd_pesquisa VARCHAR(255) PRIMARY KEY NOT NULL,
    pesquisa VARCHAR(255) NOT NULL
);

-- Criar tabela public.pesquisas
CREATE TABLE public.pesquisas (
    id_registro SERIAL PRIMARY KEY,
    ano INT NOT NULL,
    resultado NUMERIC NOT NULL,
    cd_pesquisa INT NOT NULL,
    id_sexo INT ,
    id_faixa INT,
    id_estado INT NOT NULL,
    FOREIGN KEY (cd_pesquisa) REFERENCES public.tipo_pesquisa(cd_pesquisa),
    FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado)
);

-- Adicionar coluna id_regiao à tabela public.pesquisas
ALTER TABLE public.pesquisas
ADD COLUMN id_regiao INT NOT NULL,
ADD CONSTRAINT fk_pesquisas_regiao FOREIGN KEY (id_regiao) REFERENCES public.regiao(id_regiao);
