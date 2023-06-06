# Conexión WinRM con Powershell
Se ejecuta una conexión remota mediante el cmdlet Enter-PSSession. Solicita el nombre del equipo al que se necesita acceder y lo compara con un arreglo que previamente contiene los nombres de los equipos de nuestro dominio. A continuación, inicia la conexión y mantiene las credenciales para el ingreso.

Como requisito, ejecuta el siguiente comando como administrador en el equipo al que te conectarás (solo una vez):
Enable-PSRemoting 

*ingresa tu equipo en la lista de hosts remotos confiables del equipo al que se conectara 
Set-Item WSMan:localhost\client\trustedhosts -value "Equipo administrador, ip del equipo administrador"
