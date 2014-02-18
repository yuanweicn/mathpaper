%%
%% jaums.cls
%%
%% Class file for the Journal of the Australian Mathematical Society.
%%
%% September 1997	Begun		Greg Lewis
%%	# Heavy modifications on top of the standard article.cls
%%	# Redefines fonts, margins, point sizes, sectioning, title making to
%%	  name but a few.
%%
%% 14 October 1997	Modified	Greg Lewis
%%	# Load amsgen.sty.
%%	# Steal address, author, thanks macros from amsart.cls to be used in
%%	  here.
%%
%% 22 October 1997	Modified	Greg Lewis
%%	# Lots of modifications and additional routines to make the differences
%%	  between Jams B and Jams A work, especially things like the Jams B
%%	  address style (blech).
%%
%% 7 November 1997	Modified	Greg Lewis
%%	# Start of heap big code clean up.
%%
%% 11 November 1997	Modified	Greg Lewis
%%	# More of heap big code clean up.
%%	# Fixed problem with headers and footers not swapping on odd and even
%%	  pages.
%%
%% 14 November 1997	Modified	Greg Lewis
%%	# More code clean up.
%%	# Fixed problem with more than two authors and andify!
%% 	# Fixed problem with \caption*.
%%	# Added theorem environments (syntax is a little different but
%%	  functionality is the same.
%%	# Bumped version to 0.2 as I think all the major functionality is
%%	  present.
%%
%% 18 November 1997	Modified	Greg Lewis
%%	# Made things work when we are not in final mode.
%%	# Added font size altering commands (but they only work when not
%%	  using the "final" (production) option.
%%
%% 2 December 1997	Modified	Greg Lewis
%%	# Font size modifications.  I believe the font size is now spot on for
%%	  the major fonts.  There may need to be some adjustments for some of 
%%	  the extra fonts as yet.
%%	# Fixed the \date command to work with Jams B.
%%	# Fixed the first page header to be correct for Jams B.
%%
%% 3 December 1997	Modified	Greg Lewis
%%	# Adjusted font size in the caption environment to be \footnotesize.
%%      # Adjusted bibliography environment.  References now in \footnotesize
%%	  and spacing around the heading should now match.
%%	# Adjusted table environment to try and get spacing around the caption
%%	  correct.
%%	# Reimplemented the eqnarray environment to try and get its spacing
%%	  correct.
%%      # Added a jamsa option for symmetry.
%%	# Call this Version 0.2a.
%%
%% 16 December 1997	Modified	Greg Lewis
%%	# Loaded jamsxtra, some extra macros from amstex that are no longer in
%%	  the main amslatex stuff.
%%
%% 31 December 1997	Modified	Greg Lewis
%%	# Incremented volumes for A and B.
%%
%% 8 January 1998	Modified	Greg Lewis
%%	# Loaded jamshypr.sty, a hack of hyperref.sty.  This will allow us
%%	  to create links for Distiller to respect.
%%	# Inserted a link for the thingy at the top of the first page to link
%%	  to the cover.
%%
%% 22 April 1998	Modified	Greg Lewis
%%	# Made \parskip non-stretchable so we have short pages instead of 
%%	  spaces between paragraphs where applicable.
%%	# Alterations to the spacings after a subsection's number and after a
%%	  subsection's title.
%%
%% 24 June 1998		Modified	Greg Lewis
%%	# Fixed a missed space in the copyright footnote on the first page for
%%	  Jams A.
%%
%% 19 August 1998	Modified	Greg Lewis
%%	# Fixed missing \newline's at the output of \email, \currentaddress
%%	  and \url.
%%
%% 1 September 1998 	Modified 	Anna Dostovalova
%%	# \theoremheadspace set to the width of an x.
%%
%% 4 September 1998	Modified	Greg Lewis
%%	# Finally found the cause of the 
%%	  (\end occurred inside a group at level 1)
%%	  error that has been there for ages and fixed it!  Not that it
%%	  actually changed the output, but its nice to not have the error
%%	  message anymore.
%%	# Fixed a missing space before the price in the copyright line at the
%%	  bottom of the first page for Jams A.
%%	# \theoremheadspace set to .4em.  I think this is right?  I actually
%%	  thought .5em should be right as it is \labelsep and the old style
%%	  files did things with \trivlist in setting the theorem environment
%%	  layouts.  However, it looks a touch too big and .4em looks right.
%%	# Fixed the spacing between rows in the address table for Jams A.
%%	# Fixed the font size of author names for Jams A.
%%	# Fixed the spacing before the address table for Jams A.
%%	# Fixed the spacing before the abstract for both Jams A and B.
%%
%% 11 September 1998	Modified	Greg Lewis
%%	# Altered how the subject classes and keywords are done for Jams A to
%%	  fix a problem with arguments that went longer than one line getting
%%	  the wrong baselineskip.
%%	# Placed style files under CVS control (prior to the change above).
%%
%% 18 September 1998	Modified	Greg Lewis
%%	# Fixed spacing after a \subsubsection heading.  Previously there
%%	  was none, now there is 1em.
%%
%% 4 October 1998	Modified	Greg Lewis
%%	# Altered the \evensidemargin to match \oddsidemargin (it changes
%%	  from -4mm to -12mm).
%%
%% 20 November 1998	Modified	Greg Lewis
%%	# Fixed up a problem with tables!  New version of LaTeX2e seems a bit
%%	  pickier about the spacing commands I use to get the captionskip
%%        right.
%%
%% 15 December 1998	Modified	Greg Lewis
%%	# Allowed manual setting of the "thelastp@ge" label.  If you do this
%%	  then this label won't be set at the end of the document.
%%	# Added macros to set the first and last page.  They are \ThisIsLastPage
%%        and \ThisIsFirstPage (respectively).  Note that the latter will
%%  	  produce multiple definition warnings and both require several
%%	  latexings of the file to get everything right.  Also note that you
%%	  need to type these commands on the pages you wish to be first or
%%	  last (respectively).
%%
%% 8 January 1999	Modified	Greg Lewis
%%	# Fixed up the manual setting of the last page label hack.  Its
%%        current form should allow you to do this without having it only
%%	  written to the .aux file once every second latex run!
%%
%% TBD
%%	# Additional features that may now be easy to do.
%%	# More Testing.
%%	# Add index commands to the author macros for producing the index
%%	  for the final part of each volume.
%%
%% Known problems
%%	# If there are no References then the spacing after the last line and
%%	  before the address listing is too small.
%%	# If there is no abstract the subject classes and keywords will not
%%	  be output (they are done by \end{abstract}).
%%
%% $Id: jaums.cls,v 1.8 1999/01/08 04:01:20 glewis Exp $
%%

%%
%% Header stuff.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{jaums}[1998/8/19 v0.2e JAMS document class]

%%
\newcommand\@ptsize{}

%% 
%% If clauses for our two main options.
%% Final - Printed journal fonts, margins, etc.
%% Jamsb - Various options for things Jams B does differently.
%%
\newif\if@final
\newif\if@jamsb
\@finalfalse
\@jamsbfalse

%%
%% Various page sizes from article.cls
%%
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
%%
%% The production set up for papers (the final option)
%%
\DeclareOption{final}{%
   \setlength\overfullrule{0pt}%
   \setlength\textwidth{30pc}%
   \setlength\textheight{45pc}%
   \setlength\topmargin{-14mm}%
   \setlength\oddsidemargin{-12mm}%
   \setlength\evensidemargin{-12mm}%
   \setlength\footskip{1.5pc}%
   \setlength\headheight{13pt}%
   \setlength\headsep{7pt}%
   \setlength\parskip{0pt}%
   \setlength\parindent{12pt}%
   \@finaltrue%
}
%%
%% Set up a flag so we can decide if this is for Jams B rather than Jams A
%%
\DeclareOption{jamsb}{%
   \@jamsbtrue%
}
\DeclareOption{jamsa}{%
   \@jamsbfalse
}
%%
%% This may have to be replaced at some point.
%%
\DeclareOption{leqno}{\input{leqno.clo}}

%%
%% Pointsize changing options.  These will only work out of final mode.
%%
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

%%
%% Default options
%%
\ExecuteOptions{a4paper,11pt}

%%
%% Process the options we are passed.
%%
\ProcessOptions

%%
%% Post processing based on the options we've been given.
%%
\if@jamsb\else
   \ExecuteOptions{leqno}
\fi

%%
%% These macros are essential to many things and unfortunately not just when
%% we are in final mode!
%%
\usepackage{amsgen}
\usepackage{ifthen}
\usepackage{amsthm}
%%
%% The bulk of the extra production set up.
%%
\if@final
%%
%% Load the AMS packages.  Mainly because the font definitions for \mathbb
%% and \mathgoth conflict and if they are loaded here they can be corrected
%% subsequently.
   \if@jamsb
      \usepackage[reqno]{amsmath}
   \else
      \usepackage[leqno]{amsmath}
   \fi
   \usepackage{amsxtra}
   \usepackage{amsfonts}
   \usepackage{amssymb}
   \usepackage{amscd}
%%
%% An extra standard LaTeX2e package
%%
   \usepackage{epsfig}
%%
%% Production fonts
%%
   \usepackage[rsfscal,rsfsscr,LY1]{mathtime}
   \usepackage{jamsxfnt}
%%
%% Extra jams packages
%%
   \usepackage{jamsxtra}
%%
%% Points sizes for the various font size commands in production mode.
%% The skips above and below equations are also set up here.
%%
   \renewcommand\normalsize{%
      \@setfontsize\normalsize{10.6}{13.5}%
      \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
      \abovedisplayshortskip \z@ \@plus3\p@
      \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
      \belowdisplayskip \abovedisplayskip
      \let\@listi\@listI
   }
   \newcommand\small{%
      \@setfontsize\small\@xpt\@xiipt
      \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
      \abovedisplayshortskip \z@ \@plus3\p@
      \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
      \def\@listi{\leftmargin\leftmargini
         \topsep 6\p@ \@plus2\p@ \@minus2\p@
         \parsep 3\p@ \@plus2\p@ \@minus\p@
         \itemsep \parsep
      }%
      \belowdisplayskip \abovedisplayskip
   }
   \newcommand\footnotesize{%
      \@setfontsize\footnotesize\@ixpt{11}%
      \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
      \abovedisplayshortskip \z@ \@plus2\p@
      \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
      \def\@listi{\leftmargin\leftmargini
         \topsep 4\p@ \@plus2\p@ \@minus2\p@
         \parsep 2\p@ \@plus\p@ \@minus\p@
         \itemsep \parsep
      }%
      \belowdisplayskip \abovedisplayskip
   }
   \newcommand\scriptsize{\@setfontsize\scriptsize\@viipt{7}}
   \newcommand\tiny{\@setfontsize\tiny\@vpt{6}}
   \newcommand\large{\@setfontsize\large\@xiipt{13.2}}
   \newcommand\Large{\@setfontsize\Large\@xivpt{15.9}}
   \newcommand\LARGE{\@setfontsize\LARGE\@xviipt{19}}
   \newcommand\huge{\@setfontsize\huge\@xxpt{22.8}}
   \newcommand\Huge{\@setfontsize\Huge\@xxvpt{27.4}}
   \normalsize
%%
   % pageref
%%
%% This counter is to allow us to separately determine the actual page as
%% opposed to value of the page counter.
%% Question - could we instead use page-firstpage ?
%%            Doesn't look like it -- can the calc package cope with labels?
%%
   \newcounter{articlepage}
   \setcounter{articlepage}{1}
%%
%% Redefinition of @outputpage.  Nasty to have to do but potentially useful
%% Really need an AtEndPage macro to go with AtEndDocument!
%%
   \let\my@outputpage\@outputpage
   \def\@outputpage{
      \my@outputpage
      \stepcounter{articlepage}
   }
\else
   \input{size1\@ptsize.clo}
\fi
%%
%% Commands that generally set up things to be used in setting the paper,
%% many of them to do with things in the title or that go on the first page.
%%
\if@jamsb\else
%%
%% Not used by Jams B (currently).
%%
   \newcommand{\communicator}[1]{\newcommand{\@communicator}{#1}}
   \newcommand{\subjclassyear}[1]{\newcommand{\@subjclassyear}{#1}}
   \newcommand{\subjclass}[1]{\newcommand{\@subjclass}{#1}}
   \newcommand{\keywords}[1]{\newcommand{\@keywords}{#1}}
\fi
%%
%% Used by both
%%
   \renewcommand{\date}[1]{\renewcommand{\@date}{#1}}
%%
%% Titles, authors and addresses.
%% Borrowed shamelessly from amsart.cls
%%
%% \title[short title]{full title} OR
%% \title{full title}
%%
\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{{#2}}}
\edef\title{\@nx\@dblarg \@xp\@nx\csname\string\title\endcsname}
\renewcommand{\author}[2][]{%
   \ifx\@empty\authors
      \gdef\shortauthors{#1}\gdef\authors{\uppercase{#2}}%
   \else
      \g@addto@macro\shortauthors{\and#1}%
      \g@addto@macro\authors{\and\uppercase{#2}}%
   \fi
}
\edef\author{\@nx\@dblarg \@xp\@nx\csname\string\author\endcsname}
\let\shortauthors\@empty   \let\authors\@empty
\let\addresses\@empty      \let\thankses\@empty
\newcounter{addressctr}
\newcommand{\address}[2][]{
   \stepcounter{addressctr}
   \if@jamsb
      \ifx\authors\@empty
         \errmessage{Author list empty, ignoring address}
      \else
%% Jams B -- \\ in an address should be substituted as a comma.
         \g@addto@macro\authors{\stepcounter{footnote}\@textsuperscript{\scriptsize\thefootnote}\@footnotetext{\def\\{, }#2}}%
      \fi
   \else
%% Jams A addresses are in tabular formats.
      \ifx\addresses\@empty
         \g@addto@macro\addresses{\vskip -4mm\noindent\begin{tabular}[t]{@{}l@{}}\address{#1}{#2}}
      \else
         \ifthenelse{\isodd{\value{addressctr}}}{
            \g@addto@macro\addresses{\end{tabular}\\[+20pt] \begin{tabular}[t]{@{}l@{}}\address{#1}{#2}
         }} {
            \g@addto@macro\addresses{\end{tabular}\hfill\begin{tabular}[t]{@{}r@{}}\address{#1}{#2}
         }}
      \fi
   \fi
}
%%
%% The addressmark command for Jams B just places a footnork make next to the
%% authors name.
%% Either... \addressmark{} 	(Uses the current address mark)
%%           \addressmark{#}	(Uses the given numerical argument)
%%
\if@jamsb
   \newcommand{\addressmark}[2][]{%
      \ifthenelse{\equal{#2}{}}{%
         \g@addto@macro\authors{\@textsuperscript{\scriptsize\dummyaddress{\thefootnote}}}%
      }{%
         \g@addto@macro\authors{\@textsuperscript{\scriptsize\dummyaddress{#2}}}%
      }
   }
\fi
%%
%% These next 3 really only work with Jams A at the moment.
%%
\newcommand{\currentaddress}[2][]{%
   \g@addto@macro\addresses{\currentaddress{#1}{#2}}
}
\newcommand{\email}[2][]{\g@addto@macro\addresses{\email{#1}{#2}}}
\newcommand{\url}[2][]{\g@addto@macro\addresses{\url{#1}{#2}}}
\renewcommand{\thanks}[1]{\g@addto@macro\thankses{\thanks{#1}}}
%%
%% End amsart.cls
%%
%%
%% Called by Jams A during AtEndDocument to set the addresses
%%
\newcommand{\@setaddresses}{
   \begingroup
      \def\address##1##2{##2}
      \def\currentaddress##1##2{\\ Current address:\\##2}
      \def\email##1##2{\\ e-mail: ##2}
      \def\url##1##2{\\ URL: ##2}
      \normalsize\rmfamily
      \ifx\addresses\empty
      \else
         \par\bigskip
         \noindent\addresses\end{tabular}
      \fi
   \endgroup
}
%%
%% Macros to set the first and last page
%%
\newif\if@DoneLastPageLabel
\@DoneLastPageLabelfalse
\newcommand{\ThisIsLastPage}{%
\makeatletter%
\label{thelastp@ge}%
\@DoneLastPageLabeltrue%
\makeatother%
}
\newcommand{\ThisIsFirstPage}{\makeatletter\label{thefirstp@ge}\makeatother}
%%
%% Things to occur at the start of the document...
%%
\AtBeginDocument{
   \thispagestyle{plain}
   \label{thefirstp@ge}
}
%%
%% ...and at the end
%%
\AtEndDocument{
   \if@jamsb\else
      \@setaddresses
   \fi
%   \@ifundefined{r@thelastp@ge}
   \if@DoneLastPageLabel
   \else
      {\label{thelastp@ge}}
   \fi
}
%%
%% More AMS macros!  They write such useful stuff...
%% These are for making everything which isn't in math mode uppercase and
%% for adding together values into an "english list".
%%
\newcommand{\uppercasenonmath}[1]{%
   \toks@\@emptytoks
   \@xp\@skipmath\@xp\@empty#1$$%
   \edef#1{\@nx\@upprep\the\toks@}%
}
\newcommand{\@upprep}{%
   \spaceskip1.3\fontdimen2\font plus1.3\fontdimen3\font
   \upchars@
}
\newcommand{\upchars@}{%
   \def\ss{SS}\def\i{I}\def\j{J}\def\ae{\AE}\def\oe{\OE}%
   \def\o{\O}\def\aa{\AA}\def\l{\L}\def\Mc{M{\scshape c}}
}
\newcommand{\@skipmath}{}
\long\def\@skipmath#1$#2${%
   \@xskipmath#1\(\)%
   \@ifnotempty{#2}{\toks@\@xp{\the\toks@$#2$}\@skipmath\@empty}
}%
\newcommand{\@xskipmath}{}
\long\def\@xskipmath#1\(#2\){%
   \uppercase{\toks@\@xp\@xp\@xp{\@xp\the\@xp\toks@#1}}%
   \@ifnotempty{#2}{\toks@\@xp{\the\toks@\(#2\)}\@xskipmath\@empty}
}%
\newcommand{\xandlist}[4]{\@andlista{{#1}{#2}{#3}}#4\and\and}
\def\@andlista#1#2\and#3\and{\@andlistc{#2}\@ifnotempty{#3}{%
   \@andlistb#1{#3}}}
   \def\@andlistb#1#2#3#4#5\and{%
   \@ifempty{#5}{%
      \@andlistc{#2#4}%
   }{%
      \@andlistc{#1#4}\@andlistb{#1}{#3}{#3}{#5}%
   }
}
\let\@andlistc\@iden
\newcommand{\nxandlist}[4]{%
   \def\@andlistc##1{\toks@\@xp{\the\toks@##1}}%
   \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
   \the\@xp\toks@#4\and\and
   \edef#4{\the\toks@}%
   \let\@andlistc\@iden
}
\newcommand{\andify}{%
   \nxandlist{\unskip, }{\unskip{} and~}{\unskip\ and~}
}
\def\and{\unskip{ }and \ignorespaces}
%%
%% Set author's names
%%
\def\@setauthors{%
   \begingroup
      \andify\authors
      \if@jamsb
         \begingroup
            \def\dummyaddress##1{##1}
            {\centering\small \authors}
         \endgroup
      \else
         {\centering\small\bfseries \authors}
      \fi
   \endgroup
}
%%
%% Set the title
%%
\def\@settitle{
   \begin{center}%
      \uppercasenonmath\@title
      {\large\bfseries \@title}
   \end{center}
}
% Needs to be all one line to prevent space at start of footnotes
\def\@setthanks{\def\thanks##1{\par##1\@addpunct.}\thankses}
%%
%% Back to article.cls
%%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
%\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
%%
%% Try and convert to new fancyhdr commands
%%
\if@final
%%
%% Package to insert hypertext links for Adobe Distiller
%%
%   \usepackage[dvips]{jamshypr} % nocolorlinks?
%   \renewcommand{\LinkColor}{blue}
%%
%% Package which allows the definition of "fancy" headers and footers
%%
   \usepackage{fancyhdr}
   \pagestyle{fancyplain}
   \renewcommand{\headrulewidth}{0pt}
   \if@jamsb
      \lhead[\fancyplain{{\footnotesize%\href{cover.pdf}%
			  {\emph{J.~Austral.~Math.~Soc.~Ser.~B}
			  XX (XXXX)}, 
			  \pageref{thefirstp@ge}--\pageref{thelastp@ge}}}
			{\footnotesize\thepage}]
            {\fancyplain{{\footnotesize%\href{cover.pdf}%
			  {\emph{J.~Austral.~Math.~Soc.~Ser.~B} 
		          XX (XXXX)},
		          \pageref{thefirstp@ge}--\pageref{thelastp@ge}}} 
                        {{\footnotesize [\thearticlepage]}}}
      \chead[\fancyplain{}{{\andify\shortauthors\footnotesize\shortauthors}}]
	    {\fancyplain{}{{\footnotesize\shorttitle}}}
      \rhead[\fancyplain{}{\footnotesize [\thearticlepage]}]
            {\fancyplain{}{\footnotesize\thepage}}
      \lfoot[]{}
      \cfoot[\fancyplain{{\footnotesize\thepage}}{}]%
	    {\fancyplain{{\footnotesize\thepage}}{}}
      \rfoot[]{}
   \else
      \lhead[\fancyplain{{\footnotesize%\href{cover.pdf}%
			  {\emph{J.~Austral.~Math.~Soc.}
			  (\emph{Series A})
			  {\bfseries XX} (XXXX)}, 
			  \pageref{thefirstp@ge}--\pageref{thelastp@ge}}}
			{\footnotesize\thepage}]%
            {\fancyplain{{\footnotesize%\href{cover.pdf}%
			  {\emph{J.~Austral.~Math.~Soc.}
			  (\emph{Series A}) 
		          {\bfseries XX} (XXXX)},
		          \pageref{thefirstp@ge}--\pageref{thelastp@ge}}} 
                        {{\footnotesize [\thearticlepage]}}}
      \chead[\fancyplain{}{{\andify\shortauthors\footnotesize\shortauthors}}]%
	    {\fancyplain{}{{\footnotesize\shorttitle}}}
      \rhead[\fancyplain{}{{\footnotesize [\thearticlepage]}}]%
            {\fancyplain{}{\footnotesize\thepage}}
      \lfoot[]{}
      \cfoot[\fancyplain{\thepage}{}]{\fancyplain{\thepage}{}}
      \rfoot[]{}
   \fi
\else\fi
%%
%% Footnote implementation.
%%
\long\def\@makefntext#1{%
   \ifx\@thefnmark\relax
      \noindent\@makefnmark#1
   \else
      \parindent 1em\noindent%
      \hb@xt@.5em{\hss\@textsuperscript{\normalfont\@thefnmark}}#1
   \fi
}
\long\def\@footnotetext#1{\insert\footins{%
   \normalfont\footnotesize
   \interlinepenalty\interfootnotelinepenalty
   \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
   \floatingpenalty\@MM \hsize\columnwidth
   \@parboxrestore%\parindent\normalparindent 
   \sloppy\flushleft
   \edef\@currentlabel{\p@footnote\@thefnmark}%
   \@makefntext{\rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}
}
\renewcommand\footnoterule{%
   \kern-3\p@%
   \hrule \@width50\p@ \@height0.4\p@%
   \kern2.6\p@%
}
%%
%% Make the title (and many other things) on the front page.
%%
\newcommand\maketitle{\par
   \begingroup
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
      \thispagestyle{plain}
%      \@thanks
   \endgroup
   \setcounter{footnote}{0}%
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@maketitle\relax
   \global\let\@thanks\@empty
   \if@final
   \else
      \global\let\@author\@empty
      \global\let\@title\@empty
      \global\let\title\relax
      \global\let\author\relax
   \fi
   \global\let\and\relax
%  \newcommand{\@thefnmark}{}
}
\def\@maketitle{%
   \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
   \def\@thefnmark{\thefootnote}
   \newpage
   \null
   \vskip 3em%
   \begin{center}%
      \ifx\@empty\@title \else \@settitle \fi
      \vskip 1em%
      \ifx\@empty\authors \else \@setauthors \fi
      \if@jamsb
         \ifx\@date\undefined
         \else
             \vskip 2em%
             {\footnotesize (\@date)}%
         \fi
      \else
         \ifx\@date\undefined
         \else
             \vskip 2em%
             {\footnotesize (\@date)}%
         \fi
         \ifx\@communicator\undefined
         \else
            \vskip 2em%
            {\footnotesize Communicated by \@communicator}
         \fi
      \fi
   \end{center}%
   \let\@makefnmark\relax  \let\@thefnmark\relax
   \ifx\@empty\thankses\else%
      \@footnotetext{\def\par{\let\par\@par}\@setthanks}
   \fi
   \if@jamsb
      \@footnotetext{\copyright\ Australian Mathematical Society XXXX, Serial-fee code 0334-2700/XX}
   \else
      \@footnotetext{\copyright\ XXXX\ Australian Mathematical Society 0263-6115/XX \$A$2.00+0.00$}
   \fi
   \par
   \vskip 1.5em
}
%%
%% Sectioning commands set up here.
%%
\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%
% Grotty hack to give sections and subsections difference spacings
%
\newif\ifissection
\renewcommand{\@seccntformat}[1]{
   \ifissection
      {{\csname the#1\endcsname}.\hspace*{0.1ex} } %{0.4ex}
   \else
      {{\csname the#1\endcsname}.\hspace*{-0.3ex} }
   \fi
}
\newcommand\section{\issectiontrue\@startsection%
   {section}%
   {1}%
   {\z@}%
   {.315in \@plus .05in \@minus .1in}%
   {.225in}%
   {\centering\normalfont\normalsize\bfseries}%
}
\newcommand\subsection{\issectionfalse\@startsection%
   {subsection}%
   {2}%
%   {.1in \@plus .05in}%
   {\z@}%
   {1em}%
   {-1.0em}%
   {\normalfont\normalsize\bfseries}%
}
\newcommand\subsubsection{\issectionfalse\@startsection%
   {subsubsection}%
   {3}%
   {.1in \@plus .05in}%
   {.10in \@plus .06in \@minus .04in}%
   {-1em}
   {\normalfont\normalsize\itshape}%
}
\newcommand\paragraph{\issectionfalse\@startsection%
   {paragraph}%
   {4}%
   {.1in \@plus .05in}%
   { }%
   {\parindent}%
   {\normalfont\normalsize\bfseries}%
}
\newcommand\subparagraph{\issectionfalse\@startsection
   {subparagraph}%
   {5}%
   {.1in \@plus .05in}%
   { }%
   {\parindent}%
   {\normalfont\normalsize\scshape}%
}
%%
%% More from article.cls
%%
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
%%
%% The abstract environment
%%
\newenvironment{abstract}{%
   \vskip 1mm
   \footnotesize
   \begin{center}%
   {\bfseries \abstractname} \\[+.135in]
   \if@jamsb
      \begin{minipage}[t]{26pc}
   \else
      \end{center}
   \fi
} {
   \if@jamsb
      \end{minipage}
      \end{center}
   \else
      % Set the subject classes and keywords.
      \par\medskip\noindent\parbox[t]{\textwidth}{\footnotesize
         \ifx\@subjclassyear\undefined
         \else
	    \ifx\@subjclass\undefined
	    \else
               \noindent
               {\@subjclassyear\  
	        \emph{Mathematics subject classification} 
	        (\emph{Amer.~Math.~Soc.}): \@subjclass.\\}
	    \fi
         \fi
         \ifx\@keywords\undefined
         \else
            \noindent
            {\emph{Keywords and phrases}: \@keywords.}
         \fi
      }
   \fi
%   \if@jamsb
%      \vspace*{3pt \@plus .1in \@minus .05in}
%   \else
%      \vspace*{-9pt \@plus .1in \@minus .05in} 
%   \fi
    \if@jamsb
       \vspace*{.16in \@plus .1in \@minus .05in}
    \else
       \vspace*{.10in \@plus .1in \@minus .05in}
    \fi
}
%%
%% Probably needs some modification.
%%
\newcommand\appendix{%
   \par%
   \setcounter{section}{0}%
   \setcounter{subsection}{0}%
   \renewcommand\thesection{\@Alph\c@section}
}
%%
%% Back to article.cls
%% Some of these may need to be changed.
%%
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}

%%
%% Reimplementation of eqnarray, with a "nicer" spacing.
%%
\newlength{\@eqnarraycolsep}
\setlength{\@eqnarraycolsep}{0.35ex}
\def\eqnarray{%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering
   \let\\\@eqncr
   $$\everycr{}\halign to\displaywidth\bgroup
       \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
      &\global\@eqcnt\@ne\hskip \tw@\@eqnarraycolsep \hfil${##}$\hfil
      &\global\@eqcnt\tw@ \hskip \tw@\@eqnarraycolsep
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
         \tabskip\z@skip
      \cr
}
\def\endeqnarray{%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   $$\@ignoretrue
}

%%
%% Modified captioning command.
%%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\def\caption{\@ifstar{\@dblarg{\@makeunnumberedcaption}}{\refstepcounter\@captype \@dblarg{\@caption\@captype}}}
\long\def\@makecaption#1#2{%
   \begingroup
   \footnotesize
   \vskip\abovecaptionskip
   \sbox\@tempboxa{{\sc #1}. #2}%
   \ifdim \wd\@tempboxa >\hsize
      {\sc #1}. #2\par
   \else
      \global \@minipagefalse
      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
   \vskip\belowcaptionskip
   \endgroup
}
\long\def\@makeunnumberedcaption[#1]#2{%
   \begingroup
   \footnotesize
   \vskip\abovecaptionskip
   \sbox\@tempboxa{#2}%
   \ifdim \wd\@tempboxa >\hsize
      #2\par
   \else
      \global \@minipagefalse
      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
   \vskip\belowcaptionskip
   \endgroup
}
%%
%% Figure and table implementations.
%%
%% Figure environment first.
%%
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%%
%% Table environment.
%%
%% Note: A different \abovecaptionskip and \belowcaptionskip than the figure 
%%       environment due to the placement of the caption.
%%
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\setlength\belowcaptionskip{10\p@}%
		\setlength\abovecaptionskip{0\p@}
                \@float{table}}
               {\setlength\belowcaptionskip{0\p@}%
		\setlength\abovecaptionskip{10\p@}%
		\end@float}
\newenvironment{table*}
               {
	        \setlength\belowcaptionskip{10\p@}%
	        \setlength\abovecaptionskip{0\p@}
                \@dblfloat{table}%
               }
               {\setlength\belowcaptionskip{0\p@}%
                \setlength\abovecaptionskip{10\p@}%
		\end@dblfloat}

%%
%% Old font changing commands, for compatibility.
%%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
%%
%% Names of various special sections
%%
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
%%
%% Table of contents, List of Figures, List of Tables implementations.
%%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
   \section*{\contentsname}%
   \@starttoc{toc}%
}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
   \section*{\listfigurename}%
   \@starttoc{lof}%
}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
   \section*{\listtablename}%
   \@starttoc{lot}%
}
\let\l@table\l@figure
%%
%% Bibliography implementation.
%%
\newdimen\bibindent
\setlength\bibindent{0pt}
\newlength\abovebibskip
\setlength{\abovebibskip}{2.7pc \@plus.5pc \@minus.25pc}
\newenvironment{thebibliography}[1]{%
%% Better way to do it, but gets the spacing wrong.
%     \section*{\refname%
%        %\@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}
%     }%
      \vskip\abovebibskip
      \centerline{\normalsize\bfseries \refname}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
	    \labelsep.5em
	    \itemindent\z@
	    \topsep1pc \@plus.1pc \@minus.1pc
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
	    \advance\leftmargin\bibindent
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \footnotesize
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
%%
%% Index implementation.
%%
\newenvironment{theindex}
               {\@restonecoltrue
                \columnseprule \z@
                \columnsep 35\p@
                %\@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
                %\thispagestyle{plain}
		\parindent\z@
               \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
%%
%% Theorem styling
%%
\newlength{\theoremheadspace}
\setlength{\theoremheadspace}{0.4em}%{\labelsep}
%\settowidth{\theoremheadspace}{x}%{\quad}
\newtheoremstyle{thmit}{12pt plus 5pt minus 3pt}{8pt plus 3pt minus 1.5pt}
                {\itshape}{\parindent}{\scshape}{.}{\theoremheadspace}
		{\thmname{#1}\thmnumber{ #2}\thmnote{ {\upshape (#3)}}}
\newtheoremstyle{thmrm}{12pt plus 5pt minus 3pt}{8pt plus 3pt minus 1.5pt}
                {\upshape}{\parindent}{\scshape}{.}{\theoremheadspace}
		{\thmname{#1}\thmnumber{ #2}\thmnote{ {\upshape (#3)}}}
%%
%% Today's date
%%
\newcommand\today{}
\edef\today{%
   \ifcase\month\or
   January\or February\or March\or April\or May\or June\or
   July\or August\or September\or October\or November\or December\fi
   \space\number\day, \number\year
}
%%
%% Pagestyle and numbering
%%
\if@final\else
   \pagestyle{plain}
\fi
\pagenumbering{arabic}

%%
%% Make sure headers and footers swap on odd and even pages.
%%
\@twosidetrue

%%
%% Thats all folks!
%%
\endinput
%%
%% End of file `jaumsa.cls'.
