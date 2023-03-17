@ECHO OFF
:start
cls
ECHO ====================Script ADP====================
CHOICE /C 123 /N /M "Escolha uma tarefa: 1=ATIVAR 2=DESATIVAR 3=CANCELAR"

if errorlevel 3 goto three 
if errorlevel 2 goto two
if errorlevel 1 goto one
goto end

:one
CHOICE /C 123 /N /M "Escolha um adaptador para ATIVAR: 1=ADM 2=ACAD 3=CANCELAR"

if errorlevel 3 goto start
if errorlevel 2 goto atacad
if errorlevel 1 goto atadm
goto end

:two
CHOICE /C 123 /N /M "Escolha um adaptador para DESATIVAR: 1=ADM 2=ACAD 3=CANCELAR"

if errorlevel 3 goto start
if errorlevel 2 goto dtacad
if errorlevel 1 goto dtadm
goto end

:three
choice /m "Deseja SAIR?"
IF ERRORLEVEL 2 goto start
IF ERRORLEVEL 1 goto end

:atacad
wmic path win32_networkadapter where index=2 call enable
goto three

:dtacad
wmic path win32_networkadapter where index=2 call disable
goto three

:atadm
wmic path win32_networkadapter where index=1 call enable
goto three

:dtadm
wmic path win32_networkadapter where index=1 call disable
goto three

rem /pra listar os dispositivos: wmic nic get name, index




