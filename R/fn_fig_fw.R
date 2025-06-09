#' fn_fig_fw
#'
#' Fitted values multi-panel plot using facet_wrap()
#'
#' The fitted values of the models for a landed presentation category were
#' displayed as a multi-panel plot using the `fn_fig_fw()` function. The observed
#' data points for each fitted relationship were categorized according to a
#' weighted color scale.
#'
#' Since the parameters contain subscripts, the labels were customized using the
#' `ggplot2::as_labeller()` function and are stored in `my_labeller`.
#'
#' @param df A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.
#' @param opacity A numeric value for the alpha aesthetic used to control the transparency of elements in a plot.
#' @param tint A vector that specifies the palette colors used to color the points.
#' @param scale A numeric vector that defines the thresholds for coloring the points.
#' @param order A vector determines the sequence of the plots.
#' @param my_labeller Transforms objects to labeller functions. Used internally by labeller().
#'
#' @returns A customized multi-panel plot that uses a color scale for the residual points.
#'
#' @seealso ggplot2::scale_colour_steps
#' @seealso ggplot2::as_labeller
#' @seealso forcats::fct_relevel
#'
#' @import ggplot2
#' @import forcats
#'
#' @examples
#' \dontrun{
#'  df <- df
#'  opacity <- 1/5  # alpha
#'  tint <- c("#000000","#009E73", "#56B4E9")
#'  X_names <- c(LT_LS, WT_WS, LT_WT)
#'  wi_scale <- c(0, 0.249, 0.99, 1)
#'  my_labeller <- my:labeler
#'
#'  p <- fn_fig_fw(df, opacity, tint, scale= wi_scale,
#'                order=X_names, my_labeller)
#'}
#'
#' @export
fn_fig_fw <- function(df, opacity, tint, scale, order, my_labeller){
    p <- ggplot(df, aes(x= x, y= y, color = wi)) +
    geom_point(shape = 19,
               size = 1.3,
               stroke = 1,
               alpha = opacity) +
    scale_color_stepsn(colours = tint,
                       breaks = scale) +
    geom_line(aes(y = fitt),
              colour="#000000",
              linewidth = 1) +
    facet_wrap(~forcats::fct_relevel(id, order),
               scales = "free", labeller = my_labeller)+
    theme(strip.text = element_text(face = "italic"))
  print(p)
}
