#' fn_intervals
#'
#' The function calculates a non parametric confidence and predicted intervals
#' using the function predFit from the package investr (version 1.4.2).
#'
#' @param xseq A vector with a sequence for independent variable.
#' @param eq Summary of the equation fitted.
#'
#' @return df a data frame with the xseq (x1), the fitted values for dependent variable (fit), the low and upper confident (IC_L and IC_U) and predicted intervals (IP_L and IP_U).
#'
#' @import investr
#'
#' @seealso predFit() from the package investr (version 1.4.2)
#'
#' @examples
#' \dontrun{
#'  intervalos <- fn_intervals(xseq,eq)
#'}
#'
#' @export
fn_intervals <- function(eq,xseq){
                    new.data <- as.data.frame(xseq)
                    #str(predFit(eq, new.data, se.fit = TRUE))
                    CI95 <- predFit(eq, newdata = new.data,
                                    interval = "confidence",level=0.95)
                    PI95 <- predFit(eq, newdata = new.data,
                                    interval = "prediction",level=0.95)

                    df <- as.data.frame(cbind(xseq,CI95,PI95[,-1]))
                    colnames(df) <- c("x1", "fit","CI_L","CI_U", "PI_L","PI_U")
                    df
                    }

