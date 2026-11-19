@echo off
REM ============================================================================
REM SCRIPT: Limpeza de Arquivos Temporarios e Reset Completo de Rede
REM USO: Executar como Administrador (Requer reinicializacao ao final)
REM ============================================================================

echo [1/4] Limpando arquivos temporarios do usuario e do Windows...
REM Remove lixos temporarios sem pedir confirmacao (/q) e forcando leitura (/f)
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1

echo [2/4] Limpando cache de DNS...
ipconfig /flushdns

echo [3/4] Redefinindo catalogo Winsock...
REM Corrige falhas de comunicacao de rede causadas por softwares ou VPNs
netsh winsock reset

echo [4/4] Resetando configuracoes TCP/IP...
REM Restaura a pilha de rede IPv4 e IPv6 para o padrao original
netsh int ip reset

echo Limpeza concluida! Reinicie o computador para aplicar o reset de rede.
pause
