*** Settings ***
Documentation    Gerenciando a massa de testes através do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect to Postgres
    Connect To Database    psycopg2	
    ...                    ernhrcxj	
    ...                    ernhrcxj		
    ...                    9m9vBibhjRs8VNRmp3KecbSUeQM3rC64	
    ...                    babar.db.elephantsql.com	
    ...                    5432

Select Student Where Email
    [Arguments]    ${email}

    ${query}      Set Variable
    ...           SELECT * FROM public.students WHERE email = '${email}';

    ${results}    Query    ${query}

    [return]      ${results}[0]


Delete Enroll By Email
    [Arguments]    ${email}

    ${user}       Select Student Where Email    ${email}

    ${query}      Set Variable
    ...           DELETE FROM public.enrollments WHERE student_id = '${user}[0]'; 

    Execute Sql String    ${query}

Delete Student By Email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...         DELETE FROM public.students WHERE email ='${email}';

    Execute Sql String    ${query}

Reset Student
    [Arguments]    ${email}
    Connect to Postgres
    Delete Student By Email    ${email}
    Disconnect From Database   