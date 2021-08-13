# exemplo-de-automacao-robot-framework
 
### Setup de ambiente (Windows): 
 
**1 - Instale o Python em https://www.python.org/downloads/ (Python 3 é recomendado)**

**2 - Após a instalação, confirme que está instalado corretamente usando os comandos:**

python -V

pip -V

**Obs: caso os comandos não funcionem, adicione os seguintes valores na variável de ambiente “PATH” seguindo os exemplos abaixo de acordo com o caminho dos arquivos instalados na sua máquina:**

C:\Users\ **seu_user** \AppData\Roaming\Python\Python39\Scripts

C:\Python39\Scripts\

C:\Python39\

**3 – Instale o Robot Framework e o Selenium utilizando os comandos:**

pip install robotframework

pip install robotframework-seleniumlibrary

pip install robotframework-selenium2library

**E também rode os comandos de upgrade:**

pip install --upgrade robotframework  

pip install --upgrade robotframework-seleniumlibrary

pip install --upgrade robotframework-selenium2library


**4 – Crie uma pasta na root do seu diretório principal (ou aonde for de melhor acesso para você) com o nome de “bin” ex: C:\bin**

Acesse o site que contenha os webdrivers do seu navegador (obs: alguns navegadores já possuem seus respectivos webdrivers, fazendo assim, desnecessário baixar qualquer outro arquivo externo)

Neste guia vamos utilizar o chrome, então acesse o site: https://chromedriver.chromium.org/downloads

Baixe o webdriver que está de acordo com sua versão do navegador

Para saber sua versão no chrome acesse: Configurações > Sobre o Google Chrome.

 Após baixar o webdriver, cole na pasta bin que criamos anteriormente.

Agora vamos novamente nas variáveis de ambiente e vamos colocar novamente na variável “PATH” o caminho do aquirvo, ex: C:\bin

OBS: caso esteja utilizando outro navegador, abra o arquivo que está dentro da pasta: tests/sauceDemo.robot e edite a variável ${NAVEGADOR} para o seu navegador.

Possíveis opções:
chrome,
firefox,
ie,
opera,
safari,
etc...

**5 – Agora é só executar um dos .bat que se encontram na pasta dos testes:**

Carrinho_Test_Set.bat -> é referente a testes no carrinho

Checkout_Test_Set.bat -> é referente a testes no checkout

Login_Test_Set.bat -> é referente a testes na página de login

Integration_Test.bat -> é referente a todos os testes do sistema

Smoke_Test.bat -> é referente aos testes funcionais (diretos) do sistema

 
 
