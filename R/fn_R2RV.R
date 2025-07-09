#' fn_R2RV
#'
#' The function calculates a robust version of the coefficient of determination
#' R2RV using the equation Summary values fitted with the robustbase::nlrob() function.
#'
#' This is the consistency corrected robust coefficient of determination by
#' Renaud and Victoria-Feser (2010) which allows for a possible correction
#' factor a for consistency considerations.
#'
#' Inside the function:
#' The vectors of observed (y1), predicted (yc) and weighted (W)
#' values are obtained from the summary model (eq).
#'
#' The value of the Weighted Estimate Average (ywea), the modified sum of
#' squares for explained (SSEw), total (SSTw), and residual (SSRw)
#' were estimated.
#'
#' The correction factor value for consistency considerations a for 95 percent
#' was also obtained from summary model (eq).
#'
#' A vector with the robust version of the coefficient of determination R2wa
#' and its adjusted value R2wa_adj were returned as a vector.
#'
#' @param eq Summary of the equation fitted.
#'
#' @return
#' A vector with the robust version of the coefficient of determination
#' R2wa and its adjusted value R2wa_adj were returned as a vector.
#'
#' @examples
#' \dontrun{
#' R2wa <- fn_R2RV(eq)
#'}
#'
#' @references
#' Renaud, O., & Victoria-Feser, M. P. (2010). A robust coefficient
#'  of determination for regression. Journal of Statistical Planning and
#'  Inference, 140(7), 1852-1862. doi:10.1016/j.jspi.2010.01.008.
#'
#'
#' @export
fn_R2RV <- function(eq){
  w <- eq$rweights   # w a vector of weights values
  yc <- eq$fitted.values # yc a vector of predicted values
  ywea <-  (1/sum(w)) * sum(w*yc) # a value of the Weighted Estimate Average
  df <- summary(eq)$df[2]
  SSEw <- sum(w*(yc-ywea)^2)
  SSRw <- (eq[["Scale"]]^2)*df
  a <- environment(eq[["psi"]])[["cc"]]
  R2wa <- SSEw/(SSEw+a*SSRw)
  R2wa_adj <- 1-(1-R2wa)*((length(yc)-1)/df)
  R2was <- c(R2wa,R2wa_adj)
  print(R2was)
}
