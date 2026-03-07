#' fn_fig_w
#'
#' Plot of residual structures classified by a Weighted Scale.
#'
#' The residual structure was analyzed by graphing residuals against
#' weighted values. A custom multi-panel plot illustrates the structure of each
#' fitted relationship, categorized by a color-weighted scale of values.
#'
#' To standardize the x-axis units across different fitted models, a standardized
#' residual distance, such as studentized residuals, can be used due to the
#' varying dimensions of the variables.
#'
#'  Since the parameters contain subscripts, the labels were customized using the
#' `ggplot2::as_labeller()` function and are stored in `my_labeller`. The axis
#' labels also contain subscripts and are defined in x-axis and y-axis.
#'
#' @param df A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.
#' @param opacity A numeric value for the alpha aesthetic used to control the transparency of elements in a plot.
#' @param tint A vector that specifies the palette colors used to color the points.
#' @param order A vector determines the sequence of the plots.
#' @param my_labeller Transforms objects to labeller functions. Used internally by labeller().
#' @param lab_x A string contains the x-axis label.
#' @param lab_y A string contains the y-axis label.
#' @returns A customized multi-panel plot that uses a color scale for the residual points.
#'
#' @seealso ggplot2::as_labeller()
#' @seealso ggplot2::facet_wrap
#' @seealso forcats::fct_relevel
#'
#' @import ggplot2
#' @import forcats
#'
#' @examples
#'  \dontrun{
#'  ## Data frame
#'  seed <- set.seed(123)
#'  id <- rep("LT_LS"," LT_LB", "LS_LB", each=30)
#'  ei <- c(runif(90, -2.5,2.5),runif(10, -4,4)
#'  scale <- ifelse(abs(ei) < 2, "u", ifelse(abs(ei) >= 2 & abs(ei) <2.5, "W", "o"))
#'  wi <- round(ifelse(scale=="u", runif(1, 0.9, 1), ifelse(scale=="W",
#'                     runif(1, 0.3, 0.89), runif(1, 0, 0.29))),2)
#'  df <-data.frame(id=id, ei=ei, wi=wi, scale=scale)
#'
#'  opacity <- 1/5  # alpha
#'  tint <- c("#000000","#009E73", "#56B4E9")
#'  my_labeller <- as_labeller(c(LT_LS=  "L[T]-L[S]",
#'                               LT_LB=  "L[T]-L[B]",
#'                               LS_LB=  "L[S]-L[B]",
#'                               default = label_parsed)
#'  order <- c("LT_LS", "LT_LB",  "LS_LB")
#'  lab_x <- expression(italic(e[i]))
#'  lab_y <- expression(italic(w[i]))
#'
#'
#'  p <- fn_fig_w(df, opacity, tint, my_labeller, order, lab_x, lab_y)
#'}
#'
#'@export
fn_fig_w <- function(df, opacity, tint, my_labeller, order, lab_x, lab_y){
  p <- ggplot(df, aes(x = .data$ei,
                      y = .data$wi, color= scale))+
    geom_point(shape = 19,
               size = 1,
               stroke = 1,
               alpha= opacity) +
    scale_color_manual(values = tint) +
    labs(x = lab_x, y = lab_y) +
    facet_wrap(~forcats::fct_relevel(id, order),
               scales = "free", labeller = my_labeller)
    print(p)
}
