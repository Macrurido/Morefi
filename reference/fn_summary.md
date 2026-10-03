# fn_summary

The function customizes and stores the summary of each fitted
regression.

## Usage

``` r
fn_summary(List_Tables, modelos, catego, eq, R2, i, j)
```

## Arguments

- List_Tables:

  A list to store summary regression results.

- modelos:

  A character vector containing the variables of a function.

- catego:

  A character vector containing the landed weight categories.

- eq:

  Summary of the equation fitted.

- R2:

  A numeric value of the adjusted robust version of the coefficient of
  determination.

- i:

  An integer value indicating the ith regression analyzed.

- j:

  An integer value indicating the jth categorie analyzed.

## Value

List_Tables with a customized table that stores the regression summary
of each model.

## Details

Table T1 is a customized table to store the regression summarized by
model and landed weight categories: Fresh, Frozen-thawed (Frozen) and
Total. The 95 (RSS) and Degrees of Freedom (DF) are also reported.

## See also

lmrob() and nlrob() from robustbase (version 0.99-0)

## Examples

``` r
if (FALSE) { # \dontrun{
T1 <- fn_summary(List_Tables, modelos, catego, eq, R2, i, j)
} # }
```
