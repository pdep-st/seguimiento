# Instalación GHCI en windows 10

* Abrir power shell en modo administrador

* Instalar Chocolatey (https://chocolatey.org/install)
`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

* Probar que funciona chocolatey: comando `choco`

* Instalar ghci (https://www.haskell.org/platform/): En power shell como administrador
`choco install haskell-dev`
`refreshenv`

* Cerrar power shell

* Abrir nuevamente sin modo administrador y verificar que esta ghci con el comando `ghci`

