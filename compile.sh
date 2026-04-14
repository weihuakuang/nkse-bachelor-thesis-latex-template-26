#!/usr/bin/env bash
set -euo pipefail

MAIN="${1:-main}"
ROOT="$(pwd)"
TEMP_BUILD="$(mktemp -d "${TMPDIR:-/tmp}/nkthesis-build-XXXXXX")"

cleanup() {
  rm -rf "$TEMP_BUILD"
}
trap cleanup EXIT

remove_local_artifacts() {
  find "$1" -maxdepth 1 -type f \
    \( -name '*.aux' -o -name '*.bbl' -o -name '*.bcf' -o -name '*.bcf-SAVE-ERROR' \
       -o -name '*.blg' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' \
       -o -name '*.out' -o -name '*.run.xml' -o -name '*.toc' -o -name '*.xdv' \
       -o -name '*.synctex.gz' \) -delete
}

# Copy project into an isolated temp workspace to avoid local build artifacts.
rsync -a --exclude '.git' --exclude '.tmp-build' --exclude '.tmp-build-test' "$ROOT/" "$TEMP_BUILD/"

pushd "$TEMP_BUILD" >/dev/null
latexmk -xelatex -interaction=nonstopmode -halt-on-error "$MAIN.tex"
popd >/dev/null

if [[ ! -f "$TEMP_BUILD/$MAIN.pdf" ]]; then
  echo "Build succeeded but $TEMP_BUILD/$MAIN.pdf was not found." >&2
  exit 1
fi

remove_local_artifacts "$ROOT"
cp -f "$TEMP_BUILD/$MAIN.pdf" "$ROOT/$MAIN.pdf"
remove_local_artifacts "$ROOT"
