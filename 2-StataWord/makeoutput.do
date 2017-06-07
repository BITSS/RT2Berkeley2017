cd C:/Users/Garret/Documents/AutoWord
sysuse auto
reg price mpg weight
estimates store autotest
esttab autotest using autotest.rtf, replace
*MAKE SURE THIS FILE IS GETTING SAVED IN THE CORRECT DIRECTORY!

histogram price, title("Histogram of Price")
graph export pricehisto.png, replace

cap log close
quietly log using example, replace

//OFF
summ price
//ON
txt "The mean of Price variable is " %9.2f r(mean) " and SD is " %9.2f r(sd)

/***
LaTeX is great for equations. $a^2+b^2=c^2$
$$Y_i=\alpha+\beta_1 \cdot X_i+\epsilon_i$$
***/

markdoc example, replace export(docx)
