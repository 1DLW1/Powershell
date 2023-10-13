# Nombre del script a cerrar
$proc = "explorer.exe"  # Cambia esto al nombre de tu script

# Buscar procesos que ejecutan el script
$procesos = Get-Process | Where-Object { $_.MainModule.FileName -like "*\$proc" }

# Verificar si se encontraron procesos
if ($procesos.Count -gt 0) {
    # Detener los procesos encontrados
    $procesos | ForEach-Object { Stop-Process -Id $_.Id -Force }
    Write-Host "Se cerraron correctamente los procesos que ejecutaban $proc"
} else {
    Write-Host "No se encontraron procesos que ejecutaran $proc"
}
