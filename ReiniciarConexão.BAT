@ECHO OFF

:start
cls

SET IPE=10.10
ipconfig /release
ipconfig /flushdns
ipconfig /renew
goto RES

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

:three
choice /m "Deseja SAIR?"
IF ERRORLEVEL 2 goto start
IF ERRORLEVEL 1 goto end
