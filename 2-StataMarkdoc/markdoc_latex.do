	*cd "C:\Users\garret\Box Sync\CEGA-Programs-BITSS\1_Events\3_Workshops-Seminars\UCMerced\UCMerced2017\3-StataMarkdoc" 
	//change this for your computer, or just do:
	di c(pwd)
	local drive = substr("`c(pwd)'", 1, 2)
	cd `drive'
	//Or try the -project- package by Robert Picard
	
	cap qui log c
	set linesize 70
	set more off
	qui log using example_latex, replace  
	
	
		/***
		
		\documentclass{article}
		
		\usepackage{graphicx}   %package for inserting graphs
		
		\usepackage{geometry}
		\geometry{
		a4paper,
		total={210mm,297mm},
		left=20mm,
		right=20mm,
		top=20mm,
		bottom=20mm,
		}
		
		\usepackage{graphicx}
		\usepackage{standalone}

		\begin{document}

		\title{Writing with \LaTeX{} in Stata Do-file Editor}
		\author{E. F. Haghish}

		\maketitle

		\begin{abstract}
		\textbf{MarkDoc} not only supports writing text using \textbf{Markdown Syntax} 
		but also allows writing and styling text using \textbf{HTML} and \LaTeX{}. 
		These new features will appeal only to professional users (\textit{Wierdos})
		and the majority of the users will enjoy writing with Markdown. In this 
		short turorial I will demonstrate how to weave a document in MarkDoc using 
		\LaTeX{}. 
		\end{abstract}

		\section{Introduction}
		There is a new feature in MarkDoc that allows you to weave your document
		Using \LaTeX{}. This might only be interesting to some of you. 
		
		Hey look, it's math.
		\begin{equation}
		\label{simple_equation}
		\alpha = \sqrt{ \beta }
		\end{equation}

		\subsection{Adding Stata output}
		Below I will add some Stata commands and outputs.
		
		\begin{verbatim}
		***/
		
	sysuse auto, clear	
	describe
	list in 1/3
	hist price
	graph export graph.png, width(400) replace
	
		/***
		
		\end{verbatim}
		
		
		
		\begin{figure}[htbp]
		\centering
		\includegraphics{graph.png}
		\caption{This graph shows the histogram of the price variable}
		\end{figure}
		
		
		
		\section{Regression}
		Let's end this do-file with a regression analysis.

		\begin{verbatim}
		***/
		
	/**/ quietly regress price mpg
	/**/quietly outreg2 using outreg2.tex, replace
	
		/***
		
		\end{verbatim}
		
		\section{Conclusion}
		Writing a document with \LaTeX{} in \textbf{MarkDoc} is so natural and 
		does not require additional options or commands. \textbf{MarkDoc} 
		automatically recognizes that you are writing with \LaTeX{}. All that 
		you need to do is to \textbf{export a tex file} from the options. Also 
		remember not to mix HTML, \LaTeX{}, and Markdown in a single document. 
		Make your mind what markup language you want to use for weaving your 
		document.
		
		\input{outreg2.tex}

		\end{document}
		***/
					
	qui log c
	
	markdoc example_latex, replace export(tex)
	*markdoc example_latex, replace export(docx) //won't work
