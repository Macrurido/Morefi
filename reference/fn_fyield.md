# fn_fyield

The function calculates the fillet yield by dividing the 250 g benchmark
(bm) by the mean, lower, and upper confidence interval of 95 fillet
weight, respectively. These values are obtained from the list items
l_intervals\$CI returned by the fn_intervals function.

## Usage

``` r
fn_fyield(i, bm, df)
```

## Arguments

- i:

  An integer value that indicates which regression analysis to use.

- bm:

  An integer value used as a benchmark.

- df:

  A data frame with landed weights for each category.

## Value

Table_Y a table with fillet yield results.

## Details

If the analyzed regression has fillet weight as an independent variable,
then values are calculated. An "if statement" is written for this
propose.

Fillet yield was calculated for a sequence of the independent variable
(including minimum and maximum values).

Inside the function, the mean (Ymean), lower (Ymin), and upper (Ymax)
CI95 are stored in a table (Table_Y)

## See also

fn_intervals() customized for the present work

mutate() from the package dplyr (version 1.0.10)

## Examples

``` r
if (FALSE) { # \dontrun{
 FY <- fn_fyield(i,bm,df)
} # }
```
