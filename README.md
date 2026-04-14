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

## 附录状态

- 当前默认：附录已在 `main.tex` 中注释关闭，不参与编译。
- 如需开启附录：
  1. 取消注释 `\includeonly` 中的 `sections/appendices`
  2. 取消注释正文中的 `\include{sections/appendices}`
- 附录文件应使用模板定义的调用方式：` \appendix{...} `（当前 `sections/appendices.tex` 为 `\appendix{}`）。

## 环境要求

- TeX Live（已验证可用）。
- 可执行命令：`latexmk`、`xelatex`、`biber`。
- Windows 下推荐 PowerShell 执行。

## 当前环境记录（2026-04-14）

- 操作系统：`Microsoft Windows NT 10.0.22631.0`
- TeX 发行版：`TeX Live 2026`
- `xelatex`：`XeTeX 3.141592653-2.6-0.999998 (TeX Live 2026)`
- `biber`：`2.21`
- `latexmk`：`4.88`

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

### 错误现象

- 按 `xelatex -> biber -> xelatex` 编译时，在附录位置报错：
  - `Runaway argument`
  - `Paragraph ended before \HyPsd@@ProtectSpacesFi was complete`
- 随后 `biber` 报 `main.bcf is malformed`（上一轮 `xelatex` 失败导致的连锁错误，不是 `biber` 本身故障）。

### 触发方式（错误写法）

- 在 `sections/appendices.tex` 中把附录写成了“`appendix + chapter`”组合（例如 `\appendix` 后再写 `\chapter[...]` 或 `\\chapter[...]`）。
- 这会与模板内部章节定义和 `hyperref` 书签生成冲突，触发上面的致命错误。

### 根因（真实原因）

- `NKThesis.sty` 已重定义 `\appendix`，其内部会调用 `\chapter`。
- 因此该模板中附录应直接使用 `\appendix{...}`，不应再额外手写 `\chapter`。

### 修复方案

- 把附录写法修正为模板兼容形式：`sections/appendices.tex` 使用 `\appendix{}`。
- 在 `main.tex` 默认注释附录入口（`includeonly` 和正文 `\include` 同步注释），避免默认构建包含附录。

### 结果

- `xelatex + biber` 编译链路恢复正常。
- 仍可能有非致命警告（字体替代、over/underfull、部分 `hyperref` 提示），不影响 `main.pdf` 生成。

## 相对原项目的改进

- 编译流程改造：
  - 新增 `compile.ps1`，在系统临时目录隔离编译，仅回传 `main.pdf`，项目根目录不保留中间文件。
- 目录结构改造：
  - 将除 `main.tex` 外的可写章节集中到 `sections/`，提高可维护性。
- 构建稳定性改造：
  - 修复附录章节写法与模板定义不一致导致的致命编译错误。
  - 默认关闭附录入口，按需开启，减少日常构建风险。
- 工程文档改造：
  - 合并并规范化 README，补充环境记录、编译方式、问题诊断和使用说明。
  - 删除非编译必需的 `docs/` 文档站目录，保持仓库聚焦论文编译与写作。

## 参考来源声明

- 历史来源模板仓库：<https://github.com/Tr0py/NKU-thesis-template-2020>
- Overleaf 模板页：<https://www.overleaf.com/latex/templates/nan-kai-da-xue-ben-ke-sheng-bi-ye-lun-wen-mo-ban-v1-dot-4/hdfqhtmmmdpv>

## 许可证

本仓库采用 [MIT License](LICENSE)。
