*** Settings ***
Library           SeleniumLibrary

*** Variables ***
&{campos_checkout}     firstName=id=first-name  lastName=id=last-name  zipCode=id=postal-code  continueButton=id=continue  erroMsg=css=h3[data-test="error"]
${botao_finalizar}=    finish
&{first_name}                          nomeVazio=             nome=Matheus            erroMsg=Error: First Name is required
&{last_name}                           nomeVazio=             nome=Souza              erroMsg=Error: Last Name is required
&{zip_code}                            zipVazio=              zip=08720111            erroMsg=Error: Postal Code is required

*** Keywords ***
Verifica carregamento da pagina step one
    Location Should Be                  ${URL_DE_INICIO}checkout-step-one.html
    Wait Until Page Contains Element    ${LOGO}
    Sleep    ${TIME_OUT}

Verifica carregamento da pagina step two
    Location Should Be                  ${URL_DE_INICIO}checkout-step-two.html
    Wait Until Page Contains Element    ${LOGO}
    Sleep    ${TIME_OUT}

Preenche dados validos
    Input Text        ${campos_checkout.firstName}      ${first_name.nome}
    Input Text        ${campos_checkout.lastName}       ${last_name.nome}
    Input Text        ${campos_checkout.zipCode}        ${zip_code.zip}
    Click Element     ${campos_checkout.continueButton}
    Sleep             ${TIME_OUT}

Preenche dados first name vazio
    Input Text                ${campos_checkout.firstName}       ${first_name.nomeVazio}
    Input Text                ${campos_checkout.lastName}        ${last_name.nome}
    Input Text                ${campos_checkout.zipCode}         ${zip_code.zip}
    Click Element             ${campos_checkout.continueButton}
    Sleep    ${TIME_OUT}
    Element Text Should Be    ${campos_checkout.erroMsg}         ${first_name.erroMsg}
    Sleep    ${TIME_OUT}

Preenche dados last name vazio
    Input Text                ${campos_checkout.firstName}       ${first_name.nome}
    Input Text                ${campos_checkout.lastName}        ${last_name.nomeVazio}
    Input Text                ${campos_checkout.zipCode}         ${zip_code.zip}
    Click Element             ${campos_checkout.continueButton}
    Element Text Should Be    ${campos_checkout.erroMsg}         ${last_name.erroMsg}
    Sleep    ${TIME_OUT}

Preenche dados zip code vazio
    Input Text                ${campos_checkout.firstName}       ${first_name.nome}
    Input Text                ${campos_checkout.lastName}        ${last_name.nome}
    Input Text                ${campos_checkout.zipCode}         ${zip_code.zipVazio}
    Click Element             ${campos_checkout.continueButton}
    Element Text Should Be    ${campos_checkout.erroMsg}         ${zip_code.erroMsg}
    Sleep    ${TIME_OUT}

Preenche dados vazio
    Input Text                ${campos_checkout.firstName}       ${first_name.nomeVazio}
    Input Text                ${campos_checkout.lastName}        ${last_name.nomeVazio}
    Input Text                ${campos_checkout.zipCode}         ${zip_code.zipVazio}
    Click Element             ${campos_checkout.continueButton}
    Sleep    ${TIME_OUT}

Verifica informacoes de checkout
    Element Text Should Be    css=div.inventory_item_name    ${PRODUTO.nome}
    Element Text Should Be    css=div.inventory_item_price   ${PRODUTO.valor}  
    Element Should Contain    css=div.summary_total_label    ${PRODUTO.valorTotal}

Prossegue para finalizacao
    Page Should Contain Element    id=${botao_finalizar}
    Click Button                   id=${botao_finalizar}
    Sleep    ${TIME_OUT}

Verifica informacoes do checkout completo
    Element Text Should Be    css=span[class="title"]             CHECKOUT: COMPLETE! 
    Element Text Should Be    css=h2[class="complete-header"]     THANK YOU FOR YOUR ORDER 
    Element Text Should Be    css=div.complete-text               Your order has been dispatched, and will arrive just as fast as the pony can get there!