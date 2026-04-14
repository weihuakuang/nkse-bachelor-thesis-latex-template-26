# nkse-bachelor-thesis-latex-template-26

2026 Nankai University bachelor thesis LaTeX template (College of Software).

## 项目说明

- 本仓库用于本科毕业论文写作与本地编译。
- 当前内容组织方式：`main.tex` 为主文件，其它可写章节文件位于 `sections/`。
- `docs/` 目录是历史文档站（Jekyll）相关文件，不参与论文 PDF 编译。

## 环境要求

- TeX Live（已在当前项目环境验证）。
- 需要可用命令：`latexmk`、`xelatex`、`biber`。
- Windows 下推荐使用 PowerShell 执行编译脚本。

## 编译方式（推荐）

推荐命令：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\compile.ps1 -Main main
```

说明：

- 使用 `latexmk` 自动调度 `xelatex + biber` 编译链路。
- 在系统临时目录隔离编译，仅回传 `main.pdf` 到项目根目录。
- 根目录不会保留 `aux/bbl/bcf/log/toc` 等中间文件。

## 编译方式（兼容）

如果你希望手动固定流程，可使用：

1. `xelatex main`
2. `biber main`
3. `xelatex main`
4. `xelatex main`（可选，通常用于进一步稳定目录/引用）

## 已记录的编译问题与处理（2026-04-14）

现象：

- 按 `xelatex -> biber -> xelatex` 编译时，附录章节位置曾出现：
  - `Runaway argument`
  - `Paragraph ended before \HyPsd@@ProtectSpacesFi was complete`
- 随后 `biber` 报 `main.bcf is malformed`（属于前一步失败后的连锁错误）。

根因：

- 附录章节标题与 `hyperref` 书签处理兼容性问题，不是 TeX Live 安装问题，也不是 `biber` 本身问题。

处理：

- 对附录章节写法做最小规避（避免破坏模板规范）：
  - 文件：`sections/appendices.tex`
  - 写法：`\\chapter[Appendix]{附录}`

结果：

- 编译链路可正常完成，PDF 正常生成。
- 仍可能存在非致命警告（字体替代、版面 over/underfull、部分 `hyperref` 提示），不影响产出。

## 参考与来源声明

- 原始模板项目（历史来源）：
  - GitHub: https://github.com/Tr0py/NKU-thesis-template-2020
  - Overleaf 模板页：
    https://www.overleaf.com/latex/templates/nan-kai-da-xue-ben-ke-sheng-bi-ye-lun-wen-mo-ban-v1-dot-4/hdfqhtmmmdpv
- `docs/` 中的 Jekyll 配置与首页文案主要用于项目展示页，不作为论文编译依赖。
