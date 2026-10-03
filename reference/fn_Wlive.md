# fn_Wlive

Estimation of live weight based on landed categories.

## Usage

``` r
fn_Wlive(List_Tables, mfi, List_TCCT, Biomass)
```

## Arguments

- List_Tables:

  A list with summary regression results.

- mfi:

  A character vector to define the models to be used.

- List_TCCT:

  A list with ARSS results.

- Biomass:

  A data frame with official catches.

## Value

A data frame containing official catch data and estimated live weights.

## Details

The live weight, which is the total weight of an organism, is estimated
based on the weights of different landing categories, such as
eviscerated weight and fillet weight. These estimates are derived using
regression parameters that relate total weight to the weight of each
landing category.

## Examples

``` r
 if (FALSE) { # \dontrun{
 wlive <- fn_Wlive(List_Tables, mfi, List_TCCT, Biomass)
 } # }
```
