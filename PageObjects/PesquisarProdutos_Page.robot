*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${InputPesquisa}        id=search_query_top
${BtnPesquisar}         name=submit_search
${BtnAddToCart}         xpath=//span[contains(text(),'Add to cart')]
${BtnMore}              xpath=//span[contains(text(),'More')]
${MsgAlerta}            css=#center_column > p