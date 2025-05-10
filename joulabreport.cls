% Jiangsu Ocean University Lab Report Template Class
% Author: Tseka Luk (Information and Computing Science (Embedded) 1221)
% Email: zihoi.luk@foxmail.com
% GitHub: https://github.com/TsekaLuk
% Last updated: 2024-12-10
% License: MIT License
% 
% Copyright (c) 2024 Tseka Luk
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{joulabreport}[2024/01/01 Jiangsu Ocean University Lab Report Template]

% Base class
\LoadClass[12pt,a4paper]{article}

% Required packages
\RequirePackage[UTF8]{ctex}
\RequirePackage[left=2.5cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx}[2016/02/03]  % 指定版本以避免冲突
\RequirePackage{xeCJK}
\RequirePackage{fontspec}  % 添加 fontspec 包
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{ulem}
\RequirePackage{fancybox}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{threeparttable}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{placeins}
\RequirePackage{listings}
\RequirePackage{zhnumber}
\RequirePackage{tikz}
\RequirePackage{atbegshi}  % 用于页面控制
\RequirePackage{ifthen}    % 用于条件判断
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\RequirePackage[sort&compress,numbers,super,square]{natbib}  % 参考文献支持，使用上标引用
\RequirePackage{gbt7714}  % 添加中文参考文献支持
\RequirePackage{etoolbox}  % 用于 \AtEndPreamble
\RequirePackage{enumitem}  % 加载enumitem包以便自定义列表环境

% Font settings
\setmainfont{Times New Roman}  % 英文字体
\setCJKmainfont[
    AutoFakeBold=2.5,  % 使用伪粗体，数值控制粗度
    Path=font/
]{SimSun.ttf}  % 宋体
\setCJKsansfont[Path=font/]{SimHei.ttf}  % 黑体
\setCJKsansfont[Path=font/,BoldFont=SimHei-Bold.ttf]{SimHei.ttf}  % 黑体加粗
\newCJKfontfamily\hwxw[Path=font/,AutoFakeBold=2]{STXINWEI.ttf}  % 华文新魏
\setCJKfamilyfont{kai}{FandolKai-Regular}[AutoFakeBold=2]  % 楷体
\newcommand{\kai}{\CJKfamily{kai}}  % 定义切换命令

% Define song as alias for CJK main font
\newcommand{\song}{\CJKfamily{rm}}

% 字号设置
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}    % 初号
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}  % 小初
\newcommand{\yichuhao}{\fontsize{32pt}{\baselineskip}\selectfont}  % 一号
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}     % 二号
\newcommand{\xiaoer}{\fontsize{18pt}{\baselineskip}\selectfont}    % 小二
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}    % 三号
\newcommand{\xiaosan}{\fontsize{15pt}{\baselineskip}\selectfont}   % 小三
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}     % 四号
\newcommand{\xiaosi}{\fontsize{12pt}{\baselineskip}\selectfont}    % 小四
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}   % 五号
\newcommand{\xiaowu}{\fontsize{9pt}{\baselineskip}\selectfont}     % 小五

% Line and paragraph spacing
\linespread{1.3}
\setlength{\parskip}{0.5em}
\setlength{\parindent}{2em}

% Underline command for form fields
\let\olduline\uline
\renewcommand{\uline}[2][7cm]{%
  \begin{tabular}[t]{@{}p{#1}@{}}
    \centering{\heiti\xiaoer\entryfont #2}
  \end{tabular}%
  \rule{#1}{0.4pt}%
}

% Figure and table settings
\captionsetup[figure]{
    format=hang,
    labelsep=quad,
    font={small,bf},
    position=bottom,
    skip=10pt
}

\captionsetup[table]{
    format=hang,
    labelsep=quad,
    font={small,bf},
    position=top,
    skip=10pt
}

\captionsetup[lstlisting]{
    format=hang,
    labelsep=quad,
    font={small,bf},
    position=bottom,
    skip=10pt
}

% Define colors for listings
\definecolor{codeblue}{RGB}{0,0,255}
\definecolor{codegray}{RGB}{128,128,128}
\definecolor{codepurple}{RGB}{128,0,128}

% Listings settings
\lstset{
    basicstyle=\small\ttfamily,
    numbers=left,
    numberstyle=\tiny,
    frame=single,
    breaklines=true,
    keywordstyle=\color{codeblue},
    commentstyle=\color{codegray},
    stringstyle=\color{codepurple},
    showstringspaces=false,
    xleftmargin=2em,
    framexleftmargin=1.5em,
    title={\lstname},  % 使用代码标题
    captionpos=t  % 标题位置在顶部
}

% 定义分割行的宽度（基准宽度）
\newlength{\splitwidth}
\setlength{\splitwidth}{3.3cm}  % 单个分割行的宽度
\newlength{\fullwidth}
\setlength{\fullwidth}{2\splitwidth}  % 计算总宽度：两倍分割行宽度加上间距
\addtolength{\fullwidth}{10pt}  % 加上中间间距

% 定义表格行命令
\newcommand{\titlerow}[2]{%
  {\heiti\xiaoer #1\hspace{0pt}} & 
  \multicolumn{3}{l}{%
    \begin{tabular}[t]{@{}p{\fullwidth}@{}}
      \centering{\heiti\xiaoer\entryfont #2}
    \end{tabular}%
    \rule{\fullwidth}{0.4pt}%
  } \\[0.6cm]
}

\newcommand{\titlerowsplit}[4]{%
  {\heiti\xiaoer #1\hspace{0pt}} & 
  \begin{tabular}[t]{@{}p{\splitwidth}@{}}
    \centering{\heiti\xiaoer\entryfont #2}
  \end{tabular}%
  \rule{\splitwidth}{0.4pt} &
  {\heiti\xiaoer #3\hspace{0pt}} & 
  \begin{tabular}[t]{@{}p{\splitwidth}@{}}
    \centering{\heiti\xiaoer\entryfont #4}
  \end{tabular}%
  \rule{\splitwidth}{0.4pt} \\[0.6cm]
}

% 添加一个计数器来跟踪真正的封面页
\newcounter{iscover}
\setcounter{iscover}{1}

% 替换为新的宽度计算系统
% 定义表格总宽度及各元素比例
\newlength{\tablewidth}
\setlength{\tablewidth}{0.4\textwidth}  % 表格总宽度

% 定义各个元素的比例因子
\newcommand{\baselinefactor}{0.45}  % 基准宽度占总宽度的比例
\newcommand{\columnspacefactor}{0}  % 列间距占总宽度的比例

% 计算各元素的实际宽度
\newlength{\baselinewidth}
\setlength{\baselinewidth}{\baselinefactor\tablewidth}  % 基准宽度(单元格宽度)

\newlength{\columnspace}
\setlength{\columnspace}{\columnspacefactor\tablewidth}  % 列间距

\newlength{\courselinewidth}
\setlength{\courselinewidth}{1.2\tablewidth}  % 课程信息宽度，这是主要改变文字在横线上的横向位置的

% 添加 a new command for semester code
\newcommand{\semestercode}[1]{\def\@semestercode{#1}} % New command for semester code

% Add commands for the three parts of the semester code
\newcommand{\semesteryear}[1]{\def\@semesteryear{#1}} % First part (e.g., 2024)
\newcommand{\semesteryeartwo}[1]{\def\@semesteryeartwo{#1}} % Second part (e.g., 2025)
\newcommand{\semesternumber}[1]{\def\@semesternumber{#1}} % Third part (e.g., 2)

% 修改封面页
\renewcommand{\maketitle}{
  \begin{titlepage}
    \newgeometry{
      a4paper,
      left=\dimexpr\framemargin+\textframesep\relax,
      right=\dimexpr\framemargin+\textframesep\relax,
      top=96pt, % 增加上边距
      bottom=\dimexpr\framemargin+\textframesep\relax,
      headheight=14pt,
      headsep=0.6em,
      includehead
    }
    \begin{center}
      % 校名
      {\bfseries\hwxw\chuhao\zihao{0} 江\ \ \ 苏\ \ \ 海\ \ \ 洋\ \ \ 大\ \ \ 学\par}
      \vspace{32pt}
      
      % 实验报告书标题
      {\bfseries\kai\xiaochuhao 实\ \ \ \ \ 验\ \ \ \ \ 报\ \ \ \ \ 告\ \ \ \ \ 书\par}
      
      \vspace{-12pt}
      % 添加学期编码行（三段横线）
      \begin{center}
        \begin{tabular}{c@{}c@{}c@{}c@{}c}
          % First row: semester code parts with raisebox to move text closer to lines
          \makebox[2cm]{\raisebox{-12pt}[0pt][0pt]{\heiti\erhao\bfseries\@semesteryear}} & 
          \hspace{0.5em}\raisebox{-8pt}[0pt][0pt]{\rule{0.25cm}{2pt}}\hspace{0.5em} &
          \makebox[2cm]{\raisebox{-12pt}[0pt][0pt]{\heiti\erhao\bfseries\@semesteryeartwo}} & 
          \hspace{0.5em}\raisebox{-8pt}[0pt][0pt]{\rule{0.25cm}{2pt}}\hspace{0.5em} &
          \makebox[2cm]{\raisebox{-12pt}[0pt][0pt]{\heiti\erhao\bfseries\@semesternumber}} \\[0pt]
          
          % Second row: horizontal lines with dashes between them
          \rule{2cm}{2pt} & & \rule{2cm}{2pt} & & \rule{2cm}{2pt} \\
        \end{tabular}
      \end{center}
      
      \vspace{32pt}
      
      % 使用统一的表格布局确保所有元素对齐
      \begin{center}
        \setlength{\parindent}{0pt}
        \renewcommand{\arraystretch}{1.8}
        \begin{tabular}{lp{\baselinewidth}@{\hspace{\columnspace}}lp{\baselinewidth}}
          % 课程信息部分 - 跨两列
          \heiti\xiaoer 课程名称：& \multicolumn{3}{l}{\makebox[\courselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@coursename}}} \\\cline{2-4}
          & \multicolumn{3}{l}{} \\[-1.2em]
          
          % 实验名称（第一行）
          \heiti\xiaoer 实验名称：& \multicolumn{3}{l}{\makebox[\courselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@expname}}} \\\cline{2-4}

          % 条件显示第二行
          \ifx\@expnametwo\@empty
            % 如果为空，不显示第二行，直接调整垂直间距以保持一致的整体间距
            & \multicolumn{3}{l}{} \\[-1em]
          \else
            % 如果不为空，显示第二行及其横线
            & \multicolumn{3}{l}{} \\[-3.0em]  % 第一行后的间距调整
            & \multicolumn{3}{l}{\makebox[\courselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@expnametwo}}} \\\cline{2-4}
            & \multicolumn{3}{l}{} \\[-1.2em]  % 第二行后的间距调整
          \fi

          \heiti\xiaoer 姓\qquad 名：& \multicolumn{3}{l}{\makebox[\courselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@author}}} \\\cline{2-4}
          & \multicolumn{3}{l}{} \\[-1.2em]
          % 班级和学号部分 - 分别使用第2列和第4列
          \heiti\xiaoer 班\qquad 级：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@classname}} & \heiti\xiaoer 学号：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@studentid}} \\[-2em]
          & \rule{\baselinewidth}{0.4pt} & & \rule{\baselinewidth}{0.4pt} \\[0.3cm]
          
          % 日期和地点部分 - 分别使用第2列和第4列
          \heiti\xiaoer 日\qquad 期：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@date}} & \heiti\xiaoer 地点：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@location}} \\[-2em]
          & \rule{\baselinewidth}{0.4pt} & & \rule{\baselinewidth}{0.4pt} \\[0.3cm]
          
          % 指导教师和成绩部分 - 使用第2列
          \heiti\xiaoer 指导教师：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{\heiti\xiaoer\@teacher}} & \heiti\xiaoer 成绩：& \makebox[\baselinewidth][c]{\raisebox{-6pt}[0pt][0pt]{}} \\[-2em]
          & \rule{\baselinewidth}{0.4pt} & & \rule{\baselinewidth}{0.4pt} \\[0.3cm]
        \end{tabular}
      \end{center}
      
      % \vfill
      \vspace{48pt}
      
      % 底部院系名称
      {\song\erhao 理\ \ \ 学\ \ \ 院\par}
      \vspace{1cm}
    \end{center}
    \restoregeometry % 恢复原始几何设置
  \end{titlepage}
  \setcounter{iscover}{0}  % 标记封面页结束
}

% Custom commands for title page information
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\expname}[1]{\def\@expname{#1}}
\newcommand{\expnametwo}[1]{\def\@expnametwo{#1}} % New command for second line of experiment name
\newcommand{\classname}[1]{\def\@classname{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\location}[1]{\def\@location{#1}}
\newcommand{\teacher}[1]{\def\@teacher{#1}}
\newcommand{\thisdate}[1]{\def\@date{#1}}  % 新的日期命令，保持原格式

% Section formatting
\renewcommand\thesection{\arabic{section}}  % 使用阿拉伯数字作为节号

% 完全重新定义 section 命令
\renewcommand{\section}[1]{%
    \par\noindent  % 确保从最左边开始
    \stepcounter{section}  % 手动增加节号计数
    {\CJKfamily{sf}\xiaosan\chinese{section}、#1}%  % 使用普通黑体
    \par\vspace{0.5em}%
    \@afterheading  % 处理段落间距
}

% 重置段落缩进
\setlength{\parindent}{2em}  % 确保其他段落保持正常缩进

% 重新定义图表和代码标题格式
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\lstlistingname}{代码}

% 设置编号格式
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}
\@addtoreset{lstlisting}{section}  % 按节重置编号
\providecommand{\thelstlisting}{\arabic{lstlisting}}  % 先定义默认格式
\renewcommand{\thelstlisting}{\arabic{section}.\arabic{lstlisting}}  % 然后重新定义

% 统一设置标题格式
\captionsetup{
    format=hang,
    labelsep=quad,
    font={small,bf},
    skip=10pt
}

% 设置 listings 环境的标题格式
\lstset{
    basicstyle=\small\ttfamily,
    numbers=left,
    numberstyle=\tiny,
    frame=single,
    breaklines=true,
    keywordstyle=\color{codeblue},
    commentstyle=\color{codegray},
    stringstyle=\color{codepurple},
    showstringspaces=false,
    xleftmargin=2em,
    framexleftmargin=1.5em,
    title={\lstname},  % 使用代码标题
    captionpos=t  % 标题位置在顶部
}

% Default values
\coursename{}
\expname{}
\expnametwo{} % Default value for second line of experiment name
\classname{}
\studentid{}
\location{}
\teacher{}

% Additional settings for mathematical modeling
\numberwithin{equation}{section}  % 按节编号
\numberwithin{figure}{section}    % 图按节编号
\numberwithin{table}{section}     % 表按节编号

% Header and footer settings
\pagestyle{fancy}
\fancyhf{}  % 清除所有页眉页脚
\fancyhead[C]{\xiaosi\song 江苏海洋大学实验报告}  % 设置页眉
\fancyfoot[C]{\xiaosi\thepage}  % 设置页脚
\renewcommand{\headrulewidth}{0.4pt}  % 页眉线宽度
\renewcommand{\footrulewidth}{0pt}  % 页脚线宽度

% 定义空白样式
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[C]{\xiaosi\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 定义第一页特殊样式，页码在边框外
\fancypagestyle{firstpage}{%
    \fancyhf{}
    \fancyfoot[C]{\xiaosi\raisebox{-1.35cm}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 定义fancy样式
\fancypagestyle{fancy}{%
  \fancyhf{}% 清除所有页眉页脚
  \fancyhead[C]{\xiaosi\song 江苏海洋大学实验报告}% 页眉
  \fancyfoot[C]{\xiaosi\thepage}% 页脚
  \renewcommand{\headrulewidth}{0.4pt}% 页眉线
  \renewcommand{\footrulewidth}{0pt}% 页脚线
}

% 确保英文和数字使用Times New Roman
\newfontfamily\entryfont{Times New Roman}[Scale=1.0]

% 定义新的命令用于格式化表格条目
\newcommand{\entry}[1]{{\xiaoer\entryfont{#1}}}

% 定义框线与文本的间距
\newlength{\boxpadding}
\setlength{\boxpadding}{0.5cm}  % 框线与文本的间距

% 定义框的边距（相对于页面边缘）
\newlength{\framemargin}
\setlength{\framemargin}{2cm}

% 定义文本和框之间的间距
\newlength{\textframesep}
\setlength{\textframesep}{0.5cm}

% 定义顶部额外减少的距离
\newlength{\topreduce}
\setlength{\topreduce}{0.5cm}

% 定义框线绘制命令
\newcommand{\drawpagebox}{%
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=0.5pt]
      ([shift={(\framemargin,-\framemargin)}]current page.north west)
      rectangle
      ([shift={(-\framemargin,\framemargin)}]current page.south east);
  \end{tikzpicture}%
}

% 设置页面样式
\AtBeginDocument{%
  % 移除原有的页眉页脚设置
  \let\ps@fancy\relax
  \pagestyle{plain}  % 只保留页码
  
  % 修复第一页页码位置问题 - 改用firstpage样式
  \AtBeginShipoutFirst{\thispagestyle{firstpage}}
  
  % 在每页开始时检查并绘制框线
  \AtBeginShipout{%
    \ifnum\value{iscover}=1\relax
      % 跳过真正的封面页
    \else
      % 其他所有页面都添加框线
      \AtBeginShipoutUpperLeft{\drawpagebox}%
    \fi
  }
}

% 设置页面布局
\geometry{
  a4paper,
  left=\dimexpr\framemargin+\textframesep\relax,
  right=\dimexpr\framemargin+\textframesep\relax,
  top=\dimexpr\framemargin+\textframesep-\topreduce\relax,
  bottom=\dimexpr\framemargin+\textframesep\relax,
  headheight=14pt,
  headsep=0.6em,
  includehead
}

% 重新定义页码位置
\renewcommand{\thepage}{\xiaosi\arabic{page}}

% 公式编号格式
\numberwithin{equation}{section}  % 按节编号
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}  % 使用阿拉伯数字

% 图表编号格式
\numberwithin{figure}{section}  % 图按节编号
\numberwithin{table}{section}   % 表按节编号
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}  % 使用阿拉伯数字
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}    % 使用阿拉伯数字

% 每节重置编号
\@addtoreset{equation}{section}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}

% Algorithm and pseudocode support
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
\renewcommand{\algorithmicif}{\textbf{若}}
\renewcommand{\algorithmicthen}{\textbf{则}}
\renewcommand{\algorithmicelse}{\textbf{否则}}
\renewcommand{\algorithmicfor}{\textbf{对}}
\renewcommand{\algorithmicdo}{\textbf{执行}}
\renewcommand{\algorithmicwhile}{\textbf{当}}
\renewcommand{\algorithmicend}{\textbf{结束}}
\renewcommand{\algorithmicreturn}{\textbf{返回}}
\algrenewtext{Function}[2]{\textbf{函数} \textsc{#1}(#2)}

% Algorithm caption settings
\captionsetup[algorithm]{
    format=hang,
    labelsep=quad,
    font={small,bf},
    position=top
}

% 参考文献样式设置
\setcitestyle{square,super}  % 方括号上标引用
\bibliographystyle{gbt7714-numerical}  % 国标样式
\renewcommand{\bibfont}{\small}  % 参考文献字号
\setlength{\bibsep}{0.5ex}  % 参考文献条目间距

% 重新定义参考文献标题格式
\renewcommand{\bibsection}{%
    \section{参考文献}
}

% 设置参考文献格式
\renewcommand{\bibfont}{\song\wuhao}  % 设置参考文献字体和大小
\setlength{\bibsep}{0.5ex}  % 参考文献条目间距
\renewcommand{\@biblabel}[1]{[#1]}  % 参考文献标签格式

% 重新定义 thebibliography 环境
\renewenvironment{thebibliography}[1]{%
    \bibsection
    \list{\@biblabel{\@arabic\c@enumiv}}{%
        \settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \itemsep 0pt  % 调整条目间距
        \parsep 0pt   % 调整段落间距
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}%
    }%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
}{%
    \def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
}

% 确保 hyperref 在其他包之后加载
\AtEndPreamble{
  \RequirePackage[hidelinks,
                  colorlinks=true,
                  linkcolor=blue,
                  citecolor=blue,
                  urlcolor=magenta,
                  bookmarks=true,
                  bookmarksnumbered=true,
                  pdfstartview=FitH]{hyperref}
  \hypersetup{
    pdftitle={江苏海洋大学实验报告},
    pdfauthor={\@author},
    pdfsubject={\@coursename},
    pdfcreator={XeLaTeX with joulabreprot class}
  }
}

% 定义插入代码文件的命令
\newcommand{\inputcode}[2][]{%
  \lstinputlisting[
    language=#1,
    caption=代码文件：#2,
    frame=single,
    numbers=left,
    breaklines=true,
    basicstyle=\small\ttfamily,
    keywordstyle=\color{codeblue},
    commentstyle=\color{codegray},
    stringstyle=\color{codepurple},
    showstringspaces=false
  ]{#2}%
}

% 定义两种不同的列表环境设置
\SetEnumitemKey{noindent}{leftmargin=*, wide=0pt}  % 无缩进设置
\SetEnumitemKey{withindent}{leftmargin=2em}  % 有缩进设置

% 设置cnumerate环境和其他列表环境的默认样式
\setlist[enumerate]{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt, leftmargin=2em}
\setlist[itemize]{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt, leftmargin=2em}

% 定义中文括号序号环境（无缩进）
\newenvironment{cnumerate}{%
  \begin{enumerate}[label=（\arabic*）,noindent,itemsep=0.2em,parsep=0em]
}{%
  \end{enumerate}
}

% 定义中文括号序号命令，用于行内使用
\newcommand{\citem}[1]{（#1）}

% 添加附录格式设置 - 在文件末尾添加
\AtBeginDocument{%
  \let\originalsection\section
  \let\originalthesection\thesection
  
  % 保存原始的section格式
  \let\stdSection\section
  \let\stdThesection\thesection
  
  % 定义附录开始后的变化
  \renewcommand{\appendix}{%
    \setcounter{section}{0}%
    \renewcommand\thesection{\Alph{section}}%
    \renewcommand{\section}[1]{%
      \par\noindent  % 确保从最左边开始
      \stepcounter{section}  % 手动增加节号计数
      {\heiti\xiaosan\textbf{\thesection\space##1}}%  % 整体加粗，使用字母编号+"空格"+标题
      \par\vspace{0.5em}%
      \@afterheading  % 处理段落间距
    }%
  }
}