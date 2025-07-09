#' theme_papers
#'
#' To standardize the graphics, the theme_papers() is created, used as
#' base theme_bw(), modifies:
#'
#'    * The font size to 12 points;
#'    * The font to sans (Arial);
#'    * The color of axis.line to black;
#'    * The plot.background is removed;
#'    * The panel.grid.minor is removed;
#'    * The panel.grid.major is removed;
#'    * The legend.position is removed.
#'
#' @param ... Other arguments passed to the theme function in ggplot2.
#'
#' @return a theme
#'
#' @import ggplot2
#'
#' @export
#' @details
#' The objective of this topic is to design graphic outputs that align with my
#' preferences and meet the specifications of the journals where I have
#' published. It is a straightforward theme without a background color, grids
#' and without legend, which facilitates a consistent style for the graphics
#' created using ggplot.
#'
#'
#' @examples
#' \dontrun{
#' p <- ggplot2::ggplot(data.frame(x = 0:10, y = 0:10 +rnorm(11)),
#' ggplot2::aes(x = x, y = y)) +
#'   ggplot2::geom_point()
#' p + Morefi::theme_papers()
#' }
#'
#'
theme_papers <- function (...) {
                  theme_bw(base_size = 12, base_family = "sans")  %+replace%
                  theme(
                        axis.line = element_line(color='black'),
                        plot.background = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.grid.major = element_blank(),
                        legend.position="none"
    )
}
