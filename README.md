# ferramentas-bancada

Scripts de manutenção, reparo e limpeza para suporte técnico em Windows.

> **Nota:** Sempre execute os arquivos `.bat` clicando com o botão direito e selecionando **Executar como administrador**.

---

## 📁 01-reparo-sistema (`reparo-windows.bat`)
**Quando usar:** Tela azul esporádica, travamentos após atualização, Menu Iniciar/barra de tarefas não respondendo ou erros no Windows Update.

* `DISM /Online /Cleanup-Image /RestoreHealth`: Conecta aos servidores da Microsoft e repara a imagem base do Windows caso os arquivos originais de recuperação estejam corrompidos.
* `sfc /scannow`: Verifica a integridade de todos os arquivos protegidos do sistema e substitui arquivos corrompidos ou ausentes por cópias saudáveis em cache.
* `ipconfig /flushdns`: Limpa o cache de resolução de nomes (DNS) armazenado localmente, corrigindo falhas de carregamento de sites ou redirecionamentos antigos.

---

## 📁 02-limpeza-e-rede (`limpeza-e-reset-rede.bat`)
**Quando usar:** Computador lento por acúmulo de arquivos inúteis, pouco espaço em disco ou internet conectada mas sem navegar/instável.

* `del /q /f /s %TEMP%\*`: Apaga silenciosamente todos os arquivos e pastas temporários do perfil do usuário atual.
* `del /q /f /s C:\Windows\Temp\*`: Apaga arquivos temporários gerados pelo próprio sistema operacional e instaladores.
* `ipconfig /flushdns`: Esvazia o cache local de DNS para forçar uma nova consulta aos servidores da operadora/roteador.
* `netsh winsock reset`: Redefine o catálogo Winsock do Windows para o estado padrão de fábrica, corrigindo conflitos causados por VPNs, proxies ou malwares removidos.
* `netsh int ip reset`: Reinicia os protocolos TCP/IP da placa de rede, resolvendo falhas de obtenção de IP ou conexão limitada.
