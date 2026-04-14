# nkse-bachelor-thesis-latex-template-26

2026 南开大学软件学院本科毕业论文 LaTeX 模板。

## 项目结构

- `main.tex`：主文件。
- `sections/`：除主文件外的可写章节内容。
- `NKThesis.sty`：模板样式文件。
- `nkthesis.bib`：参考文献数据库。
- `nkthesis.bbx` / `nkthesis.cbx`：`biblatex` 样式文件（当前配置必需）。
- `fonts/`：模板使用字体文件（当前样式配置必需）。
- `figures/`：示例/正文使用图片资源。
- `compile.ps1`：推荐编译脚本（隔离编译，不在项目根目录保留中间文件）。

## 环境要求

- TeX Live（已验证可用）。
- 可执行命令：`latexmk`、`xelatex`、`biber`。
- Windows 下推荐 PowerShell 执行。

## 当前环境记录（2026-04-14）

- 操作系统：`Microsoft Windows NT 10.0.22631.0`
- PowerShell：`5.1.22621.2506`（Desktop Edition）
- TeX 发行版：`TeX Live 2026`
- `xelatex`：`XeTeX 3.141592653-2.6-0.999998 (TeX Live 2026)`
- `biber`：`2.21`
- `latexmk`：`4.88`
- `git`：`2.47.1.windows.2`
- 工作目录：`C:\Workspace\CodexSpace\writing-test\nk_latex_template`
- 额外说明：当前 `PATH` 中未检测到 `make`（已使用 `compile.ps1` 作为默认编译入口）。

## 推荐编译方式

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\compile.ps1 -Main main
```

该方式特点：

- 使用 `latexmk` 自动调度 `xelatex + biber`。
- 在系统临时目录执行完整编译流程。
- 仅回传 `main.pdf` 到项目根目录。
- 根目录不保留 `aux/bbl/bcf/log/toc` 等中间文件。

## 手动编译方式（兼容）

如需手动固定流程，可执行：

1. `xelatex main`
2. `biber main`
3. `xelatex main`
4. `xelatex main`（可选，用于进一步稳定交叉引用）

## 已处理问题记录（2026-04-14）

### 现象

- 按 `xelatex -> biber -> xelatex` 编译时，附录章节位置出现：
  - `Runaway argument`
  - `Paragraph ended before \HyPsd@@ProtectSpacesFi was complete`
- 随后 `biber` 报 `main.bcf is malformed`（由上一步失败连锁触发）。

### 根因

- 附录章节标题与 `hyperref` 书签处理存在兼容性问题。

### 处理

- 在 `sections/appendices.tex` 使用最小规避写法：
  - `\\chapter[Appendix]{附录}`

### 结果

- `xelatex + biber` 编译链路恢复正常。
- 仍可能有非致命警告（字体替代、over/underfull、部分 `hyperref` 提示），不影响 `main.pdf` 生成。

## 参考来源声明

- 历史来源模板仓库：<https://github.com/Tr0py/NKU-thesis-template-2020>
- Overleaf 模板页：<https://www.overleaf.com/latex/templates/nan-kai-da-xue-ben-ke-sheng-bi-ye-lun-wen-mo-ban-v1-dot-4/hdfqhtmmmdpv>

## 许可证

本仓库采用 [MIT License](LICENSE)。
