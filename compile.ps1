param(
    [string]$Main = "main"
)

$ErrorActionPreference = "Stop"

latexmk -xelatex -interaction=nonstopmode -halt-on-error "$Main.tex"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

latexmk -c "$Main.tex"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# Enforce no intermediate artifacts after build.
Get-ChildItem -File -Path . |
Where-Object {
    $_.Name -match '\.(aux|bbl|bcf|blg|log|out|toc|fls|fdb_latexmk|synctex\.gz|xdv|run\.xml)$'
} |
Remove-Item -Force
