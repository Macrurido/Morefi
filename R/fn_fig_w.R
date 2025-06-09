#' fn_fig_w
#'
#' Plot of residual structures classified by a Weighted Scale.
#'
#' The residual structure was analyzed by graphing standardized residuals against
#' weighted values. A custom multi-panel plot illustrates the structure of each
#' fitted relationship, categorized by a color-weighted scale of values.
#'
#' To unify the x-axis units among the different fitted models, standardized
#' residuals were utilized due to the varying dimensions of the variables.
#'
#'  Since the parameters contain subscripts, the labels were customized using the
#' `ggplot2::as_labeller()` function and are stored in `my_labeller`.
#'
#' @param df A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.
#' @param opacity A numeric value for the alpha aesthetic used to control the transparency of elements in a plot.
#' @param tint A vector that specifies the palette colors used to color the points.
#' @param order A vector determines the sequence of the plots.
#' @param my_labeller Transforms objects to labeller functions. Used internally by labeller().
#'
#' @returns A customized multi-panel plot that uses a color scale for the residual points.
#'
#' @seealso ggplot2::as_labeller()
#' @seealso ggplot2::facet_wrap
#' @seealso forcats::fct_relevel
#'
#' @import ggplot2
#' @import forcats
#'
#' @importFrom stats sd
#'
#'
#' @examples
#'  \dontrun{
#'
#'  p <- fn_fig_w(df, opacity,tint, my_labeller
#'                order= X_names)
#'}
#'
#' @export
fn_fig_w <- function(df, opacity, tint, my_labeller, order){
  p <- ggplot(df, aes(x = ei/sd(ei),
                      y = wi, color= scale))+
    geom_point(shape = 19,
               size = 1,
               stroke = 1,
               alpha= opacity) +
    scale_color_manual(values = tint) +
    facet_wrap(~forcats::fct_relevel(id, order),
               scales = "free", labeller = my_labeller)
    print(p)
}
