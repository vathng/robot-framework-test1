*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${DemoAccountBalance}    //*[@class="acc-info__account-type-and-balance"]
${riseButton}    dt_purchase_call_button





*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    5
    Wait Until Page Contains Element    dt_login_button   60
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    
    Input Text    //input[@type='password']    
    Click Element    //button[@type='submit']
    

    #Task 1 
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    5    #loading account
    Wait Until Page Contains Element    //*[@class='sidebar__items']    20    #loading contract sidebar
    Wait Until Page Contains Element    dt_core_account-info_acc-info    40    #loading account info
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--usd"]    30
    Wait Until Element Is Visible    //*[@class="dc-btn dc-btn__effect dc-btn--primary acc-info__button"]    30
    Click Element    dt_core_account-info_acc-info
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    //*[@class="acc-switcher__id"]
    Wait Until Page Does Not Contain    //*[@aria-label="Loading interface..."]    10
    Wait Until Page Contains Element    //*[@class="dc-icon acc-info__id-icon acc-info__id-icon--virtual"]    10
    

    #Task 2
    Wait Until Page Does Not Contain Element   //*[@aria-label="Loading interface..."]    30    #loading account
    Wait Until Page Contains Element    //*[@class='sidebar__items']    30    #loading contract sidebar
    Click Element    //*[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //*[@class="sc-mcd__content"]    20 
    Wait Until Element Is Visible    //*[@class="sc-mcd__content"]    20  
    Click Element    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
    Wait Until Page Contains Element    //*[@name="contract_type" and contains(text(),'Rise/Fall')]
    Wait Until Page Contains Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active"]
    Wait Until Page Contains Element    //*[@id="dt_range_slider_label" and contains(text(), '5 Ticks')]
    Wait Until Page Contains Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active"]
    Wait Until Page Contains Element    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input" and @value = '10']
   
    ${before}=    Get Text    ${DemoAccountBalance}
    Wait Until Page Contains Element    ${riseButton}    60
    Wait Until Element Is Visible    ${riseButton}    60
    Click Button    ${riseButton}
    Wait Until Page Contains Element    //*[@class="dc-result__caption-wrapper"]    30
    ${after}=    Get Text    ${DemoAccountBalance}
    Should Not Be Equal    ${before}    ${after}
  



    

  

    
    




