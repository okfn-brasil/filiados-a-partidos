Filiados
========

A lista de pessoas filiadas é disponibilizada pelo TSE em
http://www.tse.jus.br/eleicoes/estatisticas/filiados. Porém, os arquivos são
separados por partido e por estado, totalizando 864 arquivos. O código nesse
repositório te possibilita baixar todos.

Instruções
----------

Por padrão, se você executar somente ```make```, o código irá:

1. Baixar todos os arquivos e atualizar o timestamp com a data atual, assim na
   próxima vez ele só baixa o que foi modificado;
2. Extrair tudo em ```filiados```

Você pode executar os passos individualmente usando, respectivamente, ```make
download``` e ```make extract```.
