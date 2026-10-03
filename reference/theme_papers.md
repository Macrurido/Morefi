# theme_papers

To standardize the graphics, the theme_papers() is created, used as base
theme_bw(), modifies:

## Usage

``` r
theme_papers(...)
```

## Arguments

- ...:

  Other arguments passed to the theme function in ggplot2.

## Value

a theme

## Details

\* The font size to 12 points; \* The font to sans (Arial); \* The color
of axis.line to black; \* The plot.background is removed; \* The
panel.grid.minor is removed; \* The panel.grid.major is removed; \* The
legend.position is removed.

The objective of this topic is to design graphic outputs that align with
my preferences and meet the specifications of the journals where I have
published. It is a straightforward theme without a background color,
grids and without legend, which facilitates a consistent style for the
graphics created using ggplot.

## Examples

``` r
if (FALSE) { # \dontrun{
p <- ggplot2::ggplot(data.frame(x = 0:10, y = 0:10 +rnorm(11)),
ggplot2::aes(x = x, y = y)) +
  ggplot2::geom_point()
p + Morefi::theme_papers()
} # }

```
