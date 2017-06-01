//This file creates a simple example of nicely formatted regression output.
//After running this file, a user should be able to 

clear all 
set more off 
version 12.1
//change this next line as necessary
cd "C:\Users\garret\Box Sync\CEGA-Programs-BITSS\1_Events\3_Workshops-Seminars\INSP-Mexico\INSP2017\5-StataLaTeX"
//Or, just use this little trick to automatically use the current directory
*di c(pwd)
*local drive = substr("`c(pwd)'", 1, 2)
*cd `drive'

use WASHBpublic_mock.dta

*Do I have the same data as I used to, or as my collaborator does?
datasignature

*OUTPUT IN TEX
*ssc install outreg2 //Make sure you have outreg2 installed

//viewsource outreg2.ado
//Run with outreg2 version 2.3.2

reg free_chl_yn treatw
outreg2 using outputS.tex, tex replace bdec(3) tdec(3)

reg free_chl_yn treatw, robust
outreg2 using outputS.tex, tex append bdec(3) tdec(3)

reg free_chl_yn treatw english kiswahili, robust
outreg2 using outputS.tex, tex append bdec(3) tdec(3)

****************************************
* To refer to specific values, you can send the output to a file, 
* and then call that output in LaTeX
* Thanks to Henrique Romero for this.
****************************************

*(1)* Write a little Stata program to define a new LaTeX command
cap program drop latexnc
program define latexnc
*Spot is the string with the name
local spot1="`1'"
*Spot2 is the actual value stored in the scalar
local spot2=`1'
local latexnc1 "\newcommand{\\`spot1'}{`spot2'}"
! echo `latexnc1' >> `2' 
end 

*(2)* Use the program to send output to a file
* NB: You could also do this in one step since you can write directly to a file.
sysuse auto, clear
*Create empty tex file to store new commands
cap rm .\StataScalarList.tex
! touch .\StataScalarList.tex
* We want to mention the mean price in our paper 
sum price 
*Need to use full path to tex file because the stata working directory doesn't pass through the shell command 
scalar meanprice=r(mean)
latexnc meanprice ".\StataScalarList.tex"

*We can also round numbers if we wish 
scalar stddevprice=round(`r(sd)',.1) 
latexnc stddevprice ".\StataScalarList.tex"
