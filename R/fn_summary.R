#' fn_summary
#'
#' The function customizes and stores the summary of each fitted regression.
#'
#' Table T1 is a customized table to store the regression summarized by model
#' and landed weight categories: Fresh, Frozen-thawed (Frozen) and Total. The
#' 95% confidence interval parameter is in parentheses. Residual standard error
#' (RSS) and Degrees of Freedom (DF) are also reported.
#'
#' @param List_Tables A list to store summary regression results.
#' @param modelos A character vector containing the variables of a function.
#' @param catego A character vector containing the landed weight categories.
#' @param eq Summary of the equation fitted.
#' @param R2 A numeric value of the adjusted robust version of the coefficient of determination.
#' @param i An integer value indicating the ith regression analyzed.
#' @param j An integer value indicating the jth categorie analyzed.
#'
#' @return List_Tables with a customized table that stores the regression summary of each model.
#'
#' @import robustbase
#' @importFrom stats confint.default
#'
#' @seealso lmrob() and nlrob() from robustbase (version 0.99-0)
#'
#' @examples
#' \dontrun{
#' T1 <- fn_summary(List_Tables, modelos, catego, eq, R2, i, j)
#'}
#'
#' @export
fn_summary <- function(List_Tables, modelos, catego, eq, R2, i, j){

  T1 <- List_Tables[[i]]
  lvar <- names(List_Tables[i])

  T1[1,1] <- ifelse (i<7,"Linear","Potential")
  T1[1,2] <- paste0(substr(lvar,1,2)," vs. ",
                    substr(lvar,3,nchar(lvar)))
  T1[j,3] <- catego[j]
  T1[j,4] <- eq$coefficients[1]                          # b0
  T1[j,5] <- paste0("(",round(confint.default(eq)[1,1],2)," to ",
                    round(confint.default(eq)[1,2],2), ")") #b0 IC95%
  T1[j,6] <- eq$coefficients[2]
  T1[j,7] <- paste0("(",round(confint.default(eq)[2,1],2)," to ",
                    round(confint.default(eq)[2,2],2), ")")
  T1[j,8] <- as.numeric(R2)
  T1[j,9] <- summary(eq)$df[2]

  print(T1[j,])

} # End fn_summary
