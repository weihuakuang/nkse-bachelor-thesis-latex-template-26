param(
    [string]$Main = "main"
)

$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$tempRoot = [System.IO.Path]::GetTempPath()
$tempBuild = Join-Path $tempRoot ("nkthesis-build-" + [guid]::NewGuid().ToString("N"))

function Remove-LocalArtifacts {
    param([string]$Base)
    $patterns = @(
        "*.aux", "*.bbl", "*.bcf", "*.bcf-SAVE-ERROR", "*.blg", "*.fdb_latexmk",
        "*.fls", "*.log", "*.out", "*.run.xml", "*.toc", "*.xdv", "*.synctex.gz"
    )
    foreach ($p in $patterns) {
        Get-ChildItem -Path $Base -File -Filter $p -ErrorAction SilentlyContinue |
            Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

try {
    New-Item -ItemType Directory -Path $tempBuild | Out-Null

    # Copy sources into an isolated temp workspace so local tree never gets build artifacts.
    robocopy $root $tempBuild /E /NFL /NDL /NJH /NJS /NP /XD .git .tmp-build .tmp-build-test | Out-Null
    if ($LASTEXITCODE -ge 8) {
        throw "robocopy failed with exit code $LASTEXITCODE"
    }

    Push-Location $tempBuild
    latexmk -xelatex -interaction=nonstopmode -halt-on-error "$Main.tex"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Pop-Location

    $pdfInTemp = Join-Path $tempBuild "$Main.pdf"
    if (!(Test-Path $pdfInTemp)) {
        throw "Build succeeded but $pdfInTemp was not found."
    }

    Remove-LocalArtifacts -Base $root
    Copy-Item -Force $pdfInTemp (Join-Path $root "$Main.pdf")
    Remove-LocalArtifacts -Base $root
}
finally {
    if ((Get-Location).Path -ne $root) {
        Pop-Location
    }
    if (Test-Path $tempBuild) {
        Remove-Item -Recurse -Force $tempBuild
    }
}
