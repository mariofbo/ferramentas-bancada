@echo off
echo Limpando arquivos temporarios do usuario e do Windows...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
echo Resetando configuracoes de rede e cache DNS...
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
echo Limpeza concluida! Reinicie o computador para aplicar o reset de rede.
pause
