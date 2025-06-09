#' fn_freqw
#'
#' This is a methodological function to calculate the percentage frequencies of
#' weights by model adjusted using the robust regression approach.
#'
#' The function calculates the relative frequency distribution using the
#' function `fn_freq` from `Morefi` package.
#'
#' For `fn_freq`, the breaks object must be defined. For this work, a sequence of
#' breakpoints of equal distance is used. To incorporate the number of
#' non-weighted values (wi=1), a class interval "1" is added to the sequence.
#'
#' @param df A vector of data values.
#' @param breaks A vector with class intervals
#' @param right Logical, indicating if the intervals should be closed on the right (and open on the left) or vice versa.
#'
#' @return A table with frequencies by class interval is returned.
#'
#' @seealso fn_freq` from `Morefi` package; `cut()` and `table()` from the R base package.
#'
#'
#' @examples
#' # In the df object, 30 random values between 0.1 and 0.9 are generated and
#' # five values equal to 1 are added.
#' # The breaks object is defined to include non-weighted values (wi=1), weighted
#' # values (wi lower than 1 and equal to or higher than 0.25), and outliers
#' # (wi lower than 0.25).
#'
#' \dontrun{
#' df <- c(runif(n=30, min=0, max=1),rep(1,5))
#' breaks  <-  c(0, 0.249, 0.99, 1)
#'
#' freq <- fn_freqw(df, breaks, right=FALSE)
#'}
#'
#' @export
fn_freqw <- function(df, breaks, right=FALSE){
                    freq <- fn_freq(df, breaks, right=FALSE)
                    nw <- length(which(df ==1))
                    freq <- c(freq, nw)
                    freq <-  100*freq/length(df)
                    }
