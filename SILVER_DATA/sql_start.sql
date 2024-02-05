drop table if exists public.pesquisas ;
drop table if exists public.tipo_pesquisa ;
drop table if exists public.municipio ;
drop table if exists public.estado ;
drop table if exists public.regiao ;

-- Criar tabela public.regiao
CREATE TABLE public.regiao (
    id_regiao INT PRIMARY KEY,
    regiao VARCHAR(255) NOT NULL
);

-- Criar tabela public.tipo_pesquisa
CREATE TABLE public.tipo_pesquisa (
    cd_pesquisa VARCHAR(255) PRIMARY KEY NOT NULL,
    pesquisa VARCHAR(255) NOT NULL,
    url_ibge text not null
);

insert into public.tipo_pesquisa(cd_pesquisa, pesquisa,url_ibge) values
('37_5938','pib','https://servicodados.ibge.gov.br/api/v3/agregados/5938/periodos/{ano}/variaveis/37?localidades=N6[N3[11]]'),
('30255','idh','https://servicodados.ibge.gov.br/api/v1/pesquisas/37/resultados/11'),
('9324_6579','populacional','https://servicodados.ibge.gov.br/api/v3/agregados/6579/periodos/{ano}/variaveis/9324?localidades=N6[N3[35]]')
;


-- Criar tabela public.estado
CREATE TABLE public.estado (
    id_estado  INT PRIMARY KEY,
    uf CHAR(2) unique NOT NULL,
    estado VARCHAR(255) NOT NULL,
    latitude VARCHAR(20) NOT NULL,
    longitude VARCHAR(20) NOT NULL,
    id_regiao INT NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES public.regiao(id_regiao)
);

-- Criar os municipios public.municipios
CREATE TABLE public.municipio (
    id_municipio int PRIMARY KEY,
    municipio varchar not null,
    uf  char(2) not null,
    flag_capital boolean null,
    FOREIGN KEY (uf) REFERENCES public.estado(uf)
);


-- Criar tabela public.pesquisas
CREATE TABLE public.pesquisas (
    ano INT NOT NULL,
    cd_pesquisa VARCHAR NOT NULL,
    municipio int null,
    cd_estado bigint NULL,    
    valor VARCHAR NULL
);

GRANT REFERENCES, TRUNCATE, TRIGGER, UPDATE, DELETE, SELECT, INSERT ON TABLE public.pesquisas TO ibge;

ALTER TABLE public.pesquisas ADD CONSTRAINT pesquisas_tipo_pesquisa_fk FOREIGN KEY (cd_pesquisa) REFERENCES public.tipo_pesquisa(cd_pesquisa);

