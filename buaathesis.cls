% !Mode:: "TeX:UTF-8"
%!TEX TS-program = xelatex
%%%%% 'buaathesis.cls' BEGIN

%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{buaathesis}
              [2020/03/05 v0.9
The LaTeX template for thesis of BUAA]
\typeout{Document Class `buaathesis' v0.9 by BHOSC (2020/03)}

%%%%%%%%%% class options %%%%%%%%%%
% 模板选项

% 本模板自身包含五个选项
% 前四个为对应学位类型，决定不同样式
% 第五个为颜色选项，用于电子版的情况
\newif\ifbuaa@bachelor\buaa@bachelorfalse
\newif\ifbuaa@engineer\buaa@engineerfalse
\newif\ifbuaa@color\buaa@colorfalse
\DeclareOption{bachelor}{\buaa@bachelortrue}
\DeclareOption{engineer}{\buaa@engineertrue}
\DeclareOption{color}{\buaa@colortrue}
% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 引用ctexbook及基本设置
\LoadClass[zihao=-4,a4paper]{ctexbook}[2007/10/19]
%%%%%%%%%% 导言区 %%%%%%%%%%
%% 1，修复LaTeX Font Warning: Font shape `U/rsfs/m/n' in size <22.08249> not available
%% (Font)            size <20.74> substituted
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{%
   <-6> rsfs5
   <6-8> rsfs7
   <8-> rsfs10
}{}
%%2，
%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包

\RequirePackage{ifthen}
\RequirePackage{ctex}
\RequirePackage{mathrsfs}
\RequirePackage{zhlipsum}
%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

%%%%%%%%%% hyphen %%%%%%%%%%
% For the `\hyp{}` command. Allow the user to insert `hyp{}` manually to
% adjust the line break when necessary.
\RequirePackage{hyphenat}

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}
% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了粗体为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
\setCJKmainfont{SimSun}
%\setCJKfamilyfont{hwxingkai}{STXingkai}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}
%%新加的
\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
%%%%%%%%%% color %%%%%%%%%%
% 颜色设置

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距

\RequirePackage{geometry}
\newgeometry{
    top=2.54cm, bottom=2.2cm, left=3.17cm, right=3.17cm,
    headheight=1.5cm, footskip=1.75cm,includefoot
}
\savegeometry{bachelorgeometry}
\loadgeometry{bachelorgeometry}

%%%%%%%%%% space %%%%%%%%%%
% 其他间距

\renewcommand{\baselinestretch}{1.5} %1.5倍行间距
\setlength{\parindent}{2em} %首行全部缩进2字符
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚

\RequirePackage{fancyhdr}
\fancypagestyle{frontmatter}{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
}
\fancypagestyle{mainmatter}{
    \fancyhead{}
    %\fancyfoot{}
    \cfoot{\thepage}
    \ifbuaa@bachelor
        \fancyhead[C]{
            %\includegraphics[width=37bp]{figure/buaamark.eps}\hfill
            \raisebox{2ex}{\songti\zihao{5}\centerline{\buaa@university 2021届本科生毕业设计（论文）}}\hfill
        }
    \else
        \if@twoside
            \fancyhead[CO]{\zihao{-5}\songti
                \buaa@university\buaa@headdegree 学位论文\vspace{1.5mm}
            }
            \fancyhead[CE]{\zihao{-5}\songti\leftmark\vspace{1.5mm}}
        \else
            \fancyhead[C]{\zihao{-5}\songti
                \ifthenelse{\isodd{\value{page}}}
                    {\buaa@university\buaa@headdegree 学位论文}
                    {\leftmark}
                \vspace{1.5mm}
            }
        \fi
        \fancyfoot[C]{\zihao{5}\thepage}
    \fi

    \renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
\renewcommand{\contentsname}{\heiti\zihao{-2}\bfseries 目\qquad 录}
\renewcommand\listfigurename{\heiti\zihao{-2}\bfseries 插\ 图\ 目\ 录}
\renewcommand\listtablename{\heiti\zihao{-2}\bfseries 表\ 格\ 目\ 录}
\renewcommand\bibname{参\ 考\ 文\ 献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
%
% 格式
\ctexset{
    chapter={
        name={第,章},
        number={\chinese{chapter}},
        format={\centering\zihao{-3}\heiti},
        nameformat={},
        aftername={\quad},
        titleformat={},
        beforeskip={0.8em},%段前间距
        afterskip={0.8em},%段后间距
    },
    section={
        name={,、},
        format={\zihao{4}\heiti\hangindent 0.97cm\linespread{1.5}},
        number={\chinese{section}},
        aftername={\quad},
        beforeskip={0.8em},
        afterskip={0.8em},
    },
    subsection={
        name={(,)},
        format={\zihao{-4}\heiti\hangindent 0.94cm\linespread{1.5}},
        number={\chinese{subsection}}, 
        aftername={\quad},
        beforeskip={0.8em},
        afterskip={0.8em},
    },
}


%\ctexset{
%    chapter={
%        name={第,章},
%        number={\chinese{chapter}},
%    },
%    section={
%        name={,、},
%        format={\zihao{4}\heiti\hangindent 0.97cm\linespread{1.5}\leftskip=0pt \rightskip=0pt plus 0cm},
%        number={\chinese{section}},
%    },
%    subsection={
%        name={(,)},
%        format={\zihao{-4}\heiti\hangindent 0.94cm\linespread{1.5}\leftskip=0pt \rightskip=0pt plus 0cm},
%        number={\chinese{subsection}},            
%    }
%}


%%%%%%%%%% contents %%%%%%%%%%
% 目录

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti\zihao{-4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}

% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[xetex,unicode,linkcolor=blue]{hyperref}
\ifbuaa@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={BUAA thesis},
    pdfauthor={BHOSC},
    pdfsubject={天津工业大学毕业设计论文},
    pdfcreator={田汝浩}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献
\RequirePackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{-4}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{-4}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{-4}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% code %%%%%%%%%%
% 代码

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{-4}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
}
\ifbuaa@color
    \lstset{
        numberstyle=\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
    }
\else
    \lstset{
        numberstyle=\color{black},
        keywordstyle=\color{black},
        commentstyle=\color{black},
        stringstyle=\color{black},
    }
\fi

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

%%%%%%%%%% theorem %%%%%%%%%%
% 定理

\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}
\ifbuaa@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{blue}}
\fi

%%%%%%%%%% caption %%%%%%%%%%
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{bachelorfigure}{\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelortable}{\heiti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{bachelorlstlisting}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterfigure}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mastertable}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterlstlisting}{\songti\bf\zihao{5}{#1\textrm{#2}#3}}

\captionsetup[figure]{format=bachelorfigure,labelsep=quad}
\captionsetup[table]{format=bachelortable,labelsep=quad}
\captionsetup[lstlisting]{format=bachelorlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
% 图、表、公式编号随 chapter 清零
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}
%图、表、公式编号章节关联
\renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
\oldappendix\rmrelation
}


% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    \ifbuaa@bachelor
        \pagenumbering{Roman}
    \else
        \pagenumbering{roman}
    \fi
}

% 保证偶数页结束章节
\newcommand{\clearemptydoublepage}{%
    \clearpage
    \if@twoside
        \ifodd
            \c@page
        \else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn
                \hbox{}\newpage
            \fi
        \fi
    \fi
}

%%%%%%%%%% index %%%%%%%%%%
% 首页

% 本科生首页的右上角和底部的填写内容居中
% cvrtc : CoVer - Right  - Top    - Center
% cvcbc : CoVer - Center - Bottom - Center
\newcommand{\ulinecvrtc}[1]{\uline{\makebox[9em][c]{\bf #1}}}
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[14em][c]{#1}}}
\newcommand{\swb}{\fontsize{35pt}{\baselineskip}\selectfont}%三十五磅
\newcommand{\slb}{\fontsize{16pt}{\baselineskip}\selectfont}%十六磅
% 中文首页
\newcommand{\titlech}{
        \begin{titlepage}
            % 第二个()里的参数表示左移35pt，下移55pt
            %\begin{picture}(0,0)(35,55)
                %\includegraphics[width=90pt]{figure/buaamark.eps}
            %\end{picture}
            \hfill
            \vskip 95bp
            \begin{center}
                %\includegraphics[width=360bp]{figure/buaaname.eps}
                \vskip 45bp
                \centerline{ \swb\songti\textbf{天津工业大学}}
                ~~\\
                \centerline{\zihao{2}\songti 本~科~生~毕~业~设~计~（~论~文~）~}
                ~~\\
                \vskip 136pt
                ~~\\
                {
                    \slb\songti
                        \begin{tabular}{cc}
                            学~~~~~~~~~~~~~~~~~号:~~&\ulinecvcbc{\buaa@studentID }\\[.4ex]
                            姓~~~~~~~~~~~~~~~~~名:~~&\ulinecvcbc{\buaa@thesisauthor }\\[.4ex]
                            专~~~~~~~~~~~~~~~~~业:~~&\ulinecvcbc{\buaa@major }\\[.4ex]
                            学~~~~~~~~~~~~~~~~~院:~~&\ulinecvcbc{\buaa@school }\\[.4ex]
                            指~~~导~~~教~~~师:~~&\ulinecvcbc{\buaa@teacher}\\
                            职~~~~~~~~~~~~~~~~~称:~~&\ulinecvcbc{\buaa@teacherjob }\\[.4ex]
                            完~~~成~~~日~~~期:~~&\ulinecvcbc{\buaa@thesisendyear.\buaa@thesisendmonth.\buaa@thesisendday}\\[.4ex]
                        \end{tabular}
                }
                \vskip 60bp
                %\centerline{\heiti\zihao{-3}\buaa@thesisdateyear ~~年~~\buaa@thesisdatemonth ~~月}
            \end{center}
        \end{titlepage}
}

%%%%%%%%%% abstract %%%%%%%%%%
% 摘要

% 中文摘要
\newenvironment{cabstract}{%
    \newpage
    \vspace*{2bp}
    \begin{center}
        \begin{minipage}[h]{.75\textwidth}
            \centering{\zihao{3}\heiti\buaa@thesistitle}
        \end{minipage}
        \begin{minipage}[h]{.8\textwidth}
            \begin{flushright}
                {\zihao{3}\heiti\buaa@thesissubtitle}
            \end{flushright}
            % subtitle should be flush right?
        \end{minipage}
    \end{center}
    %\vskip 10bp
    \centerline{\heiti\zihao{3} 摘~~~~要}
    \vskip 10bp
    \par
    \vspace{5ex}
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    \noindent
    {\heiti\zihao{-4} \textbf{关键词：}}\buaa@ckeyword
}

% 英文摘要
\newenvironment{eabstract}{%
    \newpage
    \vspace*{2bp}
    \begin{center}
        \begin{minipage}[h]{.75\textwidth}
            \centering{\bf\zihao{-3}\buaa@thesistitleeng}
        \end{minipage}
        \begin{minipage}[h]{.8\textwidth}
            \begin{flushright}
                {\zihao{-3}\heiti\buaa@thesissubtitleeng}
            \end{flushright}
        % subtitle should be flushright?
        \end{minipage}
    \end{center}
    \vskip 10bp
    \centerline{\bf\zihao{3} Abstract}
    \vskip 10bp
    \par
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    \noindent
    {\bf\zihao{-4} Key words: }\buaa@ekeyword
}

%%%%%%%%%% announce %%%%%%%%%%
% 本科生声明页

\newcommand{\announce}{%
    \clearemptydoublepage
    \thispagestyle{empty}
    \vspace*{54bp}
    \centerline{\bf\zihao{-2}\songti 本人声明}
    \vskip 27bp
    \zihao{4}我声明，本论文及其研究工作是由本人在导师指导下独立完成的，在完成论文时所利用的一
    切资料均已在参考文献中列出。\par
    \vskip 63bp
    \zihao{-4}
    \hfill
    \begin{tabular}{cl}
        作者：&\buaa@thesisauthor\\
        签字：&~~~~\\
        时间：& \buaa@thesisdateyear~年~\buaa@thesisdatemonth ~月
    \end{tabular}
}
%%%%%%%%%% settings for custom pages %%%%%%%%%%
% 首页重定义

\renewcommand{\maketitle}{%
    \titlech
    \pagestyle{empty}
    %\buaa@bachelor@assign     %本科生论文任务书
    \announce                 %本科生声明
    \pagestyle{fancy}
    \frontmatter
    \songti
    \zihao{-4}
}

%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息

% 学校名称
\def\buaa@university{}
\def\buaa@universityeng{Beihang University}
\newcommand{\university}[2]{%
    \def\buaa@university{#1}
    \def\buaa@universityeng{#2}
}
% 学院
\def\buaa@school{}
\def\buaa@schooleng{}
\newcommand{\school}[2]{%
    \def\buaa@school{#1}
    \def\buaa@schooleng{#2}
}
% 专业
\def\buaa@major{}
\def\buaa@majoreng{}
\newcommand{\major}[2]{%
    \def\buaa@major{#1}
    \def\buaa@majoreng{#2}
}
% 论文标题和副标题
\def\buaa@thesistitle{}
\def\buaa@thesissubtitle{}
\def\buaa@thesistitleeng{}
\def\buaa@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{%
    \def\buaa@thesistitle{#1}
    \def\buaa@thesissubtitle{#2}
    \def\buaa@thesistitleeng{#3}
    \def\buaa@thesissubtitleeng{#4}
}
% 作者
\def\buaa@thesisauthor{}
\def\buaa@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\buaa@thesisauthor{#1}
    \def\buaa@thesisauthoreng{#2}
}
% 指导老师
\def\buaa@teacher{}
\def\buaa@teachereng{}
\newcommand{\teacher}[2]{%
    \def\buaa@teacher{#1}
    \def\buaa@teachereng{#2}
}
%指导老师职称
% 分类号
\def\buaa@teacherjob{}
\newcommand{\teacherjob}[1]{%
    \def\buaa@teacherjob{#1}
}
% 副指导老师
\def\buaa@subteacher{}
\def\buaa@subteachereng{}
\newcommand{\subteacher}[2]{%
    \def\buaa@subteacher{#1}
    \def\buaa@subteachereng{#2}
}
% 分类号
\def\buaa@category{}
\newcommand{\category}[1]{%
    \def\buaa@category{#1}
}
% 论文开始时间
\def\buaa@thesisbeginyear{}
\def\buaa@thesisbeginmonth{}
\def\buaa@thesisbeginday{}
\newcommand{\thesisbegin}[3]{%
    \def\buaa@thesisbeginyear{#1}
    \def\buaa@thesisbeginmonth{#2}
    \def\buaa@thesisbeginday{#3}
}
% 论文结束时间
\def\buaa@thesisendyear{2021}
\def\buaa@thesisendmonth{3}
\def\buaa@thesisendday{5}
\newcommand{\thesisend}[3]{%
    \def\buaa@thesisendyear{#1}
    \def\buaa@thesisendmonth{#2}
    \def\buaa@thesisendday{#3}
}
% 答辩时间
\def\buaa@defenseyear{}
\def\buaa@defensemonth{}
\def\buaa@defenseday{}
\newcommand{\defense}[3]{%
    \def\buaa@defenseyear{#1}
    \def\buaa@defensemonth{#2}
    \def\buaa@defenseday{#3}
}
% 中文摘要关键字
\def\buaa@ckeyword{}
\newcommand{\ckeyword}[1]{%
    \def\buaa@ckeyword{#1}}
% 英文摘要关键字
\def\buaa@ekeyword{}
\newcommand{\ekeyword}[1]{%
    \def\buaa@ekeyword{#1}}
% 学位
\def\buaa@degree{} % 中文首页和题名页
\def\buaa@degreeeng{} % 英文首页
\def\buaa@headdegree{} % 页眉页脚
\newcommand{\degree}[3]{%
    \def\buaa@degree{#1}
    \def\buaa@degreeeng{#2}
    \def\buaa@headdegree{#3}
}
\degree{学士学位}{Bachelor}{学士}


%%%%%%%%%% bachelor user info %%%%%%%%%%
% 本科生信息

% 班级
\def\buaa@class{}
\newcommand{\class}[1]{%
    \def\buaa@class{#1}
}
% 单位代码
\def\buaa@unicode{1006}
\newcommand{\unicode}[1]{%
    \def\buaa@unicode{#1}
}
% 学号
\def\buaa@studentID{}
\newcommand{\studentID}[1]{%
    \def\buaa@studentID{#1}
}
% 论文时间
\def\buaa@thesisdateyear{}
\def\buaa@thesisdatemonth{}
\newcommand{\thesisdate}[2]{%
    \def\buaa@thesisdateyear{#1}
    \def\buaa@thesisdatemonth{#2}
}

%%%%% 'buaathesis.cls' %%%%% END
