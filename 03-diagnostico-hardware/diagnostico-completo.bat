@echo off
REM ============================================================================
REM SCRIPT: Diagnostico Rapido de Hardware, Bateria e Licenca
REM USO: Executar como Administrador
REM ============================================================================

echo [1/4] Verificando status de ativacao do Windows...
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo.
echo [2/4] Consultando Placa-Mae, BIOS, Memoria RAM e Saude dos Discos...
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product; Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion, ReleaseDate; Get-CimInstance Win32_PhysicalMemory | Format-Table Capacity, Speed, Manufacturer, PartNumber -AutoSize; Get-PhysicalDisk | Select-Object DeviceId, FriendlyName, MediaType, HealthStatus, OperationalStatus"

echo [3/4] Gerando relatorio de saude da bateria na Area de Trabalho...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\relatorio-bateria.html" >nul 2>&1
if exist "%USERPROFILE%\Desktop\relatorio-bateria.html" (
    echo Relatorio salvo em: %USERPROFILE%\Desktop\relatorio-bateria.html
) else (
    echo Bateria nao detectada (Computador Desktop).
)

echo.
echo Diagnostico concluido!
pause
