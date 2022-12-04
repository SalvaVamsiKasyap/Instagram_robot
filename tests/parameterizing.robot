*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Library    Collections
#Test Setup      open the browser with mortgage payment url
Test Teardown   close browser session
Resource        resource.robot
Test Template       Validate UnSuccessful login
*** Variables ***
${errorMessageLocator}=     xpath://p[@id='slfErrorAlert']
${message_Icon_Locator}=    css:._ab6-
${input_Search_Locator}=    xpath://input[@class="_aauy"]
${desired_profile_name}=    "vamsi_kasyap"
${actual_profile_name}=     xpath://div[text()=${desired_profile_name}]
${recipient_Name}=          "vamsikasyapsalva"
${send_message_locator}=    xpath://div/textarea
${actual_message}=  sir
${card_title}=      Search
${profile_name}=    vamsi_kasyap
*** Test Cases ***      username    password
Invalid password        vamsi       kasyap
specialcharacter        @dff        learning

*** Keywords ***
Validate UnSuccessful login
    [Arguments]     ${username}     ${password}
    open the browser with mortgage payment url
    Fill the login form     ${username}     ${password}
    wait untill it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome
    Go To   https://www.instagram.com/accounts/login/
Fill the login form
    [arguments]     ${user_name}    ${password}
    Wait Until Element Is Enabled   xpath://input[@name='username']
    Input Text      xpath://input[@name='username']     ${user_name}
    Input Password  xpath://input[@aria-label='Password']     ${password}
    Click Button    xpath://button[@type='submit']
wait untill it checks and display error message
    Wait Until Element Is Enabled   ${errorMessageLocator}
verify error message is correct
    #${actualAlert}=  Get Text    ${errorMessageLocator}
    #Log To Console  ${actualAlert}
    #Should Be Equal As Strings   ${actualAlert}  Incorrect username/password.
    #Page Should Contain Element    //form[@id='login-form']/div[1]/strong[text()='Empty']
    #Element Should Be Visible      //form[@id='login-form']/div[1]/strong[text()='Incorrect']
    #Page Should Contain     Sorry, your password was incorrect. Please double-check your password.
    #${val}= Get Text        //form[@id='login-form']/div[1]/strong
    #Should Be Equal As Strings  ${val}  Incorrect
    Element Text Should Be      ${errorMessageLocator}      Sorry, your password was incorrect. Please double-check your password.
