\NeedsTeXFormat{LaTeX2e}
%\@obsoletefile{book.cls}{book.sty}
\LoadClass[a4paper,12pt,fleqn]{book}

%% Use of A4 size paper with a 12pt font ensures a proper size in the reduced B5 size of
%% the pages in the thesis. (Info from Ponsen&Looijen)

%% Package with definitions for thesis.
%% Usage: \documentclass[]{thesis}
%% The package is intended to work with the book class. (see \LoadClass command above)!!!
%% It redefines some commands of the book class to get a different look.

%% Known limitations:
%% The chapter title in the backmatter and frontmatter section are typeset in a 0.8\textwidth wide parbox

%% Michiel de Dood - started Februari 2000 and later (many additions)

%% Summary of features added and/or changed
%% Date indicates when the last change has occured (most dates are estimated...)
%% 0 --> Automatically load required packages with options [24/09/2001]
%%       Added babel package with USenglish and dutch options to hyphenate dutch correctly... [01/12/2001]
%% 1/2-> Set the page size to 24x15 cm; this gives a final page size of 12x19.5 cm [18/10/2001]
%% 1 --> Fancy headers using the fancyhdr package [01/02/2000]
%%       Fancy headers for mainmatter are different than front and backmatter headers [25/12/2001]
%% 2 --> New abstract environment to give a short intro at beginning of the chapter [01/07/2001]
%% 3 --> Redefinition of the chapter command [01/07/2001]
%%   --> Chapter command compatible with \mainmatter and \backmatter [25/12/2001]
%% 4 --> Introduced standard figure width \figwidth [01/07/2001] and caption width \capwidth [12/10/2001]
%% 5 --> Bibliography name changed to References [01/08/2001]
%%       Does not work properly; Minor bug fix [18/01/2002]
%% 6 --> Titlepage modification to remove the date usually displayed [01/08/2001]
%% 7 --> Part command; consistent with the Chapter style.... [01/09/2001]
%% 8 --> Appearance of footnotes changed [24/09/2001]
%% 9 --> Remove dots in TOC. Thanks to the tocloft documentation! [10/11/2001]
%% 10 -> Extra table formatting added; array package + \extrarowheight defined [01/12/2001]
%% 11 -> Fix \backmatter command [01/03/2002]

\ProvidesPackage{thesis}

%% 0 --> Automatically load required packages with options
%%
\RequirePackage[bf,small]{caption}
%%
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}                               %% Fancy header definition
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}                                %% Special AMS symbols
%%\RequirePackage{times}                                  %% Font selection
%\RequirePackage{gr-ubtimes}
\RequirePackage[square,comma,sort&compress,numbers]{natbib}     %% Citation package
%%\RequirePackage[super]{natbib}    %% Citation package
\RequirePackage{calc}
\RequirePackage{epigraph}
\RequirePackage{array}                                  %% Extra's for formatting tables
\RequirePackage{comment}
\RequirePackage{subfigure}
\RequirePackage{losymbol}
\RequirePackage{losnotations}
\RequirePackage{multicol}
\RequirePackage[greek,english]{babel}

\setlength{\parskip}{0.05in}

\def\@thesistitlelineone{Photography Style Analysis}
\def\@thesistitlelinetwo{using Machine Learning}
\def\@thesistitle{\@thesistitlelineone{ }\@thesistitlelinetwo}
\def\@thesistitlesub{a dissertation}
\def\@thesisauthor{Stavros Niafas}

\def\@university{UNIVERSITY OF THE PELOPONNESE \& NCSR ``DEMOKRITOS"}
\def\@faculty{}
\def\@department{MSC PROGRAMME IN DATA SCIENCE}

\def\@universitylc{University of the Peloponnese \& NCSR ``Demokritos"}
\def\@facultylc{}
\def\@departmentlc{MSc. Programme in Data Science}

\def\@thesisplace{Athens}
\def\@thesismonth{10}
\def\@thesisyear{2021}

\def\@thesissupervisor{Theodoros Giannakopoulos}%------------supervisor 
\def\@thesissupervisortitle{Researcher B}
\def\@thesissupervisorinst{NCSR ``Demokritos"}

\def\@thesiscosupervisorone{Evaggelos Spyrou}%------------co-supervisor
\def\@thesiscosupervisoronetitle{Associate Researcher}
\def\@thesiscosupervisoroneinst{NCSR ``Demokritos"}

%\def\@thesiscosupervisortwo{Co-Supervisor2 name}%------------co-supervisor
%\def\@thesiscosupervisortwotitle{Co-Supervisor2 title}
%\def\@thesiscosupervisortwoinst{Co-Supervisor2 institute}


\def\@thesiscommitieone{Theodoros Giannakopoulos}%------------3melhs
\def\@thesiscommitieonetitle{Researcher B}
\def\@thesiscommitieoneinst{NCSR ``Demokritos"}

\def\@thesiscommitietwo{Christos Tryfonopoulos}%------------3melhs
\def\@thesiscommitietwotitle{Associate professor}
\def\@thesiscommitietwoinst{University of Peloponnese}

\def\@thesiscommitiethree{Charilaos Akasiadis}%------------3melhs
\def\@thesiscommitiethreetitle{Post doctoral Researcher}
\def\@thesiscommitiethreeinst{NCSR ``Demokritos"}


%% 1/2-> Pagesize commands to define a pagesize of 24x15 cm
\setlength{\textwidth}{150mm}
\setlength{\textheight}{240mm}

%% This seems easy; but what about margins, headers etc.? Use the calc package to center
%% the page on the paper...
\setlength{\oddsidemargin}{(\paperwidth-\textwidth)/2-1in}
\setlength{\evensidemargin}{(\paperwidth-\textwidth)/2-1in}
\setlength{\headsep}{1cm}
%%\setlength{\footnotesep}{1pt}
%%\setlength{\skip\footins}{0pt}
\setlength{\topmargin}{(\paperheight-\textheight-\headheight-\headsep-\footskip)/2-1in}

%% 1 --> Fancy headers using the fancyhdr package
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\if@mainmatter
                                \markboth{Chapter \thechapter}{} \markright{#1}
                               \else
                                \markboth{#1}{#1}
                               \fi}
\renewcommand{\sectionmark}[1]{}
%%\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}


\fancyhead{}
\renewcommand\headrulewidth{.2pt}
%\fancyhf{}
\fancyfoot[CE,CO]{}
%\fancyhead[LO,RE]{\footnotesize\sffamily{\@thesisauthor}} %\textbf{\thepage}
\fancyhead[RO]{\textbf{\footnotesize\sffamily\leftmark}} %\textsc{\rightmark}
\fancyhead[LE]{\textbf{\footnotesize\sffamily\rightmark}}
\fancyfoot[LE,RO]{\textbf{\footnotesize\sffamily-~\thepage~-}}
\renewcommand{\headrulewidth}{.5pt}
\renewcommand{\footrulewidth}{.5pt}
\addtolength{\headheight}{2.5pt}
\fancypagestyle{plain}{%
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
}

\def\mytitle{%
    \begin{center}
     \Large\textbf{\@thesistitlelineone\\[-0.3cm]
     \@thesistitlelinetwo}\\
     \@thesistitlesub\\
     \large by\\
     \Large\@thesisauthor\\
    \end{center}
    \vfill 
    \begin{center}
     \large A thesis submitted in partial fulfillment\\[-0.3cm]
     of the requirements for the MSc\\[-0.3cm]
     in Data Science
    \end{center}
    \normalsize
}

\def\mysupervisors{%
     %\begin{center}
        \large
        
        \begin{tabbing}
            \hspace{0.3cm}
                {\textbf{Supervisor:}} \=\hspace{27pt}\@thesissupervisor\\[-0.3cm]
                \>\hspace{27pt}\@thesissupervisortitle
            \\
            \hspace{0.3cm}
                {\textbf{Co-supervisors:}} \=\@thesiscosupervisorone \\[-0.3cm] %\@thesiscosupervisortwo
                \>\@thesiscosupervisoronetitle % \@thesiscosupervisortwotitle
        \end{tabbing}
     %\end{center}
    \vspace{0.2cm}
    \normalsize
}

\def\mysignatures{%
    \begin{center}
        Approved by the examination committee on \@thesismonth, \@thesisyear.\\[11pt]
        \begin{tabular}{ccc}	
         	(Signature) & (Signature) & (Signature) \\[1.0cm]
            \dotfill & \dotfill & \dotfill \\
         	~\@thesiscommitieone~ &  ~\@thesiscommitietwo~ & ~\@thesiscommitiethree~ \\[-0.3cm]
     		~\@thesiscommitieonetitle~ &  ~\@thesiscommitietwotitle~ & ~\@thesiscommitiethreetitle~ 
        \end{tabular}
    \end{center}
    \normalsize
}
 
 
\def\myuniversitybanner{%
    \null
    \vspace{-1.6cm}
    \begin{minipage}{2cm}
    \hspace{-0.5cm}
        \includegraphics[width=\textwidth]{figures/dpms-logo.jpg}
    \end{minipage}
    \hspace{-0.2cm} % your specified distance
    \begin{minipage}[c]{14.35cm}
    
    \begingroup
        \let\center\flushright
        
        \let\endcenter\endflushright
             \small
             \@university\\[-0.1cm]
             %\@faculty\\[-0.1cm]
             \@department
    \endgroup
    \hspace{2.1cm} % your specified distance
    \hfill
    \end{minipage}
    \normalsize
 }
 
 \def\myplacedate{%
      \begin{center}\@thesisplace, \@thesismonth{} \@thesisyear\end{center}
 }
 
 
%%--------------------------------
%%    MY COPYRIGHT PAGE
%%--------------------------------
\def\makemycopyrightpage{%
     \mbox{}
     \vspace{\fill}
     \\
     \@thesistitle\\
     \@thesisauthor\\
     MSc. Thesis, \@departmentlc\\
     \@universitylc, \@thesismonth~\@thesisyear\\
     Copyright~$\copyright$~\@thesisyear~\@thesisauthor. All Rights Reserved.\\
     \newpage
}
 
 
%%--------------------------------
%%    MY DECLARATION PAGE
%%--------------------------------
\def\makemydeclarationpage{%
    \cleardoublepage
    \clearpage
    
    \myuniversitybanner{}
    
    \vfill
    
    \begin{center}
        \Large{{\textbf{\textsf{Declaration of Authorship}}}}
    \end{center}
    \normalsize
    \begin{enumerate}[(1)]
    
    \item I declare that this thesis has been composed solely by myself and that it has not been submitted, in whole or in part, in any previous application for a degree. Except where states otherwise by reference or acknowledgment, the work presented is entirely my own.
    \item I confirm that this thesis presented for the degree of Master of Science in Informatics and Telecommunications, has
        \begin{enumerate}[(i)]
            \item\par been composed entirely by myself
            \item\par been solely the result of my own work
            \item\par not been submitted for any other degree or professional qualification
        \end{enumerate}
    \item I declare that this thesis was composed by myself, that the work contained herein is my own except where explicitly stated otherwise in the text, and that this work has not been submitted for any other degree or processional qualification except as specified.
    \end{enumerate}
    
    \vfill 
    
    \begin{tabular}{c}
        (Signature)\\[1.0cm]
        \dotfill\\
        \@thesisauthor
    \end{tabular}
    
    \vfill 
    
    \myplacedate{}
    
    \newpage
}

%%--------------------------------
%%    MY TITLE PAGE
%%--------------------------------
\def\titlepage{
    \cleardoublepage
    \clearpage
    
    \myuniversitybanner{} 
    
    \vfill 
    \vfill 
    
    \mytitle{}
    
    \vfill
    \vfill
    
    \mysupervisors{}
    
    \vfill
    
    \myplacedate{}
    
    \newpage
}

%%--------------------------------
%%    SIGNATURES PAGE
%%--------------------------------
\def\makemysignaturespage{%
    \cleardoublepage
    \clearpage
    
    \myuniversitybanner{} 
    
    \vfill 
    
    \mytitle{}
    
    \vfill
    
    \mysupervisors{}
    
    \vfill
    
    \mysignatures{}

    \vfill
    
    \myplacedate{}
    
    \newpage
}

% Define format for frontmatter in table of contents


\def\l@frontmatter{\@dottedtocline{0}{0em}{2.3em}}


\def\prefacesection#1{%
    \chapter*{#1}
    \addcontentsline{toc}{frontmatter}{#1}}

\def\afterpreface{\cleardoublepage 
%%  \thispagestyle{plain}
    \pagenumbering{roman}
%%  \setcounter{page}{1}
    \tableofcontents
%%  \thispagestyle{plain}
    \newpage
    \thispagestyle{plain}
    \addcontentsline{toc}{frontmatter}{List of Tables}
        {\addvspace{10pt}
        \let\saveaddvspace\addvspace
        \renewcommand{\addvspace}[1]{}
        \listoftables
        \let\addvspace\saveaddvspace}
        \newpage
        \thispagestyle{plain}
    \addcontentsline{toc}{frontmatter}{List of Figures}
        {\addvspace{10pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}
        \listoffigures
        \let\addvspace=\saveaddvspace}
        \newpage
        \thispagestyle{plain}
%%    \addcontentsline{toc}{frontmatter}{List of Symbols}
%%        {\addvspace{10pt}
%%        \let\saveaddvspace=\addvspace
%%        \def\addvspace##1{}
%%        \listofsymbols
%%        \let\addvspace=\saveaddvspace}
%%        \newpage
%%        \thispagestyle{plain}
    \addcontentsline{toc}{frontmatter}{List of Abbreviations}
        {
        \addvspace{10pt}
        \let\saveaddvspace=\addvspace
        \def\addvspace##1{}
        \listofnotations
        \let\addvspace=\saveaddvspace
        }
        \newpage
    
    \cleardoublepage
    \pagenumbering{arabic}

        \renewcommand{\chaptermark}[1]{\markboth{\chaptername\ \thechapter\ : ##1}{}}
        \renewcommand{\sectionmark}[1]{\markright{\thesection\ : ##1}}
        
}
\font\bigfancy=cmbx10 scaled 4300 % magstep3
\def\fancypar#1#2{{\noindent
    \setbox0\hbox{\bigfancy #1}\setbox1\hbox{#2}\setbox2\hbox{(}%
    \count0=\ht0\advance\count0 by\dp0\count1\baselineskip
    \advance\count0 by-\ht1\advance\count0by\ht2
    \dimen1=.5ex\advance\count0by\dimen1\divide\count0 by\count1
    \advance\count0 by1\dimen0\wd0
    \advance\dimen0 by.25em\dimen1=\ht0\advance\dimen1 by-\ht1
    \global\hangindent\dimen0\global\hangafter-\count0
    \hskip-\dimen0\setbox0\hbox to\dimen0{\raise-\dimen1\box0\hss}%
    \dp0=0in\ht0=0in\box0}#2}

%% 2 --> New abstract environment to give a short intro at beginning of the chapter

%%%%\newenvironment{abstract}{\vfill\sl}{}{\clearpage}

%% 3 --> Redefinition of the chapter command
%% Changes the appearance of headers and layout of the starting page of each chapter

%%\renewcommand\chapter{\if@openright\clearpage\thispagestyle{empty}\cleardoublepage\else\clearpage\fi
%%                    \thispagestyle{empty}%
%%                    \global\@topnum\z@
%%                    \@afterindentfalse
%%                    \secdef\@chapter\@schapter}
%%\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
%%                       \if@mainmatter
%%                         \refstepcounter{chapter}%
%%                         \typeout{\@chapapp\space\thechapter.}%
%%                         \addcontentsline{toc}{chapter}%
%%                                   {\protect\numberline{\thechapter}#2}%
%%                       \else
%%                         \addcontentsline{toc}{chapter}{#2}%
%%                       \fi
%%                    \else
%%                      \addcontentsline{toc}{chapter}{#2}%
%%                    \fi
%%                    \chaptermark{#1}%
%%                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%%                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
%%                    \if@twocolumn
%%                      \@topnewpage[\@makechapterhead{#2}]%
%%                    \else
%%                      \@makechapterhead{#2}%
%%                      \@afterheading
%%                    \fi}
%%\def\@makechapterhead#1{%
%%  \vspace*{50\p@}%
%%  {\parindent \z@ \normalfont
%%    \ifnum \c@secnumdepth >\m@ne
%%      \if@mainmatter
%%        \begin{center}\Huge\bfseries \setlength{\fboxsep}{1em} \framebox[3em][c]{\thechapter}\end{center}%
%%        \vspace*{50\p@}%
%%        \begin{center}\LARGE\bfseries \parbox{0.8\textwidth}{\center #1} \end{center}\par\nobreak \vskip 40\p@
%%      \else
%%         \LARGE\bfseries #1\par\nobreak \vskip 40\p@
%%      \fi
%%    \fi
%%  }}
%%\def\@schapter#1{\if@twocolumn
%%                   \@topnewpage[\@makeschapterhead{#1}]%
%%                 \else
%%                   \@makeschapterhead{#1}%
%%                   \@afterheading
%%                 \fi}
%%\def\@makeschapterhead#1{%
%%  \vspace*{50\p@}%
%%  {\parindent \z@ \raggedright
%%    \normalfont
%%    \interlinepenalty\@M
%%    \LARGE \bfseries #1\par\nobreak
%%    \vskip 40\p@
%%  }}

%% End of \chapter command

%% 4 --> Introduced standard figure width \figwidth and captionwidth \capwidth
%% Figures, tables and equations

\newlength\figwidth
\setlength\figwidth{0.8\textwidth}

\newlength\capwidth
\setlength\capwidth{0.95\textwidth}

%% 5 --> Bibliography name changed to References

%% Small caps References as labels for page headers
%% added \itemsep command to adjust vertical space between references
%% IMPORTANT NOTE: The references consist of one big list with many \bibitems...
%% VERY IMPORTANT: \def\bibname should be within the thebibliography environment.
%%                 It seems to be defined elsewhere as well (BibTeX?)

\newdimen\bibindent
\setlength\bibindent{1.5em}
\renewenvironment{thebibliography}[1]
    {\def\bibname{References}
    \chapter*{\bibname
       \@mkboth{\textsc\bibname}{\textsc\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\itemsep 0em
            \settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%% 6 --> Titlepage modification to remove the date usually displayed

\if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\Huge \@title \par}%
%%    \vskip 3em%
%%    {\large
%%     \lineskip .75em%
%%      \begin{tabular}[t]{c}%
%%        \@author
%%      \end{tabular}\par}%
%%      \vskip 1.5em%
%%    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

%% 7 --> Part command; consistent with the Chapter style....

\renewcommand\part{%
  \if@openright
    \clearpage\thispagestyle{empty}\cleardoublepage\thispagestyle{empty}
  \else
    \clearpage\thispagestyle{empty}
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{Part~\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}

%% 8 --> Appearance of footnotes changed [24/09/2001]

%%\renewcommand{\thefootnote}{\fnsymbol{footnote}}

%% 9 --> Remove dots in TOC [24/10/2001] Thanks to the tocloft documentation! [10/11/2001]

\renewcommand{\@dotsep}{10000} %% Default value is 4.5

%% 10 -> Extra table formatting added; array package + \extrarowheight defined [01/12/2001]

\setlength{\extrarowheight}{2pt}

%% 11 -> Fix \backmatter command [01/03/2002]

\renewcommand\backmatter{%
  \if@openright\clearpage\thispagestyle{empty}\cleardoublepage
  \else\clearpage
  \fi
  \thispagestyle{empty}%
  \@mainmatterfalse}
  
\makeatletter
\newlength{\mySpaceUnder}
\newlength{\mySpaceOver}
\setlength{\mySpaceUnder}{0.1in}  % 4cm as an example ;-)
\setlength{\mySpaceOver}{0.05in}   % 3cm as an example
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {\mySpaceOver}%
                                   {\mySpaceUnder}%
                                   {\normalfont\Large\bfseries}}
\makeatother

\endinput
