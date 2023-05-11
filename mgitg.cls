%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%	Este .cls esta basado en el mdpi.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mgitg}[04/07/2019]

%%%% Copyright and citebox
%\AtEndDocument{\par \cright}

%% PRELIMINARY DECLARATIONS
\LoadClass[11pt,letterpaper]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}

%\RequirePackage{calc}
%\RequirePackage{indentfirst}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
%\RequirePackage{lineno}
\RequirePackage{float}
%\RequirePackage{amsmath}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{booktabs} % For \toprule etc. in tables
\RequirePackage[largestsep]{titlesec}
\RequirePackage{etoolbox} % For \AtBeginDocument etc.
\RequirePackage{tabto} % To use tab for alignment on first page
\RequirePackage{totcount} % To enable extracting the value of the counter "page"
 
    
\DeclareOption{artMGITG}{%
    \gdef\@journal{remotesensing}%
    \gdef\@journalshort{Cuaderno de la Maestría en Gestión de la Información y Tecnologías Geoespaciales.}%
    \gdef\@journalfull{Remote Sensing}%
    \gdef\@doiabbr{rs}%
    \gdef\@ISSN{2072-4292}%
    }
%-- SELECCIÓN DE LAS FUENTES  ---------------    
\DeclareOption{font0}{\AtEndOfClass{\RequirePackage{mathpazo}}}%http://www.icl.utk.edu/~mgates3/docs/latex-fonts.pdf
\DeclareOption{font1}{%
	\AtEndOfClass{%
		\RequirePackage[lf]{Baskervaldx} % lining figures
		\RequirePackage[bigdelims,vvarbb]{newtxmath} % math italic letters from Nimbus Roman
		\RequirePackage[cal=boondoxo]{mathalfa} % mathcal from STIX, unslanted a bit
		\renewcommand*\oldstylenums[1]{\textosf{#1}}
		}
	}
\DeclareOption{font2}{\AtEndOfClass{\RequirePackage{bookman}}}
\DeclareOption{font3}{\AtEndOfClass{\RequirePackage{charter}}}
\DeclareOption{font4}{\AtEndOfClass{\RequirePackage{fourier}}}
    
    %% ESCOGER EL TIPO DE LINEA DE INVESTIGACIÃN
    \DeclareOption{SIG}{\gdef\@arttype{Sistemas de Información Geográf{i}ca (SIG) }}
    \DeclareOption{IDE}{\gdef\@arttype{Infraestructura de Datos Espaciales (IDE)}}
    \DeclareOption{PR}{\gdef\@arttype{Percepción Remota (PR)}}

    
    %% To choose the status of the manuscript
    % \DeclareOption{submit}{\gdef\@status{submit}}
    \DeclareOption{accept}{\gdef\@status{accept}}
    
    %% To choose the whether there is one or more authors
    % \DeclareOption{oneauthor}{\gdef\@authornum{author}}
    \DeclareOption{moreauthors}{\gdef\@authornum{authors}}
    
    %% Add the chosen options to the class
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
    
    %% Defaults
    % \ExecuteOptions{notspecified,10pt,a4paper,article,submit,oneauthor}
    
    %% Process options
    \ProcessOptions\relax
    
    %% MORE DECLARATIONS
    \newcounter{codigo}
    \setcounter{codigo}{0}
    % \newtheorem{Listing}[listing]{Listing}
    \newtheorem{codigo}[codigo]{Codigo}%
    
    %LISTINGS
    \RequirePackage{listings}
    %--------------------------------
    \definecolor{codegreen}{rgb}{0,0.6,0}
    \definecolor{codegray}{rgb}{0.5,0.5,0.5}
    \definecolor{codepurple}{rgb}{0.58,0,0.82}
    \definecolor{backcolour}{rgb}{0.95,0.95,0.92}

    \renewcommand\lstlistingname{Script}
    
    \lstdefinestyle{estilocodigo}{%
        backgroundcolor=\color{white},%backcolour},
        commentstyle=\color{codegreen},
        keywordstyle=\color{magenta},
        numberstyle=\tiny\color{codegray},
        stringstyle=\color{codepurple},
        basicstyle=\ttfamily\footnotesize,
        breakatwhitespace=false,
        breaklines=true,
        captionpos=t,
        keepspaces=true,
        numbers=none,%left,
        numbersep=5pt,
        showspaces=false,
        showstringspaces=false,
        showtabs=false,
        tabsize=2
    }
    
    \lstset{style=estilocodigo}
%------------------------------------
     
    %%%% Hyphenation
    \RequirePackage[none]{hyphenat}
    \sloppy
    
    %%%% References
    \RequirePackage[sort&compress,sectionbib]{natbib} % option sectionbib is for optionally organizing references using sections (author request)
    
    \ifthenelse{\equal{\@journal}{admsci}
    \OR \equal{\@journal}{arts}
    \OR \equal{\@journal}{econometrics}
    \OR \equal{\@journal}{economies}
    \OR \equal{\@journal}{genealogy}
    \OR \equal{\@journal}{humanities}
    \OR \equal{\@journal}{ijfs}
    \OR \equal{\@journal}{jrfm}
    \OR \equal{\@journal}{languages}
    \OR \equal{\@journal}{laws}
    \OR \equal{\@journal}{religions}
    \OR \equal{\@journal}{risks}
    \OR \equal{\@journal}{socsci}}{%
    	\bibliographystyle{chicago2}
    	\bibpunct{(}{)}{;}{x}{}{}%
    	}{%
    	\bibliographystyle{mdpi}
    	\bibpunct{[}{]}{,}{n}{}{,}%
    	}%
    
        
    %%%%% Hyperlinks
    %% Define color for citations
    %\definecolor{bluecite}{HTML}{0875b7}
    \definecolor{azulado1}{HTML}{16181C}%054973}
\RequirePackage[unicode=true,bookmarksopen={true},pdffitwindow=true,colorlinks=true,linkcolor=azulado1,citecolor=azulado1,urlcolor=azulado1,hyperfootnotes=false,pdfstartview={FitH},pdfpagemode= UseNone]{hyperref}
    
    %% To have the possibility to change the urlcolor
    \newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}} 
    
    % %% Metadata
    \newcommand{\org@maketitle}{}% LATEX-Check
    \let\org@maketitle\maketitle
    \def\maketitle{%
    	\hypersetup{
    		pdftitle={\@Title},
    		pdfsubject={\@abstract},
    		pdfkeywords={\@keyword},
    		pdfauthor={\@AuthorNames}
    		}%
    	\org@maketitle
    }
    
    %%%% Footnotes
    \RequirePackage[hang]{footmisc}
    \setlength{\skip\footins}{1.2cm}
    \setlength{\footnotemargin}{5mm}
    \def\footnoterule{\kern-14\p@
    \hrule \@width 2in \kern 11.6\p@}
    
    %%%% URL
    \RequirePackage{url}
    \urlstyle{same}
    \g@addto@macro{\UrlBreaks}{\UrlOrds} 
    
    %%%% Widows & orphans
    \clubpenalty=10000
    \widowpenalty=10000
    \displaywidowpenalty=10000
    
    %%%% Front matter
    \newcommand{\firstargument}{}
\newcommand{\corresfirstargument}{}

\newcommand{\Title}[1]{\gdef\@Title{#1}}%
\newcommand{\Author}[1]{\gdef\@Author{#1}}%
\def\@AuthorNames{}
\newcommand{\AuthorNames}[1]{\gdef\@AuthorNames{#1}}%
\newcommand{\address}[2][]{\renewcommand{\firstargument}{#1}\gdef\@address{#2}}
\def\@corres{}
\newcommand{\corres}[2][]{\renewcommand{\corresfirstargument}{#1}\gdef\@corres{#2}}

\newcommand{\isbnnum}[1]{\gdef\@isbnnum{#1}}
\newcommand{\pubvolume}[1]{\gdef\@pubvolume{#1}}
\newcommand{\pubyear}[1]{\gdef\@pubyear{#1}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}

\def\@abstract{}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\def\@resumen{}
\newcommand{\resumen}[1]{\gdef\@resumen{#1}}
\def\@keyword{}
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}
\def\@palabrasclave{}
\newcommand{\palabrasclave}[1]{\gdef\@palabrasclave{#1}}

\def\@issuenum{}
\newcommand{\issuenum}[1]{\gdef\@issuenum{#1}}
\newcommand{\articlenumber}[1]{\gdef\@articlenumber{#1}}

\def\@reftitle{}
\newcommand{\reftitle}[1]{\gdef\@reftitle{#1}}
    
    %%%% Journal name for the header
    \newcommand{\journalname}{\@journalshort}
%% The plain page style needs to be redefined because with \maketitle in the article class, LaTeX applies the the plain page style automatically to the first page.
\fancypagestyle{plain}{ %---- Para la primera página
	\fancyhf{}
	\fancyfoot[L]{
		\footnotesize%
 	 	{\em \journalname}\quad %
		Vol. \@pubvolume,\ %
		No. \@articlenumber,\ %
		%{\bfseries \@pubyear}.%, %
		\@pubyear.\ %,
		ISSN: \@isbnnum.
	}%
	\fancyfoot[R]{
	%\footnotesize%
	}%
	\fancyhead{}
	\renewcommand{\headrulewidth}{0.0pt}%
}
    
    %%%% Maketitle part 1: Logo, Arttype, Title, Author
   \renewcommand{\@maketitle}{
\begin{flushleft}
%
\href{https://www.usergioarboleda.edu.co/programas/maestria-en-gestion-la-informacion-tecnologias-geoespaciales/}{\includegraphics[scale=0.6]{Definitions/logo-usa}} 
	\hfill
	\href{https://www.usergioarboleda.edu.co/programas/maestria-en-gestion-la-informacion-tecnologias-geoespaciales/}{\includegraphics[scale=0.6]{Definitions/logo-igac}}

	\vspace{25pt}%-------------------- ESPACIO LUEGO DE LOS LOGOS
	%--------------------- LINEA DE INVESTIGACIÃN
	\textit{\@arttype}
	\par
	\vspace{10pt}
	{\fontsize{18}{18}\selectfont
	\boldmath\bfseries{\@Title}
    \par}
	\vspace{10pt}
	\boldmath\bfseries{\@Author}
	\par
\end{flushleft}%
}
%
%% Commands for hanging indent
\newcommand{\dist}{1.7em}
\newcommand{\hang}{\hangafter=1\hangindent=\dist\noindent}
    
    %%%% Maketitle part 2
    \newcommand{\maketitlen}{
%\ifthenelse{\equal{\@arttype}{linea2}}{\vspace{12pt}}{
	\begin{flushleft}
	\begin{spacing}{1.35}
	\leftskip0.2cm
	\fontsize{9}{9}\selectfont
	{%
	\ifthenelse{\equal{\firstargument}{1}}{}{%
	\hang}\@address
	\par
	}%
	{%
	\ifthenelse{\equal{\@authornum}{author}}{}{%
	\ifthenelse{\equal{\@corres}{\@empty}}{}{%
	\hang\textbf{*} \tabto{\dist} \@corres}
	\par
	}
	}%
	\vspace{-4pt}%
	\end{spacing}
	\end{flushleft}
}
    
    %%%% Abstract, keywords
   \newcommand{\abstractkeywords}{
	\vspace{-8pt}
	\begingroup %%---------------ABSTRACT
		\leftskip0.25cm
		\rightskip0.25cm
		\ifthenelse{\equal{\@abstract}{\@empty}}{}{
			\hrule
			\vspace{10pt}
			\fontsize{9}{9}\selectfont
			\noindent\textbf{Abstract:\space}\textit{\@abstract}
			\vspace{12pt}
			\par
		}
	\endgroup

	\begingroup %%------------------ KEYWORDS
		\leftskip0.25cm
		\rightskip0.25cm
		\ifthenelse{\equal{\@keyword}{\@empty}}{}{
			\fontsize{9}{9}\selectfont
			\noindent\textbf{Keywords:\space}\textit{\@keyword}
			\vspace{4pt}
			\par
% 			\hrule
		}
	\endgroup
	
	\begingroup %%%------------- RESUMEN EN ESPAÑOL -------------
		\leftskip0.25cm
		\rightskip0.25cm
		\ifthenelse{\equal{\@resumen}{\@empty}}{}{
			\hrule
			\vspace{10pt}
			\fontsize{9}{9}\selectfont
			\noindent\textbf{Resumen:\space}\textit{\@resumen}
			\vspace{12pt}
			\par
		}
	\endgroup

	\begingroup %%--------- PALABRAS CLAVE EN ESPAÑOL
		\leftskip0.25cm
		\rightskip0.25cm
		\ifthenelse{\equal{\@palabrasclave}{\@empty}}{}{
			\fontsize{9}{9}\selectfont
			\noindent\textbf{Palabras clave:\space}\textit{\@palabrasclave}
			\vspace{4pt}
			\par
		}
	\endgroup
	\hrule
	\vspace{6pt}
}   
    %%%% Print maketitle and abstractkeywords
 \AfterEndPreamble{
	\maketitle
	\let\maketitle\relax
	\maketitlen
	\let\maketitlen\relax
	\abstractkeywords
}
    \AtBeginDocument{
    	\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
    	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}
    	}
    
    %%%% Font size in Tables
    \AtEndPreamble{
    	\def\@tablesize{}
    	\newcommand{\tablesize}[1]{\gdef\@tablesize{#1}}
    	\let\oldtabular\tabular
    	\renewcommand{\tabular}{\ifthenelse{\equal{\@tablesize}{\@empty}}{\small}{\@tablesize}\oldtabular}
    }
    
    %%%% Section headings
    \setcounter{secnumdepth}{4} %i.e., section numbering depth, which defaults to 3 in the article class. To get paragraphs numbered and counted, increase the default value of secnumdepth to 4
    
    \titleformat {\section} [block] {\raggedright \fontsize{12}{12}\selectfont\bfseries} {\thesection.\space} {0pt} {}
    \titlespacing {\section} {0pt} {15pt} {10pt}%{0pt} {12pt} {6pt}
    
    % \titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {\thesubsection.\space} {0pt} {}
    % \titlespacing {\subsection} {0pt} {12pt} {6pt}
    \titleformat {\subsection} [block] {\raggedright \fontsize{11}{11}\selectfont} {\thesubsection.\space} {0pt} {}
    \titlespacing {\subsection} {0pt} {15pt} {10pt}%{0pt} {12pt} {6pt}
    
    \titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {\thesubsubsection.\space} {0pt} {}
    \titlespacing {\subsubsection} {0pt} {15pt} {10pt}%{0pt} {12pt} {6pt}
    
    \titleformat {\paragraph} [block] {\raggedright \fontsize{10}{10}\selectfont} {} {0pt} {}
    \titlespacing {\paragraph} {0pt} {15pt} {10pt}%{0pt} {12pt} {6pt}
    
    \newcommand{\acknowledgments}[1]{
    \vspace{6pt}\noindent{\fontsize{10}{10}\selectfont\textbf{Agradecimientos:} {#1}\par}}
    
    \newcommand{\funding}[1]{
    \vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Funding:} {#1}\par}}
    
    %%%%% Defines the appendix
    \renewcommand{\appendixname}{Apéndice}
    \def\@appendixtitles{}
    \newcommand{\appendixtitles}[1]{\gdef\@appendixtitles{#1}}

    \def\@appendixsections{}
    \newcommand{\appendixsections}[1]{\gdef\@appendixsections{#1}}

    \renewcommand{\appendix}{%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    %
    \gdef\thesection{\@Alph\c@section}%
    \gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
    %
    \titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {%
    	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
    		\appendixname~\thesection.%
    		}{%
    		\appendixname~\thesection~%
    		}
    	} {0pt} {}
    \titlespacing {\section} {0pt} {12pt} {6pt}
    %
    \titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {%
    	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
    		\appendixname~\thesubsection.%
    		}{%
    		\appendixname~\thesubsection%
    		}
    	} {0pt} {}
    \titlespacing {\subsection} {0pt} {12pt} {6pt}
    %
    \titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {%
    	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
    		\appendixname~\thesubsubsection.%
    		}{%
    		\appendixname~\thesubsubsection%
    		}
    	} {0pt} {}
    \titlespacing {\subsubsection} {0pt} {12pt} {6pt}
    %
    \gdef\theHsection{\@Alph\c@section.}% for hyperref
    \gdef\theHsubsection{\@Alph\c@section.\@arabic\c@subsection}% for hyperref
    \csname appendixmore\endcsname
    
    \renewcommand{\thefigure}{A\arabic{figure}}
    \setcounter{figure}{0}
    \renewcommand{\thetable}{A\arabic{table}}
    \setcounter{table}{0}
    \renewcommand{\theequation}{A\arabic{equation}}
    \setcounter{equation}{0}
    
    \renewcommand{\thelstlisting}{A\arabic{lstlisting}}
    \setcounter{lstlisting}{0}
    
    \renewcommand{\thecodigo}{A\arabic{codigo}}
    \setcounter{codigo}{0}
    
    }
    
    %%%% Layout
    \RequirePackage[left=2.5cm,right=1.5cm,top=1.5cm,bottom=1.5cm,includehead,includefoot]{geometry}%paperwidth=170mm,%paperheight=244mm,
    
    \linespread{1.15} 
    \setlength{\parindent}{0.75cm}
    
    %%%% Figures and tables
    \renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{Tabla}
    
    \RequirePackage{caption} 
    \captionsetup[figure]{position=bottom, margin=1.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, justification=justified}
    
    \captionsetup[lstlisting]{position=top, margin=1.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17},  aboveskip=6pt, justification=justified}
    
    \captionsetup[table]{position=top, margin=2.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, justification=justified}
    
    
    
    %% For table footnotes
    \newsavebox{\@justcentbox}
    \newcommand{\justifyorcenter}[1]{
    \sbox \@justcentbox{#1}
    \ifdim \wd \@justcentbox >\hsize #1
    \else \centerline{#1} \fi
    }
    
    %%%% Bullet lists
    \newlength{\wideitemsep}
    \setlength{\wideitemsep}{.5\itemsep}
    \addtolength{\wideitemsep}{-7pt}
    \let\olditem\item
    \renewcommand{\item}{\setlength{\itemsep}{\wideitemsep}\olditem}
    
    %%%% Header and footer (all pages except the first)
    \renewcommand\headrule{} %% set line (from fancyhdr) in header to nothing
\pagestyle{fancy}
\lhead{
	\footnotesize%\fontsize{8}{8}\selectfont%
	\textit{\journalname}\ \  %
	{Vol. \@pubvolume},\ %
	{No. \@articlenumber},\ %
	{\@pubyear}. 
}

\rhead{%
	\footnotesize%\fontsize{8}{8}\selectfont\thepage%{}/\pageref*{LastPage}%
}

\cfoot{
	{}
}
    
    
    %%%% Bibliography
    \renewcommand\bibname{References} % Backwards compatibility for book production
    \renewcommand\@biblabel[1]{#1.\hfill}
    \def\thebibliography#1{
    \linespread{1.44} 
    \section*{\@reftitle}
    \addcontentsline{toc}{section}{References}
    \fontsize{9}{9}\selectfont
    \list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1}}
    \topsep=0\p@
    \parsep=5\p@
    \partopsep=0\p@
    \itemsep=0\p@
    \labelsep=1.5mm
    \ifthenelse{\equal{\@journal}{admsci}
    \OR \equal{\@journal}{arts}
    \OR \equal{\@journal}{econometrics}
    \OR \equal{\@journal}{economies}
    \OR \equal{\@journal}{genealogy}
    \OR \equal{\@journal}{humanities}
    \OR \equal{\@journal}{ijfs}
    \OR \equal{\@journal}{jrfm}
    \OR \equal{\@journal}{languages}
    \OR \equal{\@journal}{laws}
    \OR \equal{\@journal}{religions}
    \OR \equal{\@journal}{risks}
    \OR \equal{\@journal}{socsci}}{%
    	\ifthenelse{\equal{\@externalbibliography}{\@empty}}{%
    		\itemindent=-7.7mm
    		}{%
    		\itemindent=-3.3mm}%
    		}{%
    	\itemindent=0\p@}
    \settowidth\labelwidth{\footnotesize[#1]}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    %\advance\leftmargin -\itemindent
    \usecounter{enumi}}
    %\def\newblock{\ }
    %\sloppy\clubpenalty4000\widowpenalty4000
    %\sfcode`\.=1000\relax
    }
    \let\endthebibliography=\endlist
    
    %%%% Copyright info
    \newcommand{\cright}{%
            \ifthenelse{\equal{\@arttype}{Supfile} \OR \equal{\@journal}{preprints}}{%
    		}{%
    		\vspace{12pt}
    		\noindent
    		\linespread{1.44} 
    		\fontsize{9}{9}\selectfont 
    		\ifthenelse{\equal{\@status}{submit}}{
    			\noindent \copyright{} {\@ \the\year} by the \@authornum. %
    			Submitted to {\em \journalname} for %
    			possible open access publication %
    			under the terms and conditions of the Creative Commons Attribution %
    			\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
    			license %
    			\ifthenelse{\equal{\@journal}{ijtpp}}{
    			(\changeurlcolor{black}%
    			\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
    			{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
    			}{%
    			(\changeurlcolor{black}%
    			\href{http://creativecommons.org/licenses/by/4.0/.}%
    			{http://creativecommons.org/licenses/by/4.0/}).}
    			}{
    			\begin{minipage}{.2\textwidth}
    				\hspace{-1.2mm}%
    				\vspace{2mm}%
    				\href{http://creativecommons.org/}{%
    				\ifthenelse{\equal{\@journal}{ijtpp}}{%
    					\includegraphics[width=0.94\textwidth]{Definitions/logo-ccby-nc-nd.eps}%
    					}{%
    					\includegraphics[width=0.94\textwidth]{Definitions/logo-ccby.eps}
    					}
    				}
    			\end{minipage}%
    			\begin{minipage}{.79\textwidth}
    				\copyright \ {\@copyrightyear} by the \@authornum. %
    				Licensee MDPI, Basel, Switzerland. %
    				This article is an open access article %
    				distributed under the terms and conditions %
    				of the Creative Commons Attribution %
    				\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
    				license %
    				\ifthenelse{\equal{\@journal}{ijtpp}}{
    				(\changeurlcolor{black}%
    				\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
    				{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
    				}{%
    				(\changeurlcolor{black}%
    				\href{http://creativecommons.org/licenses/by/4.0/.}%
    				{http://creativecommons.org/licenses/by/4.0/}).}
    				\end{minipage}
    			}
    		}
    	}
    	
    
    \endinput