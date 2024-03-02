#' fn_xseq
#'
#'
#' The function generates a data frame with a sequence for independent variable
#' (including minimum and maximum values) and selects it according to the model
#'
#' The data frame should have the same column name as the dependent variable
#' used in the fitted model
#'
#' Inside the function, the appropriate sequence is selected in function of model
#'  the mean (Ymean), lower (Ymin), and upper (Ymax) CI95% are stored in a table (Table_Y)
#'
#'
#' @param: modelos A list that defines the variables that will be taken into account for the model.
#' @param: List_x_seq A list to store the sequence of the independent variable considered for the ith fitted model.
#' @param: i An integer value indicating the regression to be analyzed
#'
#'
#' @return: xseq A one-column data frame with the sequence selected
#'
#'
#' @examples: xseq <- fn_xseq(modelos,List_x_seq, i)
#'
#'
#' @export:
fn_xseq <- function(modelos,List_x_seq, i) {
  if (modelos[[i]][1]== 1) {
    xseq <- List_x_seq[[1]]
  } else {
    if (modelos[[i]][1]== 2) {
      xseq <- List_x_seq[[2]]
    } else {
      if (modelos[[i]][1]== 4) {
        xseq <- List_x_seq[[3]]
      } else {
        xseq <- List_x_seq[[4]]
      }  # End if
    }  # End if
  }  # End if
  xseq <- data.frame(x1=xseq)
} # End fn
