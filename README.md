# Prova Frontend Pleno - Brasil 317 🚀

<p align="left">O exercício proposto será você criar um frontend responsível, aonde terá que se conectar no websocket, que esta nesse projeto. Os dados são de 3 criptomoedas muito volateis, aonde se faz necessário armazenar em cache esses dados (vuex), e caso perca a conexão, continuar o gráfico de onde parou.</p>


## 🚧 Requisitos da prova
0. Criar um repositorio privado no github e me adicionar sharkguto
1. Codificar o frontend usando vue.js 2 ou 3, e a framework de css que for familiar (bootstrap por exemplo)
2. Criar testes unitarios com jest
3. Renderização da tela em tempo real, com a biblioteca de charts que for mais familiar (echarts por exemplo)
4. Relatorio de 80% de cobertura de codigo
5. README auto-explicativo de como rodar seu frontend (se quiser fazer com docker , melhor ), e como executar o jest


## ✅ Requisitos Cumpridos 
🏁 Criar um repositorio privado no github e me adicionar sharkguto

🏁 Codificar o frontend usando vue.js 2 ou 3, e a framework de css que for familiar (bootstrap por exemplo)

🚫 Criar testes unitarios com jest

🏁 Renderização da tela em tempo real, com a biblioteca de charts que for mais familiar (echarts por exemplo)

🚫 Relatorio de 80% de cobertura de codigo

🏁 README auto-explicativo de como rodar seu frontend (se quiser fazer com docker , melhor ), e como executar o jest


## 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [VueJS](https://vuejs.org/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Bootstrap](https://bootstrap-vue.org/)
- [amCharts](https://www.amcharts.com/)
- [Jest](https://jestjs.io/pt-BR/)


## ✨ Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Node.js](https://nodejs.org/en/), [Docker](https://www.docker.com/), [Docker Compose](https://docs.docker.com/compose/install/) e [Yarn](https://yarnpkg.com/). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)


## 🎲 Rodando o BackEnd (Servidor)

```bash
# Clone este repositório
$ git clone <https://github.com/GuMelo/prova_brasil317-front>

# Acesse a pasta do projeto no terminal/cmd
$ cd prova_brasil317-front/api

# Estando na raiz (pasta api), execute o comando abaixo para iniciar o docker compose.
$ docker-compose up --build

# O servidor iniciará na porta:5000 - acesse <http://localhost:5000>
```


## 🎲 Rodando o FrontEnd

```bash
# Clone este repositório
$ git clone <https://github.com/GuMelo/prova_brasil317-front>

# Acesse a pasta do projeto no terminal/cmd
$ cd prova_brasil317-front

# Estando na raiz do projeto (pasta front), execute o comando abaixo para instalar as dependências do projeto.
$ yarn install

# Execute a aplicação em modo de desenvolvimento
$ yarn serve

# O servidor iniciará na porta:8080 - acesse <http://localhost:8080>
```


## 🎲 Rodando os Testes com Jest

```bash
# Após já ter instalados as dependências no procedimento de "Rodar o Frontend",
# Estando na raiz do projeto (pasta front), execute o comando abaixo para executar os testes em Jest.
$ yarn test:unit
```
