@echo off
REM ============================================================================
REM SCRIPT: Reparo da Microsoft Store/Apps Nativos e Agendamento de CHKDSK
REM USO: Executar como Administrador
REM ============================================================================

echo [1/2] Reparando Microsoft Store e aplicativos integrados do Windows...
powershell -NoProfile -Command "Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}"

echo.
echo [2/2] Verificando e agendando reparo de setores do disco C: (CHKDSK)...
REM ATENCAO: Como a unidade C: esta em uso, responda S (Sim) se solicitado para agendar no proximo boot
chkdsk C: /f /r /x

echo.
echo Processo concluido! Reinicie o computador se o CHKDSK foi agendado.
pause
