# 编译问题记录（2026-04-14）

## 现象

- 按 `xelatex -> biber -> xelatex` 编译时，第一步在 `appendices.tex` 的附录章节处报错：
  - `Runaway argument`
  - `Paragraph ended before \HyPsd@@ProtectSpacesFi was complete`
- 随后 `biber` 报 `main.bcf is malformed`（属于第一步失败后的连锁结果）。

## 根因

- 根因在附录章节标题与 `hyperref` 书签处理的兼容问题，不是 TeX Live 安装问题，也不是 `biber` 本身问题。

## 处理

- 对附录章节行做最小规避改动，使编译链路可完成：
  - 文件：`appendices.tex`
  - 当前可编译写法：`\\chapter[Appendix]{附录}`

## 结果

- 可完成 `xelatex -> biber -> xelatex`。
- 仍存在非致命警告（字体替代、版面 over/underfull、部分 `hyperref` 提示），但不影响 PDF 生成。
