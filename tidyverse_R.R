
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
