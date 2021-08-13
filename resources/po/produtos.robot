*** Settings ***
Library          SeleniumLibrary

*** Keywords ***
Verifica pagina
    Location Should Be                  ${URL_DE_INICIO}inventory.html
    Wait Until Page Contains Element    ${LOGO}

Encontra o produto
    Page Should Contain    ${PRODUTO.nome}
    Element Text Should Be    xpath=//div[@id="inventory_container"]//div[1]/div[2]/div[2]/div  ${PRODUTO.valor} 

Adiciona ao carrinho
    Click Button    id=add-to-cart-sauce-labs-backpack
    

    