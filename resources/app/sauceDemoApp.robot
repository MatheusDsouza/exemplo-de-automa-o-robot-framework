*** Settings ***
Resource    ../po/carrinho.robot
Resource    ../po/checkout.robot
Resource    ../po/login.robot
Resource    ../po/produtos.robot

*** Variables ***

&{usuario_sem_username}                nome=                  senha=secret_sauce 
&{usuario_sem_senha}                   nome=standard_user     senha= 
&{usuario_invalido}                    nome=invalid_user      senha=invalid_password
&{usuario_bloqueado}                   nome=locked_out_user   senha=secret_sauce 


*** Keywords ***

Carrega pagina login
    login.Carrega a pagina
    login.Verifica carregamento da pagina

Efetua Login de usuario vazio
    login.Insere dados do usuario e confirma insercao  &{usuario_sem_username} 
    login.Verifica erro usuario vazio

Efetua Login de senha vazia
    login.Insere dados do usuario e confirma insercao  &{usuario_sem_senha} 
    login.Verifica erro senha vazia

Efetua Login de usuario invalido
    login.Insere dados do usuario e confirma insercao  &{usuario_invalido} 
    login.Verifica erro usuario invalido

Efetua Login de usuario bloqueado
    login.Insere dados do usuario e confirma insercao  &{usuario_bloqueado}  
    login.Verifica erro usuario bloqueado

Efetua Login de usuario valido
    login.Insere dados do usuario e confirma insercao  &{USUARIO} 
    produtos.Verifica pagina

Procura pelo produto
    produtos.Verifica pagina
    produtos.Encontra o produto

Adiciona ao carrinho
    produtos.Adiciona ao carrinho
    carrinho.Verifica carrinho

Abre o carrinho
    carrinho.Clica no carrinho

Verifica item no carrinho
    carrinho.Verifica item no carrinho    &{PRODUTO}

Remove item do carrinho
    carrinho.Remove item do carrinho

Prossegue para o checkout one
    carrinho.Vai para o checkout
    checkout.Verifica carregamento da pagina step one

Checkout first name erro
    checkout.Preenche dados first name vazio

Checkout last name erro
    checkout.Preenche dados last name vazio

Checkout zip erro
    checkout.Preenche dados zip code vazio

Checkout sem dados erro
    checkout.Preenche dados vazio

Checkout valido
    checkout.Preenche dados validos
    checkout.Verifica carregamento da pagina step two
    checkout.Verifica informacoes de checkout

Finaliza o pedido
    checkout.Prossegue para finalizacao
    checkout.Verifica informacoes do checkout completo
