*** Settings ***
Documentation   A resource file with reusuable keywords and variables
...
...             The system specific keyword created here form our domain specific language.
...             The utilize keywords provided by imported selenium library.
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${invalid_user_name}    vamsi
${valid_user_name}      vamsi_kasyap
${password}             Build@123
${URL}                  https://www.instagram.com/direct/inbox/?next=%2F
#${URL}                   https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome
    Go To   ${URL}
    Maximize Browser Window

close browser session
    Close Browser
