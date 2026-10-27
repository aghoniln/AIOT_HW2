# Run in PowerShell after extracting the project. Uses your own local Git login.
$ErrorActionPreference = "Stop"
$projectSource = $PSScriptRoot
$checkoutPath = Join-Path ([System.IO.Path]::GetTempPath()) ("HW2_publish_" + [guid]::NewGuid().ToString("N"))
$repoUrl = "https://github.com/aghoniln/AIOT_HW2.git"
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "Please install Git for Windows first." }
git clone $repoUrl $checkoutPath
if ($LASTEXITCODE -ne 0) { throw "Git clone failed." }
Push-Location $checkoutPath
try {
    git switch main
    if ($LASTEXITCODE -ne 0) { throw "Could not create local branch." }
    $destination = $checkoutPath
    # The checkout root is the project directory.
    Get-ChildItem -LiteralPath $projectSource -Force | Where-Object {
        $_.Name -notin @(".git", ".venv", "__pycache__", ".pytest_cache")
    } | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force }
    git add --all
    git commit -m "Add HW2 multiple linear regression analysis and interactive web app"
    if ($LASTEXITCODE -ne 0) { throw "Commit failed. Check git user.name and user.email." }
    git push origin main
    if ($LASTEXITCODE -ne 0) { throw "Push failed. Check your GitHub sign-in and repository write access. Checkout retained at $checkoutPath" }
    Write-Host "Uploaded: https://github.com/aghoniln/AIOT_HW2"
} finally { Pop-Location }
