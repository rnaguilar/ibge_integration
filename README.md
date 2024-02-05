# ibge_integration
Projeto IBGE 
Engenharia (Spark)
Estrutura de dados SQL e Parquet
Data Viz - Power BI


Instruções de Implantação

Este projeto requer alguns pré-requisitos e configurações específicas para ser implantado com sucesso. Siga as etapas abaixo para configurar o ambiente e executar o projeto.

Configuração do Ambiente
Banco de Dados:

Certifique-se de ter um banco de dados de sua preferência instalado e em execução.
Instalação de Dependências:

Execute o seguinte comando para instalar as dependências listadas no arquivo requirements.txt:
bash
Copy code
pip install -r requirements.txt
Criação de Bancos de Dados:

Crie três bases de dados denominadas bronze_data, silver_data e gold_data em seu banco de dados.
Execução do Script SQL:

Após criar as bases de dados, execute o script sql_silver_start.py para configurar a estrutura inicial do banco de dados silver_data.
Configuração do Docker (Opcional)
Caso prefira utilizar um banco de dados PostgreSQL via Docker, siga estas instruções:

Instalação do Docker:

Se ainda não tiver o Docker instalado, faça o download em Docker.
No Windows, certifique-se de ter o WSL (Windows Subsystem for Linux) instalado.
Utilização da Imagem PostgreSQL:

Este projeto utiliza a imagem oficial do PostgreSQL disponível em hub.docker.com/_/postgres.
No diretório POSTGRESQL, você encontrará o arquivo docker-compose.yml. Execute o seguinte comando para iniciar o contêiner do PostgreSQL:
bash
Copy code
docker-compose up
Configuração Adicional (Se Necessário):

Faça ajustes adicionais no arquivo docker-compose.yml conforme necessário, como configurações de porta ou credenciais.