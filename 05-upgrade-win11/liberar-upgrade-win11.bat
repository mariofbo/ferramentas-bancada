@echo off
REM ============================================================================
REM SCRIPT: Liberar Upgrade Windows 11 em Hardware Nao Homologado (Bypass TPM/CPU)
REM USO: Executar como Administrador antes de rodar o instalador da ISO
REM ============================================================================

echo Aplicando chave de registro MoSetup (AllowUpgradesWithUnsupportedTPMOrCPU)...
reg add "HKLM\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1 /f

echo.
echo Chave aplicada com sucesso!
echo Proximo passo: Monte a ISO do Windows 11 e execute no CMD Admin:
echo X:\sources\setupprep.exe /product server
echo.
pause
