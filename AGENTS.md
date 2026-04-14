# Repository Guidelines

## Project Structure & Module Organization
- `main.tex` is the thesis entry point.
- `sections/` contains editable chapter-level content (`abstract.tex`, `manual.tex`, etc.).
- `NKThesis.sty`, `nkthesis.bbx`, `nkthesis.cbx`, and `nkthesis.bib` define template and bibliography behavior.
- `fonts/` and `figures/` store required assets referenced by the template/content.
- Build helpers:
  - `compile.ps1` (Windows)
  - `compile.sh` (macOS/Linux)
- Output artifact: `main.pdf` at repository root.

## Environment Requirements
- Required toolchain:
  - TeX distribution with `xelatex`, `biber`, `latexmk` (TeX Live/MacTeX).
- Windows:
  - PowerShell 5+ and `compile.ps1` workflow.
- macOS/Linux:
  - `bash`, `mktemp`, `rsync`, and `compile.sh` workflow.
- Verify availability before editing:
  - `xelatex --version`
  - `biber --version`
  - `latexmk -v`

## Build, Test, and Development Commands
- Windows (recommended):
  - `powershell -NoProfile -ExecutionPolicy Bypass -File .\compile.ps1 -Main main`
  - Runs isolated build and copies back only `main.pdf`.
- macOS/Linux (theoretical compatibility):
  - `bash ./compile.sh main`
- Manual fallback:
  1. `xelatex main`
  2. `biber main`
  3. `xelatex main`
  4. `xelatex main`
- Keep the root clean; intermediate files should not remain after scripted builds.

## Coding Style & Naming Conventions
- Keep source files UTF-8 and preserve existing LaTeX/template conventions.
- Prefer minimal, targeted edits; avoid subjective formatting rewrites of teacher-provided structure.
- New section files should use lowercase names in `sections/` and be included from `main.tex`.
- Do not modify style files (`NKThesis.sty`, `.bbx`, `.cbx`) unless required by a reproducible build issue.

## Testing Guidelines
- There is no automated test framework in this repository.
- Validation is build-based:
  - Run `compile.ps1` or `compile.sh`.
  - Confirm `main.pdf` updates successfully and no fatal LaTeX/Biber errors occur.
- For appendix-related changes, verify that `main.tex` include settings match intended default behavior.

## Commit & Pull Request Guidelines
- Follow concise, imperative commit messages (current history style), e.g.:
  - `Fix appendix command usage for NKThesis`
  - `Add macOS/Linux compile script and compatibility notes`
- Keep each commit focused on one logical change.
- PRs should include:
  - What changed and why
  - Build command used for verification
  - Any user-visible impact (PDF structure, appendix behavior, bibliography output).
