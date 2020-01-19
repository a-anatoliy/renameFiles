 param(
  [Parameter(Mandatory=$True)]
  [string]$directory,
  [Parameter(Mandatory=$True)]
  [string]$name
   )

# .\renameIt.ps1 -directory C:\Users\Anatol\Documents\lucky-Dress\Ehjae\laces\partII
# D:\xampp\htdocs\atelierClients\tmp> .\renameIt.ps1 -directory C:\Users\Anatol\Documents\lucky-Dress\Ehjae\laces\partII

$outDirectory = 'renamed'
# $name = 'appligue'
$initSuffix = 1

if ( -Not (Test-Path -Path $directory ) ) {
  write-host "Working directory: $($directory) not found."
  exit;
}

$out = ("{0}\{1}" -f $directory,$outDirectory)
$Files = Get-ChildItem -Path "$($directory)\*.jpg" | Sort-Object -Property LastWriteTime
write-host "`n     Source directory: $directory" -ForegroundColor Green
write-host "Destination directory: $out`n" -ForegroundColor Green

if ( -Not (Test-Path -Path $out ) ) { New-Item -ItemType directory -Path $out }

foreach ($file in $Files) {
  $newFile = ("{0}\{1}_{2:d3}.jpg" -f $out,$name,$initSuffix)
  Write-Host "   file: $file" -ForegroundColor Yellow
  Write-Host "newFile: $($newFile)" -ForegroundColor Cyan
  $initSuffix++;

  Move-Item -Path $file -Destination $newFile
  # Copy-Item -Path $file -Destination $newFile

}
--$initSuffix;

Write-Host "`r`nDONE [$($initSuffix)] files.`n" -ForegroundColor Magenta
exit;