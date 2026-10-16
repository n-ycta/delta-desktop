$ErrorActionPreference = 'Stop'
$Version = '0.1.1'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Windows x64 required' }
$Base = "https://github.com/n-ycta/delta-desktop/releases/download/v$Version"
$Temp = Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $Temp | Out-Null
try {
  $Exe = Join-Path $Temp 'Delta-Desktop-windows-x86_64.exe'
  Invoke-WebRequest "$Base/Delta-Desktop-windows-x86_64.exe" -OutFile $Exe
  $ChecksPath = Join-Path $Temp 'SHA256SUMS'
  Invoke-WebRequest "$Base/SHA256SUMS" -OutFile $ChecksPath
  $Checks = Get-Content $ChecksPath -Raw -Encoding UTF8
  $Line = ($Checks -split "`n" | Where-Object { $_ -match '  Delta-Desktop-windows-x86_64.exe\s*$' })
  if (-not $Line -or ($Line.Trim() -split '\s+')[0] -ne (Get-FileHash $Exe -Algorithm SHA256).Hash.ToLowerInvariant()) { throw 'Checksum mismatch' }
  Write-Warning 'This release is not Authenticode-signed. Windows may show SmartScreen. Verify the source and checksum before proceeding.'
  $Process = Start-Process -FilePath $Exe -Wait -PassThru
  if ($Process.ExitCode -ne 0) { throw "Installer exit code: $($Process.ExitCode)" }
} finally { Remove-Item $Temp -Recurse -Force }
