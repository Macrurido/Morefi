Morefi: Morphological Relationships Fitted by Robust Regression
<<<<<<< HEAD

=======
<img src='images/Morefi.png' align='right' height='20%' width='20%'/>
>>>>>>> 797145bb726cc480b9f31a4fec6f464f87688996
================
03 abril 2024

<!-- README.md is generated from README.Rmd. Please edit that file -->

Shield: [![CC BY
4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by/4.0/)

Morefi © 2024 by Hugo Aguirre Villaseñor is licensed under a [Creative
Commons Attribution 4.0 International
License](http://creativecommons.org/licenses/by/4.0/).

[![CC BY
4.0](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)

# Morefi

The *Morefi* package: *Morphological Relationships Fitted by Robust
Regression*. It is a methodological package developed to carry out the
analysis of the article: Aguirre-Villaseñor & Morales-Bojórquez (IN
PREPARATION). For this purpose, some functions and a vignette were
created to explain the process step by step. The tables and figures were
personalized. The lmrob() and nlrob() from robustbase (version 0.99-2),
are used to perform robust regression.

The package consists of nine functions that facilitate the
implementation of the methodology used in this analysis:

`fn_ARSS`: Perform the Coincident Curves Test, to determine if there are
significant differences between the fitted curves for each database. It
is based on the Analysis of the Residual Sum of Squares (ARSS) (Chen et
al. 1992).

`fn_figs`: Creates a customized scatter plot with the observed values
(points), fitted regression (solid line), and its confidence interval
(shaded area).

`fn_freq`: The function calculates a frequency distribution of data.

`fn_freqw` This is a methodological function to calculate the percentage
frequencies of weights by model adjusted using the robust regression
approach.

`fn_fyield`: Calculates the fillet yield by dividing a defined weight
reference point **bm** by the mean, lower, and upper confidence interval
of 95% (IC95%) of the estimated fillet weight, respectively.

`fn_intervals`: Calculates a non-parametric confidence and predicted
intervals using the function predFit() from the package investr (version
1.4.2).

`fn_R2RV`: Calculates a robust version of the coefficient of
determination $R^{2}_{RV}$ (Renaud & Victoria-Feser, 2010).

`fn_summary`: Customizes and stores the summary of each fitted
regression.

`fn_xseq`: Generates a data frame with a sequence for independent
variables (including minimum and maximum values) and selects it
according to the model.
