*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup      open the browser with mortgage payment url
Test Teardown   close browser session
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

Searching the profiles in instagram
    Fill the login form     ${valid_user_name}    ${password}
    select options on home page
    providing the profile name that is needed to be searched        ${profile_name}

*** Keywords ***

Fill the login form
    [arguments]     ${user_name}    ${password}
    Wait Until Element Is Enabled   xpath://input[@name='username']
    Input Text      xpath://input[@name='username']     ${user_name}
    Input Password  xpath://input[@aria-label='Password']     ${password}
    Click Button    xpath://button[@type='submit']
wait untill it checks and display error message
    [arguments]     ${errorMessageLocator}
    Wait Until Element Is Enabled   ${errorMessageLocator}
verify error message is correct
    [arguments]     ${errorMessageLocator}
    #${actualAlert}=  Get Text    ${errorMessageLocator}
    #Log To Console  ${actualAlert}
    #Should Be Equal As Strings   ${actualAlert}  Incorrect username/password.
    #Page Should Contain Element    //form[@id='login-form']/div[1]/strong[text()='Empty']
    #Element Should Be Visible      //form[@id='login-form']/div[1]/strong[text()='Incorrect']
    #Page Should Contain     Sorry, your password was incorrect. Please double-check your password.
    #${val}= Get Text        //form[@id='login-form']/div[1]/strong
    #Should Be Equal As Strings  ${val}  Incorrect
    Element Text Should Be      ${errorMessageLocator}      Sorry, your password was incorrect. Please double-check your password.

wait untill element is located in the page
    [arguments]     ${Element}
    Wait Until Element Is Visible   ${Element}      10

select options on home page
    Wait Until Page Contains Element    //div[@class='x1n2onr6']    15
    ${available_options}=   GetWebElements      //div[@class='x6s0dn4 x9f619 xxk0z11 x6ikm8r xeq5yr9 x1s85apg x1swvt13 xzzcqpx']/div
    ${list_len}=    Get Length      ${available_options}
    Log       ${list_len}
    ${index}=    Set Variable   0
    FOR     ${li_le}    IN  @{available_options}
            Log     ${li_le.text}
            Exit For Loop If    '${li_le.text}' == '${card_title}'
            ${index}=   Evaluate    ${index} + 1
    END
    Log     ${index}
    ${options}=     GetWebElements      xpath://div[@class='x1n2onr6']/a[@class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz _a6hd"]
    Log     ${options}
    ${mess_age}=    Get From List   ${options}      ${index}
    Click Link      ${mess_age}




send message to the recipient
    [arguments]     ${recipient_Name}       ${send_message_locator}     ${actual_message}       ${actual_profile_name}
    Wait Until Page Contains Element    ${actual_profile_name}      10
    Element Should Be Visible   ${actual_profile_name}
    Wait Until Page Contains Element    //div[@class="_abm4"]/a     15      0.5
    Click Link    //div[@class="_abm4"]/a
    Wait Until Page Contains Element    ${send_message_locator}      10
    Input Text    ${send_message_locator}     ${actual_message}
    Press Keys    ${send_message_locator}     RETURN
    Wait Until Page Contains Element    //div[text()="${actual_message}"]     10      0.5

verification of the message sent
        ${messages}=    Get WebElements     xpath://div[@class='_aacl _aaco _aacu _aacx _aad9 _aadf']
        Log     ${messages}
        @{message_In_Website} =     Create List
        FOR     ${message}   IN      @{messages}
           Log  ${message.text}
           Append To List       ${message_In_Website}       ${message.text}

        END
        Log     ${message_In_Website}
        ${place}=   Get Index From List     ${message_In_Website}       ${actual_message}
        Log     ${place}
        List Should Contain Value       ${message_In_Website}   ${actual_message}
        ${desired_Part}=    Get From List     ${message_In_Website}       -1
        Should Be Equal As Strings        ${desired_Part}      ${actual_message}

providing the profile name that is needed to be searched
    [arguments]     ${profile_name}
    Wait Until Page Contains Element    xpath://input[@class="_aauy"]       50
    Input Text      xpath://input[@class="_aauy"]     ${profile_name}
    Wait Until Page Contains Element    xpath://div[@class='_abm4']         25
    #${profile_names}=   Get WebElements     xpath://div[@class='_ab8w _ab94 _ab97 _ab9f _ab9k _ab9p _abcm']
    ${profile_names}=    Get WebElements     xpath://div[@class='_ab8w _ab94 _ab97 _ab9f _ab9k _ab9p _abcm']
    ${indexing}=    Set Variable   0
    FOR     ${name}    IN      ${profile_names}
        Exit For Loop If   '${name}' == '${profile_name}'

        ${indexing}=    Evaluate    ${indexing} + 1
    END
    Click Element   (//div[@class="_abm4"])[${indexing}]/a
