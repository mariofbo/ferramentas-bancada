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

---

## 📁 03-diagnostico-hardware (`diagnostico-completo.bat`)
**Quando usar:** Na chegada ao cliente para levantar especificações técnicas da máquina, verificar saúde de bateria de notebook, saúde S.M.A.R.T. dos discos ou status de ativação do Windows.

* `slmgr.vbs /xpr`: Verifica e exibe se a licença do Windows instalada é permanente ou possui data de expiração.
* `Get-CimInstance` / `Get-PhysicalDisk` (PowerShell): Consulta modelo da placa-mãe, versão do BIOS, capacidade/frequência das memórias RAM e o status de saúde dos HDs e SSDs.
* `powercfg /batteryreport`: Gera um relatório HTML na Área de Trabalho comparando a capacidade original de fábrica da bateria com a capacidade atual de carga (em notebooks).

---

## 📁 04-reparo-avancado (`reparo-disco-e-loja.bat`)
**Quando usar:** Falhas na abertura da Microsoft Store ou aplicativos nativos (Calculadora, Fotos, Menu Iniciar) e suspeita de erros lógicos ou setores defeituosos no disco rígido/SSD.

* `Get-AppxPackage ... Add-AppxPackage` (PowerShell): Reinstala e registra novamente a Microsoft Store e os pacotes de aplicativos nativos do Windows para todos os usuários.
* `chkdsk C: /f /r /x`: Verifica a integridade do sistema de arquivos, localiza setores defeituosos e agenda o reparo físico/lógico da unidade `C:` para a próxima reinicialização (digite `S` para confirmar o agendamento).

---

## 📁 05-upgrade-win11 (`liberar-upgrade-win11.bat`)
**Quando usar:** Antes de realizar atualização (In-Place Upgrade) para o Windows 11 em computadores com processadores antigos ou sem chip TPM 2.0, mantendo arquivos e programas.

* `reg add "HKLM\SYSTEM\Setup\MoSetup" ...`: Insere a chave `AllowUpgradesWithUnsupportedTPMOrCPU = 1` no Registro do Windows para ignorar o bloqueio de compatibilidade de CPU e TPM durante a instalação.
