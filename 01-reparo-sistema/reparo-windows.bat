@echo off
REM ============================================================================
REM SCRIPT: Reparo de Integridade do Sistema e Cache DNS
REM USO: Clicar com o botao direito e selecionar "Executar como administrador"
REM ============================================================================

echo [1/3] Reparando a imagem base do Windows (DISM)...
REM Baixa e substitui arquivos corrompidos na imagem de recuperacao do Windows
DISM /Online /Cleanup-Image /RestoreHealth

echo [2/3] Verificando e restaurando arquivos protegidos do sistema (SFC)...
REM Escaneia todos os arquivos do sistema e corrige corrupcoes locais
sfc /scannow

echo [3/3] Limpando cache de DNS...
REM Remove registros DNS antigos ou corrompidos da memoria
ipconfig /flushdns

echo Processo concluido com sucesso!
pause
