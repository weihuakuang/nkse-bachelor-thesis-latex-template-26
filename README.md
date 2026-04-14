# nkse-bachelor-thesis-latex-template-26

## 在线查看/编辑（推荐）

**https://www.texpage.com/share/8a5d40412315420d82407df140342bf1**


2026 鍗楀紑澶у杞欢瀛﹂櫌鏈姣曚笟璁烘枃 LaTeX 妯℃澘銆?
## 椤圭洰缁撴瀯

- `main.tex`锛氫富鏂囦欢銆?- `sections/`锛氶櫎涓绘枃浠跺鐨勫彲鍐欑珷鑺傚唴瀹广€?- `NKThesis.sty`锛氭ā鏉挎牱寮忔枃浠躲€?- `nkthesis.bib`锛氬弬鑰冩枃鐚暟鎹簱銆?- `nkthesis.bbx` / `nkthesis.cbx`锛歚biblatex` 鏍峰紡鏂囦欢锛堝綋鍓嶉厤缃繀闇€锛夈€?- `fonts/`锛氭ā鏉夸娇鐢ㄥ瓧浣撴枃浠讹紙褰撳墠鏍峰紡閰嶇疆蹇呴渶锛夈€?- `figures/`锛氱ず渚?姝ｆ枃浣跨敤鍥剧墖璧勬簮銆?- `compile.ps1`锛歐indows 缂栬瘧鑴氭湰锛堥殧绂荤紪璇戯紝涓嶅湪椤圭洰鏍圭洰褰曚繚鐣欎腑闂存枃浠讹級銆?- `compile.sh`锛歮acOS/Linux 绛変环缂栬瘧鑴氭湰锛堥殧绂荤紪璇戯紝涓嶅湪椤圭洰鏍圭洰褰曚繚鐣欎腑闂存枃浠讹級銆?
## 闄勫綍鐘舵€?
- 榛樿鐘舵€侊細闄勫綍鍦?`main.tex` 涓凡娉ㄩ噴锛屼笉鍙備笌缂栬瘧銆?- 璇存槑锛氳€佸笀鎻愪緵鐨?PDF 鏍蜂緥涓湰韬笉鍖呭惈闄勫綍锛屽洜姝ゆ浠撳簱榛樿鍏抽棴闄勫綍鍏ュ彛銆?- 濡傞渶寮€鍚檮褰曪細
  1. 鍙栨秷娉ㄩ噴 `\includeonly` 涓殑 `sections/appendices`
  2. 鍙栨秷娉ㄩ噴姝ｆ枃涓殑 `\include{sections/appendices}`
- 闄勫綍鏂囦欢璇蜂娇鐢ㄦā鏉垮畾涔夌殑璋冪敤鏂瑰紡锛歚\appendix{...}`锛堝綋鍓?`sections/appendices.tex` 涓?`\appendix{}`锛夈€?
## 鐜瑕佹眰

- TeX Live锛堝凡楠岃瘉鍙敤锛夈€?- 鍙墽琛屽懡浠わ細`latexmk`銆乣xelatex`銆乣biber`銆?- Windows 涓嬫帹鑽?PowerShell 鎵ц `compile.ps1`銆?- macOS 鐞嗚鍏煎锛坄latexmk + xelatex + biber` 宸ュ叿閾句竴鑷达級锛屼絾鐩墠鏈仛瀹炴満楠岃瘉銆?
## 鐜璁板綍

- 鎿嶄綔绯荤粺锛歚Microsoft Windows NT 10.0.22631.0`
- TeX 鍙戣鐗堬細`TeX Live 2026`
- `xelatex`锛歚XeTeX 3.141592653-2.6-0.999998 (TeX Live 2026)`
- `biber`锛歚2.21`
- `latexmk`锛歚4.88`

## 鎺ㄨ崘缂栬瘧鏂瑰紡

Windows:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\compile.ps1 -Main main
```

macOS/Linux:

```bash
bash ./compile.sh main
```

璇ユ柟寮忕壒鐐癸細

- 浣跨敤 `latexmk` 鑷姩璋冨害 `xelatex + biber`銆?- 鍦ㄧ郴缁熶复鏃剁洰褰曟墽琛屽畬鏁寸紪璇戞祦绋嬨€?- 浠呭洖浼?`main.pdf` 鍒伴」鐩牴鐩綍銆?- 鏍圭洰褰曚笉淇濈暀 `aux/bbl/bcf/log/toc` 绛変腑闂存枃浠躲€?
## 鎵嬪姩缂栬瘧鏂瑰紡锛堝吋瀹癸級

濡傞渶鎵嬪姩鍥哄畾娴佺▼锛屽彲鎵ц锛?
1. `xelatex main`
2. `biber main`
3. `xelatex main`
4. `xelatex main`锛堝彲閫夛紝鐢ㄤ簬杩涗竴姝ョǔ瀹氫氦鍙夊紩鐢級

## 宸插鐞嗛棶棰樿褰?
### 閿欒鐜拌薄

- 鎸?`xelatex -> biber -> xelatex` 缂栬瘧鏃讹紝鍦ㄩ檮褰曚綅缃姤閿欙細
  - `Runaway argument`
  - `Paragraph ended before \HyPsd@@ProtectSpacesFi was complete`
- 闅忓悗 `biber` 鎶?`main.bcf is malformed`锛堜笂涓€杞?`xelatex` 澶辫触瀵艰嚧鐨勮繛閿侀敊璇紝涓嶆槸 `biber` 鏈韩鏁呴殰锛夈€?
### 瑙﹀彂鏂瑰紡

- 鍦?`sections/appendices.tex` 涓皢闄勫綍鍐欐垚浜嗏€渀appendix + chapter`鈥濈粍鍚堬紙渚嬪 `\appendix` 鍚庡啀鍐?`\chapter[...]` 鎴?`\\chapter[...]`锛夈€?- 杩欎細涓庢ā鏉垮唴閮ㄧ珷鑺傚畾涔夊拰 `hyperref` 涔︾鐢熸垚鍐茬獊锛岃Е鍙戜笂闈㈢殑鑷村懡閿欒銆?
### 鏍瑰洜

- `NKThesis.sty` 宸查噸瀹氫箟 `\appendix`锛屽叾鍐呴儴浼氳皟鐢?`\chapter`銆?- 鍥犳璇ユā鏉夸腑闄勫綍搴旂洿鎺ヤ娇鐢?`\appendix{...}`锛屼笉搴斿啀棰濆鎵嬪啓 `\chapter`銆?
### 淇鏂规

- 鎶婇檮褰曞啓娉曚慨姝ｄ负妯℃澘鍏煎褰㈠紡锛歚sections/appendices.tex` 浣跨敤 `\appendix{}`銆?- 鍦?`main.tex` 榛樿娉ㄩ噴闄勫綍鍏ュ彛锛坄includeonly` 鍜屾鏂?`\include` 鍚屾娉ㄩ噴锛夛紝閬垮厤榛樿鏋勫缓鍖呭惈闄勫綍銆?
### 缁撴灉

- `xelatex + biber` 缂栬瘧閾捐矾鎭㈠姝ｅ父銆?- 浠嶅彲鑳芥湁闈炶嚧鍛借鍛婏紙瀛椾綋鏇夸唬銆乷ver/underfull銆侀儴鍒?`hyperref` 鎻愮ず锛夛紝涓嶅奖鍝?`main.pdf` 鐢熸垚銆?
## 鐩稿鍘熼」鐩殑鏀硅繘

- 缂栬瘧娴佺▼锛?  - 鏂板 `compile.ps1`锛屽湪绯荤粺涓存椂鐩綍闅旂缂栬瘧锛屼粎鍥炰紶 `main.pdf`锛岄」鐩牴鐩綍涓嶄繚鐣欎腑闂存枃浠躲€?- 鐩綍缁撴瀯锛?  - 灏嗛櫎 `main.tex` 澶栫殑鍙啓绔犺妭闆嗕腑鍒?`sections/`锛屾彁楂樺彲缁存姢鎬с€?- 鏋勫缓绋冲畾鎬э細
  - 淇闄勫綍绔犺妭鍐欐硶涓庢ā鏉垮畾涔変笉涓€鑷村鑷寸殑鑷村懡缂栬瘧閿欒銆?  - 榛樿鍏抽棴闄勫綍鍏ュ彛锛屾寜闇€寮€鍚紝鍑忓皯鏃ュ父鏋勫缓椋庨櫓銆?- 宸ョ▼鏂囨。锛?  - 鍚堝苟骞惰鑼冨寲 README锛岃ˉ鍏呯幆澧冭褰曘€佺紪璇戞柟寮忋€侀棶棰樿瘖鏂拰浣跨敤璇存槑銆?
## 鍙傝€冩潵婧愬０鏄?
- 鍘嗗彶鏉ユ簮妯℃澘浠撳簱锛?https://github.com/Tr0py/NKU-thesis-template-2020>
- Overleaf 妯℃澘椤碉細<https://www.overleaf.com/latex/templates/nan-kai-da-xue-ben-ke-sheng-bi-ye-lun-wen-mo-ban-v1-dot-4/hdfqhtmmmdpv>

## 璁稿彲璇?
鏈粨搴撻噰鐢?[MIT License](LICENSE)銆?
