[![Stories in Ready](https://badge.waffle.io/4Soft/SAFIRA.png?label=ready)](https://waffle.io/4Soft/SAFIRA)  
[![Stories in Ready](https://badge.waffle.io/SeuRAUL/SAFIRA.png?label=ready)](https://waffle.io/SeuRAUL/SAFIRA)  
[![Coverage Status](https://coveralls.io/repos/SeuRAUL/SAFIRA/badge.png)](https://coveralls.io/r/SeuRAUL/SAFIRA)

SAFIRA
===
SAFIRA é um aplicativo online para gerência de recursos humanos. Por enquanto, suas funcionalidades se restringem a gerência de processos seletivos.

___________________________________________________
Passos para rodar a aplicação:

1. Abra o terminal no diretório do projeto, execute os comandos "bundle install", depois "rake db:migrate", em seguida "mailcatcher";
2. Vá até o navegador e acesse a url "http://127.0.0.1:1080/";
3. Volte ao terminal e execute os comandos "rake db:seed" e "rails s"
4. Agora na página da url citada acima, terá chegado um email endereçado à 4soft, clique nele e no link dentro do email "SAFIRA - CRIE SUA CONTA", aparecerão campos para definir uma senha, digite "12345678".
