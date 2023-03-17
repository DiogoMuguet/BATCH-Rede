@ECHO OFF
:start
cls
ECHO ===============Script NET===============
CHOICE /C 123 /N /M "Escolha uma REDE: 1=ADM 2=ACAD 3=CANCELAR"

if errorlevel 3 goto three 
if errorlevel 2 goto two
if errorlevel 1 goto one
goto end

:one
SET IPE=10.10
goto RES

:two
SET IPE=10.1.1
goto RES

:three
choice /m "Deseja SAIR?"
IF ERRORLEVEL 2 goto start
IF ERRORLEVEL 1 goto end

:RES
ipconfig | find "IPv4" > ip.txt
findstr "%IPE%" ip.txt
if errorlevel 1 (
	ipconfig /release
	ipconfig /flushdns
	ipconfig /renew
	ipconfig /registerdns
	goto RES
) else (
	cls
	echo Tudo certo!
)
goto THREE