*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Keywords ***
Channge to AUD/JPY
    Click Element    //*[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter"]    30 
    Wait Until Element Is Visible    //*[@class="sc-mcd__filter"]    30  
    Click Element    //*[@class="ic-icon ic-forex"]
    Wait Until Page Contains Element    //*[@class="sc-mcd__content"]    30
    Wait Until Element Is Visible    //div[@class="sc-mcd__content"]    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]

Change contract type
    Click Element    //*[@class='contract-type-widget__display']
    Click Element    dt_contract_high_low_item

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    30
    Wait Until Page Contains Element    dt_login_button   60
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    
    Input Text    //input[@type='password']   
    Click Element    //button[@type='submit']

    #Change to virtual account 
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    20    #loading account
    Wait Until Page Contains Element    //*[@class='sidebar__items']    20    #loading contract sidebar
    Wait Until Page Contains Element    dt_core_account-info_acc-info    40    #loading account info
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--usd"]    30
    Wait Until Element Is Visible    //*[@class="dc-btn dc-btn__effect dc-btn--primary acc-info__button"]    30
    Click Element    dt_core_account-info_acc-info
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    //*[@class="acc-switcher__id"]
    Wait Until Page Does Not Contain    //*[@aria-label="Loading interface..."]    10
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--virtual"]    10

    #Choose AUD/USD
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    30    #loading account
    Wait Until Page Contains Element    //*[@class='sidebar__items']    30    #loading contract sidebar
    Channge to AUD/JPY
    

    #Buy Contract 
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    Change contract type
    Wait Until Page Contains Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active"]
    Click Element    //*[@class='dc-input__field']
    Press Keys    none    BACKSPACE+4
    Wait Until Page Contains Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active"]
    Press Keys    //div[@class='dc-input-field trade-container__barriers-single']    CTRL+A+BACKSPACE
    Input Text    dt_barrier_1_input    -0.11111
    Sleep    2
    Click Element    //button[@id='dt_purchase_put_button']