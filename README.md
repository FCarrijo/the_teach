## Projeto Integrador IV - DESENVOLVIMENTO DE SISTEMAS ORIENTADO A DISPOSITIVOS MÓVEIS E BASEADOS NA WEB

[Fabiane Carrijo Gonçalves de Menezes](https://github.com/FCarrijo)

Kleber Paulo Alves de Carvalho

Maria Phyllis Mocock Ferreira Furtado Soares

[Willian dos Santos Rodrigues](https://github.com/willianrdg)

## TheTeach

Este é o MVP da plataforma de educação TheTeach, destinada a alunos, que buscam desenvolver novas habilidades ou aperfeiçoar seus conhecimentos em áreas
de seu interesse, e para professores particulares, que desejam expandir a sua lista de alunos.

![Chat Preview](https://github.com/FCarrijo/the_teach/blob/master/public/tela_principal.png)

## Ambiente de desenvolvimento e tecnologias utilizadas

As tecnologias e ferramentas utilizadas neste projeto são:

* Ruby version ruby 3.2.2
* Ruby on Rails version 7.0.4
* MySQL
* HTML, JS e CSS
* [DBBeaver](https://dbeaver.io/download/)
* GitHub

## Instruções para executar o projeto

* Instalar o rbenv
* Instalar o Ruby a partir do rbenv
* Clonar o repositório do projeto com o comando *git clone*
* Instalar o SGBD MySQL
* Criar um banco de dados utilizando as configurações do arquivo [database.yml](config/database.yml)
* Executar o comando *bundle install* pra instalar as gems do projeto
* Executar o comando *rake db migrate* para criar as tabelas no banco

## Instruções de acesso
O Administrador precisa cadastrar os alunos e professores. A senha padrão para o Aluno é '1234'. Ao logar com o aluno, ele poderá alterar seu cadastro, visualizar os professores e agendar um aula particular em Minha Agenda.

* Como Acessar:
    - User: admin@theteach.com.br
    - Password: 1234

- Tela Principal do Aluno
![Chat Preview](https://github.com/FCarrijo/the_teach/blob/master/public/principal_aluno.png)

- Agenda do Aluno
![Chat Preview](https://github.com/FCarrijo/the_teach/blob/master/public/tela_principal.png)

## Informações técnicas

**Relationship Entity Diagram - DER**
  ![Chat Preview](https://github.com/FCarrijo/the_teach/blob/master/public/DER.png)

**Ruby Gems**
* Devise
* CanCanCan
* activerecord-session_store
* bootstrap_form
* font-awesome-rails
* select2-rails
* devise
* cancancan
* activerecord-session_store

## Versão
1.0.0.0

