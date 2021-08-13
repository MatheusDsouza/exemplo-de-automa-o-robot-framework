*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Comecar teste web
    Open Browser               about:blank    ${NAVEGADOR}
    Maximize Browser Window

Terminar teste web
    close all browsers