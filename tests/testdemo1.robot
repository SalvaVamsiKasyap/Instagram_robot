*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
#Test Teardown   Close Browser
*** Variables ***
${errorMessageLocator}=     xpath://p[@id='slfErrorAlert']

*** Test Cases ***
#Validate UnSuccessful login
 #   open the browser with mortgage payment url
 #   Fill the login form
 #   wait untill it checks and display error message
 #   verify error message is correct

*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome
    Go To   https://www.instagram.com/accounts/login/
Fill the login form
    Wait Until Element Is Enabled   xpath://input[@name='username']
    Input Text      xpath://input[@name='username']     vamsi
    Input Password  xpath://input[@aria-label='Password']     Vamsi@123
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

