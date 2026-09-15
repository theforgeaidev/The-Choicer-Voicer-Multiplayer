$ErrorActionPreference = 'Stop'
$sourceGame = Join-Path $env:APPDATA 'YeahMaybe\ChoicerVoicer\game'
$targetGame = Join-Path $env:APPDATA 'YeahMaybe\ChoicerVoicer-MP-Experimental\game'
if (!(Test-Path -LiteralPath $sourceGame)) { throw 'No se encontro la carpeta original de packs.' }
$count = 0
foreach ($packDir in Get-ChildItem -LiteralPath $sourceGame -Directory -Filter 'packs_*') {
    $targetDir = Join-Path $targetGame $packDir.Name
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    foreach ($item in Get-ChildItem -LiteralPath $packDir.FullName -Force) {
        $targetItem = Join-Path $targetDir $item.Name
        if (!(Test-Path -LiteralPath $targetItem)) {
            Copy-Item -LiteralPath $item.FullName -Destination $targetItem -Recurse
            $count++
        }
    }
}
Write-Host "Copiados $count elementos nuevos. Los packs ya existentes en la prueba se conservaron."
Write-Host 'Tus partidas y grabaciones originales no se han modificado.'
