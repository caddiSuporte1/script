@echo off

:: Adiciona a chave de registro do AVP21.19
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AVP21.19" /v "Start" /t REG_DWORD /d 4 /f

:: Remove a opção safeboot da configuração do BCD
bcdedit /deletevalue {current} safeboot

:: Reinicia o sistema imediatamente
shutdown /r /t 0

:: Aguarda 1 segundo para garantir que o sistema tenha tempo para processar o comando de reinício
timeout /t 1 /nobreak > nul

:: Exclui o próprio script do diretório
del "%~f0"