*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${botao_remover}=   remove-sauce-labs-backpack

*** Keywords ***

Verifica carrinho
    Page Should Contain Element    css=span.shopping_cart_badge

Clica no carrinho
    Click Element                       id=shopping_cart_container
    Location Should Be                  ${URL_DE_INICIO}cart.html
    Wait Until Page Contains Element    ${LOGO}

Verifica item no carrinho 
    [Arguments]  &{PRODUTO}
    Element Text Should Be    css=div.inventory_item_name    ${PRODUTO.nome}
    Element Text Should Be    css=div.inventory_item_price   ${PRODUTO.valor}   
    Sleep    ${TIME_OUT}

Remove item do carrinho
    Page Should Contain Element    id=${botao_remover}
    Click Button                   id=${botao_remover}
    Page Should Contain Element    css=div.removed_cart_item
    Sleep    ${TIME_OUT}

Vai para o checkout 
    Click Button    id=checkout
    Sleep    ${TIME_OUT}
