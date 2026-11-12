# My Notes - tiny local server, only needed to install (or update) the app.
# It serves this folder at http://localhost:47123 to this computer only.
param([int]$Seconds = 0)
$port = 47123
$root = (Resolve-Path (Split-Path -Parent $MyInvocation.MyCommand.Path)).Path
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
try { $listener.Start() } catch {
  Write-Host ""
  Write-Host "  Another My Notes installer window is still open." -ForegroundColor Yellow
  Write-Host "  Close that black window, then run this again."
  Write-Host ""
  Read-Host "  Press Enter to close" | Out-Null
  exit
}
$url = "http://localhost:$port/"
Write-Host ""
Write-Host "  My Notes is running at $url" -ForegroundColor Green
Write-Host "  First time on this PC: click the Install icon at the right end of Chrome's address bar."
if ($Seconds -gt 0) { Write-Host "  This window closes by itself in $Seconds seconds (or close it now if the app is up to date)." }
else { Write-Host "  After installing, you can close this window. The app works without it." }
Write-Host ""
try { Start-Process "chrome.exe" $url -ErrorAction Stop } catch { Start-Process $url }
$deadline = $null
if ($Seconds -gt 0) { $deadline = (Get-Date).AddSeconds($Seconds) }
$types = @{ '.html'='text/html; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.webmanifest'='application/manifest+json'; '.png'='image/png' }
while ($listener.IsListening) {
  $task = $listener.GetContextAsync()
  while (-not $task.AsyncWaitHandle.WaitOne(500)) {
    if ($deadline -and (Get-Date) -gt $deadline) { $listener.Stop(); exit }
  }
  $ctx = $task.Result
  try {
    $rel = [System.Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if ($rel -eq '') { $rel = 'index.html' }
    $file = [System.IO.Path]::GetFullPath((Join-Path $root $rel))
    if ($file.StartsWith($root) -and (Test-Path -LiteralPath $file -PathType Leaf)) {
      $bytes = [System.IO.File]::ReadAllBytes($file)
      $type = $types[[System.IO.Path]::GetExtension($file).ToLower()]
      if (-not $type) { $type = 'application/octet-stream' }
      $ctx.Response.ContentType = $type
      $ctx.Response.Headers.Add('Cache-Control', 'no-cache')
      $ctx.Response.ContentLength64 = $bytes.Length
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else { $ctx.Response.StatusCode = 404 }
  } catch { $ctx.Response.StatusCode = 500 }
  $ctx.Response.Close()
}
