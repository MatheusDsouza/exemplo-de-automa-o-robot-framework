*** Settings ***
Library           SeleniumLibrary

*** Variable ***
${logo_de_login} =      css=div.login_logo
&{mensagens_de_erro}    userVazio=Epic sadface: Username is required    senhaVazia=Epic sadface: Password is required    userInvalido=Epic sadface: Username and password do not match any user in this service    userBloqueado=Epic sadface: Sorry, this user has been locked out.

*** Keywords ***
Carrega a pagina
    Go To    ${URL_DE_INICIO}

Verifica carregamento da pagina
    Location Should Be        ${URL_DE_INICIO}
    Wait Until Page Contains Element    ${logo_de_login}

Insere dados do usuario e confirma insercao
    [Arguments]       &{USUARIO}
    Input Text        id=user-name          ${USUARIO.nome}
    Input Text        id=password           ${USUARIO.senha}
    Click Button      id=login-button
    Sleep             ${TIME_OUT}

Verifica erro usuario vazio
    Element Text Should Be    css=div.error-message-container    ${mensagens_de_erro.userVazio}
    Sleep    ${TIME_OUT}

Verifica erro senha vazia
    Element Text Should Be    css=div.error-message-container    ${mensagens_de_erro.senhaVazia}
    Sleep    ${TIME_OUT}

Verifica erro usuario invalido
    Element Text Should Be    css=div.error-message-container    ${mensagens_de_erro.userInvalido}
    Sleep    ${TIME_OUT}

Verifica erro usuario bloqueado
    Element Text Should Be    css=div.error-message-container    ${mensagens_de_erro.userBloqueado}
    Sleep    ${TIME_OUT}
