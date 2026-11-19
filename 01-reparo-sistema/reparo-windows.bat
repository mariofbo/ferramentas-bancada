@echo off
echo Iniciando reparo de imagem e arquivos do sistema...
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
ipconfig /flushdns
echo Processo concluido!
pause
