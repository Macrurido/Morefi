#' fn_fyield
#'
#'
#' The function calculates the fillet yield by dividing the 250 g benchmark (bm) by
#' the mean, lower, and upper confidence interval of 95% (IC95%) of the estimated
#' fillet weight, respectively. These values are obtained from the list items
#' l_intervals$CI returned by the fn_intervals function
#'
#' If the analyzed regression has fillet weight as an independent variable,
#' then values are calculated. An "if statement" is written for this propose.
#'
#' Fillet yield was calculated for a sequence of the independent variable
#' (including minimum and maximum values).
#'
#' Inside the function, the mean (Ymean), lower (Ymin), and upper (Ymax) CI95%
#' are stored in a table (Table_Y)
#'
#'
#' @param: i An integer value that indicates which regression analysis to use
#' @param: bm An integer value used as a benchmark.
#' @param: df A data frame with landed weights for each category
#'
#'
#' @return: Table_Y a table with fillet yield results
#'
#' @seealso: fn_intervals() customized for the present work
#' @seealso: mutate() from the package dplyr (version 1.0.10)
#'
#'
#' @examples: FY <- fn_fyield(i,bm,df)
#'
#'
#' @export:
fn_fyield <- function(i,bm,df){
                  Table_Y <- df
                  Table_Y <- dplyr::mutate(Table_Y,
                                           Yfit=   bm/Table_Y[,2],
                                           YIC_L=  bm/Table_Y[,3],
                                           YIC_U=  bm/Table_Y[,4],
                                           YIP_L=  bm/Table_Y[,5],
                                           YIP_U=  bm/Table_Y[,6]
                                           )
                  return(Table_Y)
            }   # End fn
