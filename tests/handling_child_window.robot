*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup      open the browser with mortgage payment url
#Test Teardown   close browser session
Resource        resource.robot
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
*** Test Cases ***
#Validate UnSuccessful login
#    Fill the login form     ${invalid_user_name}    ${password}
#    wait untill it checks and display error message     ${errorMessageLocator}
#    verify error message is correct     ${errorMessageLocator}

# for the presence of Message option
#    Fill the login form     ${valid_user_name}    ${password}
#    wait untill element is located in the page    ${message_Icon_Locator}
#   select options on home page
    #send message to the recipient       ${recipient_Name}       ${send_message_locator}     ${actual_message}      ${actual_profile_name}
    #verification of the message sent

validate child window functionality
   Select the link of child window
   verify The User Name is Switched to Child Window
   Grab the Email ID in the child window
   Switch to parent window and enter the mail

*** Keywords ***
Select the link of child window
    click element   css:.blinkingText
    Sleep           5

verify The User Name is Switched to Child Window
    Switch Window   NEW
    Element Text Should Be  xpath://h1      DOCUMENTS REQUEST

Grab the Email ID in the child window

    ${text}=    get text    xpath://p[@class="im-para red"]/strong
    Log     ${text}
    Set Global Variable     ${text}

Switch to parent window and enter the mail
    Switch Window   MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text      id:username     ${text}