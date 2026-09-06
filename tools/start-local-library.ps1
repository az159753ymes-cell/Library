$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$nodePath = 'C:\Users\az159\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe'
$serverScript = Join-Path $PSScriptRoot 'local-preview-server.js'
$chromePath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$siteUrl = 'http://localhost:4173/'

try {
  Invoke-WebRequest -UseBasicParsing $siteUrl -TimeoutSec 1 | Out-Null
} catch {
  Start-Process -FilePath $nodePath -ArgumentList @($serverScript, '4173') -WorkingDirectory $projectRoot -WindowStyle Hidden
  Start-Sleep -Milliseconds 700
}

Start-Process -FilePath $chromePath -ArgumentList $siteUrl
