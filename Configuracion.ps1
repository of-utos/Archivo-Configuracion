# Cargo la dirección del directorio en donde esta ubicado el script.
$DirConf  = $MyInvocation.MyCommand.Path
$DirConf += "\Configuracion.txt"

# Compruebo que exista el archivo de configuración.
if(-not($DirConf) -or (Test-Path $DirConf -PathType Leaf) -eq $False ) {
    exit -50
}

#Cargo la configuración en un hash llamado h.
Get-Content $DirConf | foreach-object -begin {$h=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $h.Add($k[0], $k[1]) } }