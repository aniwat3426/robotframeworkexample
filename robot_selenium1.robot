***Settings ***
Library  SeleniumLibrary
Suite Setup  Open Web Quick Name Generator
Suite Teardown  Close Web Quick Name Generator

***Test Cases ***
Generate a Random List of Name Quickly Happy Case
    [Documentation]   Generate a Random List of Name Quickly Happy case
    [Template]  Geneate names and gender Happy case
    1   female
    10  female
    1   male
    10  male
    1   both
    10  both
    1   unisex
    10  unisex

Generate a Random List of Name Quickly Negative Case
    [Documentation]   Generate a Random List of Name Quickly Negative case
    [Template]  Geneate names and gender Negative case   
    0  female
    ${EMPTY}   female
    ${SPACE}   female
    ABC  female
    \$%^  female
    กขค   female

*** Keywords ***
Geneate names and gender Happy case
    [Arguments]  ${total_name}  ${gender}
    Wait Until Element Is Enabled    name:count  5
    Input Text  name:count  ${total_name} 
    Select From List By Label  css:#gender  ${gender}
    Click Element  xpath://*[@id="main"]/div/form/h2[1]
    Sleep  1
    Press Keys    NONE   ARROW_DOWN  
    Press Keys    NONE   ARROW_DOWN
    Press Keys    NONE   ARROW_DOWN
    Sleep  1
    Wait Until Element Is Enabled    css:.create_form_submit  5
    Click Element  css:.create_form_submit
    Sleep  1
    Wait Until Element Is Enabled    name:count  5
    ${count}=  Get Element Count  css:.name_heading
    Should Be True  ${count} == ${total_name}
    
Geneate names and gender Negative case
    [Arguments]  ${total_name}  ${gender}
    Log To Console  ${total_name} ${gender}
    Wait Until Element Is Enabled    name:count  5
    Input Text  name:count  ${total_name} 
    Select From List By Label  name:gender  ${gender}
    Click Element  xpath://*[@id="main"]/div/form/h2[1]
    Sleep  1
    Press Keys    NONE   ARROW_DOWN  
    Press Keys    NONE   ARROW_DOWN
    Press Keys    NONE   ARROW_DOWN
    Sleep  1
    Wait Until Element Is Enabled    css:.create_form_submit  5
    Click Element  css:.create_form_submit
    Sleep  1
    Wait Until Element Is Enabled    css:.message  5
    ${error_message}=  Get Text  css:.message  
    Should Be True  ${error_message} == Count cannot be less than 1
    
Open Web Quick Name Generator
    Open Browser    https://www.name-generator.org.uk/quick/1    edge  

Close Web Quick Name Generator
    Close Browser
   