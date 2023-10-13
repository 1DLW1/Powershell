#Name of the proccess 
$proc = "explorer.exe"  

#Search proccess
$procesos = Get-Process | Where-Object { $_.MainModule.FileName -like "*\$proc" }

#Verify the locate proccess
if ($procesos.Count -gt 0) {
    #Stop the locate proccess
    $procesos | ForEach-Object { Stop-Process -Id $_.Id -Force }
    Write-Host "Proccess $proc is terminated"
} else {
    Write-Host "There is no proccess with the name $proc"
}
