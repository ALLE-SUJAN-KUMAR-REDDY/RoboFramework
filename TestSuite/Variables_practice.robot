*** Settings ***
Library    BuiltIn
Library    Collections


*** Variables ***
${NAME}        Sujan
${NUM1}        10
${NUM2}        20
${CITY}        Hyderabad

@{FRUITS}      Apple    Banana    Mango

&{USER}        username=admin    role=tester


*** Test Cases ***
Practice Variables In Robot Framework

    # 1️.Create a scalar variable ${NAME} and print it
    Log    ${NAME}

    # 2️.Assign two numbers to variables and print their sum
    ${SUM}=    Evaluate    ${NUM1} + ${NUM2}
    Log    Sum is ${SUM}

    # 3️.Create a variable ${CITY} and use it inside a sentence
    Log    I live in ${CITY}

    # 4️.Reassign a variable value inside a test case and log the updated value
    ${CITY}=    Set Variable    Bangalore
    Log    Updated city is ${CITY}

    # 5️.Create a list variable @{FRUITS} and print the first item
    Log    First fruit is ${FRUITS}[0]

    # 6️.Loop through a list variable and print each element
    FOR    ${fruit}    IN    @{FRUITS}
        Log    Fruit: ${fruit}
    END

    # 7️.Find the length of a list variable
    ${length}=    Get Length    ${FRUITS}
    Log    Number of fruits is ${length}

    # 8️.Create a dictionary variable &{USER} and print one key value
    Log    Username is ${USER}[username]

    # 9️.Add a new key-value pair to a dictionary variable
    Set To Dictionary    ${USER}    password=admin123
    Log    Password added successfully

    # 10.Access dictionary values inside a loop and print key and value
    FOR    ${key}    ${value}    IN    &{USER}
        Log    ${key} = ${value}
    END
