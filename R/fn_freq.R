#' fn_freq
#'
#' The function calculates a frequency distribution of data using the functions:
#' `cut()` and `table()` from the R base.
#'
#'
#' Inside the function:
#' The non-cumulative absolute frequency is calculated for each user-defined
#' class interval within the `breaks` object.
#'
#' The `breaks` object must be defined outside the function by the user. For
#' example a sequence of breakpoints of equal distance could be used.
#'
#' @param df A vector of data values.
#' @param breaks A vector with class intervals.
#' @param right Logical, indicating if the intervals should be closed on the right (and open on the left) or vice versa.
#'
#' @return A table with frequencies by class interval is returned.
#'
#' @seealso `cut()` and `table()` from the R base package.
#'
#' @examples
#' # In the df object, 30 random values between 0.1 and 0.9 are generated.
#' # The breaks object is a sequence of equal distances.
#' \dontrun{
#' df <- runif(n=30, min=0, max=1)
#' breaks <- seq(0, 1, by= 0.1)
#' freq <- fn_freq(df, breaks, right= FALSE)
#'}
#'
#' @references
#'  Yau C (2024, deck 25). Frequency Distribution of Quantitative
#' Data. R Tutorial An R Introduction to Statistics.
#' https://www.r-tutor.com/elementary-statistics/quantitative-data/frequency-distribution-quantitative-data
#'
#'
#' @export
fn_freq <- function(df, breaks, right=FALSE){
                    df <- df
                    breaks  <-  breaks
                    fcut  <-  cut(df, breaks, right= right)
                    freq <- table(fcut)
                    }
