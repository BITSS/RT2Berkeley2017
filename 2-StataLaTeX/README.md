Stata and LaTeX Two-Step Workflow
=================================

With Stata and LaTeX you can do a two-step workflow. LaTeX is extremely powerful, so you can definitely write entire papers with this method.

# Step 1 --Run the Stata code

Run your regressions in a Stata do file (StataLaTeX.do). Use the estout or outreg2 ado commands to create publication-quality regression tables formatted for LaTeX
(outputS.tex is created by StataLaTeX.do).

*If you don't have outreg2 or estout installed, you will have to install them with* ```ssc install estout``` and ```ssc install outreg2```*. You will also have to change the filepath to get this program to run on your computer.*

For any specific values you'd like to automatically include in the paper, you can write a short program that will automatically store the values in a separate
.tex file (StataScalarList.tex).

# Step 2 --Compile the LaTeX paper

Include your tables (outputS.tex) and scalars (StataScalarList.tex) directly in your main .tex paperfile (TeXPaper.tex).
LaTeX creates a whole bunch of ignorable files, but the nicely formatted output file is TeXPaper.pdf.

*Just be sure and remember which .do file generated which table!* With a long paper, this is not so easy, and less reproducible than the all-in-one solution that R Markdown,
and to a lesser extent the Markdoc Stata add-on, provide.
