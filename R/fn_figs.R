#' fn_figs
#'
#' Individual plots for fitted models values.
#'
#' The function creates a scatter plot with the observed values (points),
#' fitted regression (solid line) and its confidence interval (shaded area)
#'
#' @param datos A data frame contains the following variables: independent (x) and dependent (y) variables, the fitted variable (fitt), a weighted variable (wi), and additional details including the weights (wi), fitted values (fitt), residuals (ei), and the scale.
#' @param CIPI A data frame containing the values of: independent variable (xseq); fitted values, confidence and predicted interval (lower and upper values).
#' @param i An integer value indicating the regression analyzed.
#' @param etiquetas A list indicating the labels of the axes and their unit of measurement.
#' @param modelos A list of variables that are used for the regression model.
#'
#' @return Fig a customized scatter plot.
#'
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#'  FY <- fn_figs(datos, CIPI, i, etiquetas, modelos)
#'}
#'
#' @export
fn_figs <- function(datos, CIPI, i, etiquetas, modelos){
          Fig <- ggplot(CIPI,aes(x = CIPI[,1])) +
                 geom_ribbon(aes(x = CIPI[,1], ymin = CIPI[,3], ymax = CIPI[,4],
                                 fill = "aquamarine"), alpha = 1/50)    +
                 geom_ribbon(aes(x = CIPI[,1], ymin = CIPI[,5], ymax = CIPI[,6],
                                 fill = "grey", alpha = 1/50)) +
                 geom_line(aes(x= CIPI[,1], y = CIPI[,2])) +
                 geom_point(datos, mapping=aes(x= datos[,1], y = datos[,2],
                                 shape = factor(datos[,4]), stroke = 1,
                                 fill = datos[,4]), alpha = 1/10)+
                 labs(tag = letters[i],x= etiquetas[modelos[[i]][1]],
                                 y = etiquetas[modelos[[i]][2]])
          print(Fig)
}   # End fn_figs
