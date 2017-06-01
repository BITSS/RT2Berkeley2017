   *cd "C:\Users\garret\Box Sync\CEGA-Programs-BITSS\1_Events\3_Workshops-Seminars\UCMerced\UCMerced2017\3-StataMarkdoc" 
	//change this for your computer, or try:
	di c(pwd)
	local drive = substr("`c(pwd)'", 1, 2)
	cd `drive'
	//Or try the -project- package by Robert Picard
	
	cap qui log c
	set linesize 70
	set more off
	qui log using example_html, replace  
	
	
		/***
		
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		
		<html xmlns="http://www.w3.org/1999/xhtml">
		
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Untitled Document</title>
		</head>

		<body>
		
		<h1 align="center">Weaving with HTML in MarkDoc</h1>
		<h3 align="center">E. F. Haghish</h3>
		<h4 align="center">Center for Medical Biometry and Medical Informatics, 
		University of Freiburg</h4>
		
		<br /><br />
		
		<h2>Introduction</h2>
		<p>In addition to Markdown syntax, you may also weave your document 
		using <strong>HTML</strong> markup language. This allows further 
		flexibility in styling the document, although it reduces the readability 
		of human language due to HTML syntax. </p>
		***/
		
	sysuse auto, clear	
	describe
	list in 1/3
	
		/***
		
		<h2>Regression</h2>
		<p>Let's end this do-file with a regression analysis.</p>

		***/
		
	regress price mpg
	
		/***
		
		<h2>Conclusion</h2>
		<p>Writing a document with _HTML_ in __MarkDoc__ is so natural and 
		does not require additional options or commands. __MarkDoc__ 
		automatically recognizes that you are writing with HTML. All that 
		you need to do is to __export a html file__ from the options. Suprisingly  
		__you can mix HTML with Markdown as long as you export the document in 
		html format or any other document format that recognizes html such as 
		docm__. </p>

		***/
					
	qui log c
	
	markdoc example_html, replace export(html) 
	

