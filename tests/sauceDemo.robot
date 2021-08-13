*** Settings ***
Documentation             Este é uma suite de testes que cobre as funcionalidades do site Swag Labs
Resource                  ../resources/app/sauceDemoApp.robot
Resource                  ../resources/common/common.robot
Test Setup                Comecar teste web
Test Teardown             Terminar teste web

*** Variables ***

# execução em linux: robot -d results -i Integration tests

${NAVEGADOR} =            chrome
${URL_DE_INICIO} =        https://www.saucedemo.com/
&{PRODUTO}                nome=Sauce Labs Backpack    valor=$29.99         valorTotal=$32.39
${TIME_OUT} =             1.5s
&{USUARIO}                nome=standard_user          senha=secret_sauce
${LOGO} =                 css=div.app_logo

*** Test Cases ***

Login_Invalido_01

    [Documentation]                     Este teste cobre o erro da tentativa de login sem inserir o usuario
    [Tags]  Login  Integration                              
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario vazio

Login_Invalido_02

    [Documentation]                     Este teste cobre o erro da tentativa de login sem inserir a senha
    [Tags]  Login  Integration
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de senha vazia                           


Login_Invalido_03

    [Documentation]                     Este teste cobre o erro da tentativa de login com um usuario invalido
    [Tags]  Login  Integration 
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario invalido                        


Login_Invalido_04

    [Documentation]                     Este teste cobre o erro da tentativa de login com um usuario Bloqueado
    [Tags]  Login  Integration
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario bloqueado 

Login_Valido_01  

    [Documentation]                     Este teste cobre a funcionalidade de login com um usuario valido
    [Tags]  Login  Smoke  Integration                           
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido

Produto_adicionado_ao_carrinho_01
    [Documentation]                     Este teste cobre a funcionalidade de adicionar um item no carrinho
    [Tags]  Carrinho  Smoke  Integration                            
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho    


Produto_removido_do_carrinho_01
    [Documentation]                     Este teste cobre a funcionalidade de remover um item do carrinho
    [Tags]  Carrinho  Smoke  Integration                             
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Remove item do carrinho     

Checkout_Invalido_01

    [Documentation]                     Este teste cobre o erro de checkout sem itens
    [Tags]  Checkout  Integration                           
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Prossegue para o checkout one

Checkout_Invalido_02

    [Documentation]                     Este teste cobre o erro de: checkout sem informar o first name
    [Tags]  Checkout  Integration                            
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Prossegue para o checkout one
    sauceDemoApp.Checkout first name erro

Checkout_Invalido_03

    [Documentation]                     Este teste cobre o erro de: checkout sem informar o last name
    [Tags]  Checkout  Integration                             
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Prossegue para o checkout one
    sauceDemoApp.Checkout last name erro

Checkout_Invalido_04

    [Documentation]                     Este teste cobre o erro de: checkout sem informar o zip code
    [Tags]  Checkout  Integration                             
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Prossegue para o checkout one
    sauceDemoApp.Checkout zip erro

Checkout_Invalido_05

    [Documentation]                     Este teste cobre o erro de: checkout sem informar dados
    [Tags]  Checkout  Integration                             
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Prossegue para o checkout one
    sauceDemoApp.Checkout sem dados erro

Checkout_Valido_01

    [Documentation]                     Este teste cobre a funcionalidae de executar um fluxo de compra normal
    [Tags]  Checkout  Smoke  Integration                           
    sauceDemoApp.Carrega pagina login
    sauceDemoApp.Efetua Login de usuario valido
    sauceDemoApp.Procura pelo produto
    sauceDemoApp.Adiciona ao carrinho
    sauceDemoApp.Abre o carrinho
    sauceDemoApp.Verifica item no carrinho
    sauceDemoApp.Prossegue para o checkout one
    sauceDemoApp.Checkout valido
    sauceDemoApp.Finaliza o pedido