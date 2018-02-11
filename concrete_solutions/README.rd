Teste da Concrete Solutions, um teste para aplicar os descontos em produtos, os itens A, B, C são produtos diferentes, e o desconto é aplicado conforme a regra que está no site deles.

- A ideia foi fazer o teste em poucas linhas (34 linhas), ou seja tenho uma função que aplica os valores sem desconto, e outra que vai aplicar os descontos.
- Fiz os testes unitários sem importar o unittest, geralmente os rubystas fazem com o Rspec, e não com o unittest,  como são testes com a mesma função não vi necessidade de importar uma biblioteca para isso, com uma simples função podemos fazer isso.
- Fiz um módulo chamado de DataBase, ele vai tratar as informações que preciso para realizar os testes.
- Poderia ter deixado em menos linhas, mas ia ficar dificil de entender depois.
- Não fiz attr_acessor ou attr_name, não achei que tinha necessidade pois não estou usando em nenhum lugar, trato os dados pelo módulo. Mas em uma aplicação Web seria interessante fazer.

Para iniciar o teste é somente rodar o arquivo na linha de comando.

```
ruby run_tests.rb
```
