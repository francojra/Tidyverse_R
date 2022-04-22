
# Tidyverse --------------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 20/04/2022 -------------------------------------------------------------------------------------------------------------------------
# Referência: https://operdata.com.br/blog/tidyverse-os-pacotes-mais-usados-no-r/ ----------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### O tidyverse é uma coleção opinativa de pacotes no R. Eles são utilizados para manipulação, 
### exploração e visualização de dados além de compartilharem uma filosofia de design comum. 
### Foram desenvolvidos principalmente pelo Hadley Wickham, mas agora estão sendo expandidos 
### por vários colaboradores.

# Pacotes ----------------------------------------------------------------------------------------------------------------------------------

### O tidyverse está sempre se atualizado e novos pacotes podem ser adicionados ou modificados. 
### Nesse artigo vamos falar sobre alguns dos mais famosos e que usamos com mais frequência.

# Instalando o tidyverse teremos o seguinte: -----------------------------------------------------------------------------------------------

if (!require(tidyverse)) {install.packages("tidyverse");require(tidyverse)}
tidyverse_packages()

# Readr ------------------------------------------------------------------------------------------------------------------------------------

### O readr foi desenvolvido para ser um jeito rápido e fácil de importar dados retangulares 
### (dados estruturados, csv, tsv e fwf) das mais diferentes fontes.

### Para exemplificar vamos rodar os dados filmes da base IMDB.

dados <- read_rds("imdb.rds")
dados

# Leitura ----------------------------------------------------------------------------------------------------------------------------------

### O readr lê seis formatos de arquivo com essas sete funções abaixo:

# - read_csv() – Arquivos separados por vírgula
# - read_tsv() – Arquivos separados por tabulação
# - read_delim() – Arquivos delimitados gerais
# - read_fwf() – Arquivos de largura fixa
# - read_table() – Arquivos tabulares em que as colunas são separadas por espaço em branco.
# - read_log() – Arquivos de log da web

# Exportação -------------------------------------------------------------------------------------------------------------------------------

### E exporta nos seguintes formatos:

# - write_csv()
# - write_csv2()
# - write_delim()
# - write_excel_csv() – Salva de csv para Excel
# - write_excel_csv2()
# - write_tsv()

# Outros arquivos --------------------------------------------------------------------------------------------------------------------------

# - haven Lê arquivos SPSS, Stata , and SAS files.
# - readxl Lê arquivos excel xls e.xlsx).
# - DBI , em conjunto junto com um back-end específico do banco de dados (por exemplo, 
# RMySQL , RSQLite , RPostgreSQL etc.) permite executar consultas SQL em um banco
# de dados e retornar uma tabela de dados.
# - Googledrive importa arquivos do Google Drive
# - jsonlite Lê arquivos json
# - xml2 Lê arquivos XML
# - httr Lê arquivos Web APIs
# - rvest Lê arquivos HTML

# Tibble -----------------------------------------------------------------------------------------------------------------------------------

### Tibbles são data frames que forçam você a lidar com os problemas no início do projeto e 
### desenvolver um código mais limpo e expressivo. Ele não altera o nome ou tipo das variáveis e 
### aponta erros quando a variável não existe. Aqui rodamos um exemplo usando a base de dados Iris.

head(data.frame(iris))
as_tibble(iris)

# Forcats ----------------------------------------------------------------------------------------------------------------------------------

### As principais funções do forcats servem para alterar a ordem e modificar os níveis de um fator.

fator <- factor(c("a","a","a","b","b", "c", "d", "e"))
fator

fct_collapse(fator, b2 = c("b", "c"), a2 = c("a", "d"))

fct_recode(fator, b2 = "b", b2 = "c", a2 = "a", a2 = "d")

fct_lump(fator, 2, other_level = "Outros") # Transforma os níveis menos frequentes de um fator em 
# um nível “Outros”.

# Broom ------------------------------------------------------------------------------------------------------------------------------------

### Broom sumariza informações-chave sobre os modelos em tibbles usando três funções: tidy, glance 
### e augment.

if (!require(broom)) {install.packages("broom");require(broom)}

fit <- lm(Sepal.Width ~ Petal.Length + Petal.Width, iris)

tidy(fit)

### tidy produz um tibble onde cada linha contém informações sobre um componente importante do 
### modelo. Para modelos de regressão, isso geralmente corresponde a coeficientes de regressão. 
### Isso pode ser útil se você deseja inspecionar um modelo ou criar visualizações personalizadas.

glance(fit)

### glance devolve um tibble com exatamente uma linha de qualidade de medidas de condicionamento 
### físico e estatísticas relacionadas. Isso é útil para verificar a especificação incorreta do 
### modelo e comparar muitos modelos.

aug <- augment(fit, data = iris)
view(aug)
write.table(aug, file = "aug.tsv", row.names = FALSE, sep = "\t") # Salvar tabela no diretório

### augment adiciona colunas a um conjunto de dados, contendo informações como valores ajustados, 
### resíduos ou atribuições de cluster. Todas as colunas adicionadas a um conjunto de dados têm 
### “.prefixo” para impedir que as colunas existentes sejam substituídas.

# Purrr ------------------------------------------------------------------------------------------------------------------------------------

### Purr contribui para a programação funcional com um consistente conjunto de ferramentas que 
### facilitam o trabalho com vetores e funções.

name <- c("Jon Snow", "Asha Greyjoy", "Daenerys Targaryen", "Eddard Stark", "Brienne of Tarth",
          "Melisandre", "Kevan Lannister", "Davos Seaworth", "Victarion Greyjoy","Sansa Stark")

### Usando imap_chr o nome (.x) e o índice do nome (.y)

imap_chr(name, ~ paste0(.y, ": ", .x))
imap_chr(name, ~ paste0("Got : ", .x))
map(name,  ~ paste0(.x))

### Outras funções do purrr:

# - map(.x, .f, …)
# - map_if(.x, .p, .f, …)
# - map_at(.x, .at, .f, …)
# - map_lgl(.x, .f, …)
# - map_chr(.x, .f, …)
# - map_int(.x, .f, …)
# - map_dbl(.x, .f, …)
# - map_dfr(.x, .f, …, .id = NULL)
# - map_dfc(.x, .f, …)
# - walk(.x, .f, …)

### Existem ainda muitos outros pacotes dentro do tidyverse, como o ggplot2 para visualização e 
### criação de gráficos, o dplyr para a manipulação de dados e o tidyr para organizar a base 
### de dados de forma coesa. 