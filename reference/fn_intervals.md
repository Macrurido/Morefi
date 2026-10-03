# fn_intervals

The function calculates a non parametric confidence and predicted
intervals using the function predFit from the package investr (version
1.4.2).

## Usage

``` r
fn_intervals(eq, xseq)
```

## Arguments

- eq:

  Summary of the equation fitted.

- xseq:

  A vector with a sequence for independent variable.

## Value

df a data frame with the xseq (x1), the fitted values for dependent
variable (fit), the low and upper confident (IC_L and IC_U) and
predicted intervals (IP_L and IP_U).

## See also

predFit() from the package investr (version 1.4.2)

## Examples

``` r
if (FALSE) { # \dontrun{
 intervalos <- fn_intervals(xseq,eq)
} # }
```
