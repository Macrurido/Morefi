# fn_xseq

The function creates a data frame containing a sequence for the selected
independent variable based on the model. The lower end of the range is
determined by rounding down the minimum value to the nearest multiple of
the specified "bin" step size, while the upper end is determined by
rounding up the maximum value.

## Usage

``` r
fn_xseq(df, modelos, bin, i)
```

## Arguments

- df:

  A data frame includes the morphological variables.

- modelos:

  A list defining the numerical column variables for the model.

- bin:

  A vector contains the step size for each independent variable in every
  model.

- i:

  An integer value indicating the regression to be analyzed.

## Value

xseq A one-column data frame with the sequence selected.

## Details

The data frame should have the same column name as the dependent
variable used in the fitted model.

## Examples

``` r
# One model: x_y

if (FALSE) { # \dontrun{
x <- sample(8:44, 30, replace = TRUE)
y <- sample(20:100, 30, replace = TRUE)
df <- as.data.frame(cbind(x,y))
modelos <- list (x_y = c(1,2))
i <- 1
bin <- c(5)
xseq <- fn_xseq(df, modelos, bin, i)
} # }
# Two models: x_y and x_z
if (FALSE) { # \dontrun{
z <- sample(100:1000, 30, replace = TRUE)
df <- cbind(x,y,z)
modelos <- list (x_y = c(1,2), y_z = c(2,3))
bin <- c(2, 100)
i <- 1
xseq1 <- fn_xseq(df, modelos, bin, i)
i <- 2
xseq2 <- fn_xseq(df, modelos, bin, i)
} # }
```
