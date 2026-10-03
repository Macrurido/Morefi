# fn_freq

The function calculates a frequency distribution of data using the
functions: \`cut()\` and \`table()\` from the R base.

## Usage

``` r
fn_freq(df, breaks, right = FALSE)
```

## Arguments

- df:

  A vector of data values.

- breaks:

  A vector with class intervals.

- right:

  Logical, indicating if the intervals should be closed on the right
  (and open on the left) or vice versa.

## Value

A table with frequencies by class interval is returned.

## Details

Inside the function: The non-cumulative absolute frequency is calculated
for each user-defined class interval within the \`breaks\` object.

The \`breaks\` object must be defined outside the function by the user.

## References

Yau C (2024, deck 25). Frequency Distribution of Quantitative Data. R
Tutorial An R Introduction to Statistics.
https://www.r-tutor.com/elementary-statistics/quantitative-data/frequency-distribution-quantitative-data

## See also

\`cut()\` and \`table()\` from the R base package.

## Examples

``` r
# In the df object, 30 random values between 0.1 and 0.9 are generated.
# The breaks object is a sequence of equal distances.
if (FALSE) { # \dontrun{
df <- runif(n=30, min=0, max=1)
breaks <- seq(0, 1, by= 0.1)
freq <- fn_freq(df, breaks, right= FALSE)
} # }
```
