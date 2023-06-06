# Arreglo con nombre de equipos.
$computadoras = "Nombre_de_equipo",	"Nombre_de_equipo",	"Nombre_de_equipo"

do {
    $equipo = Read-Host "Ingrese nombre de computadora"
    # Verificar si el equipo se encuentra en el arreglo
    if ($computadoras -contains $equipo) {
        # Verificar si el equipo está encendido
        if ((Test-Connection $equipo -Count 1 -Quiet) -eq $true) {
            $password = ConvertTo-SecureString 'Contraseña' -AsPlainText -Force
            $credencial = New-Object System.Management.Automation.PSCredential ('DOMINIO\Usuario', $password) 
            Enter-PSSession  -ComputerName $equipo -Credential $credencial
            break 
        }
        else {
            Write-Host "El equipo $equipo se encuentra apagado o fuera de la red" -ForegroundColor Red
        }
    }
    elseif ($equipo -ne "") {
        Write-Host "Error al ingresar computadora" -ForegroundColor Red
    }
} while ($equipo -ne "") 