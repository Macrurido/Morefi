#' fn_fig_cs
#'
#' Graph of the fitted model with a point color scale.
#'
#' This function creates a graph displaying the fitted model (line) alongside
#' the observed values (points), which are colored according to a weighted color scale.
#'
#' @param df A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.
#' @param opacity A numeric value for the alpha aesthetic used to control the transparency of elements in a plot.
#' @param tint A vector that specifies the palette colors used to color the points.
#' @param scale A numeric vector that defines the thresholds for coloring the points.
#' @param etiquetas A list indicating the labels of the axes and their unit of measurement.
#' @param modelos A list of variables that are used for the regression model.
#' @param i An integer value indicating the regression analyzed.
#'
#' @return An individual plots for fitted models with a point color scale.
#'
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' df <- df
#' p <- fn_fig_cs(df, opacity, tint, scale, etiquetas, modelos, i)
#'}
#'
#' @export
fn_fig_cs <- function(df, opacity, tint, scale, etiquetas, modelos, i){
  # To address the message: "no visible binding for global variable."
#  x <- y <- wi <- fitt <-   NULL
#  utils::globalVariables(names(df), package="Morefi", add=F)
  #The plot
    p <- ggplot(df, aes(x, y, color = wi)) +
    geom_point(shape = 19,
               size = 1.3,
               stroke = 1,
               alpha = opacity) +
    scale_color_stepsn(colours = tint,
                       breaks = scale) +
    geom_line(aes(y = fitt),
              colour="#000000",
              linewidth = 1)+
    labs(tag = letters[i],
         x= etiquetas[modelos[[i]][1]],
         y = etiquetas[modelos[[i]][2]])
  print(p)
}
