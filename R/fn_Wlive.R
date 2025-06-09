#' fn_Wlive
#'
#' Estimation of live weight based on landed categories.
#'
#' The live weight, which is the total weight of an organism, is estimated based
#' on the weights of different landing categories, such as eviscerated weight and
#' fillet weight. These estimates are derived using regression parameters that
#' relate total weight to the weight of each landing category.
#'
#' @param List_Tables A list with summary regression results.
#' @param mfi A character vector to define the models to be used.
#' @param List_TCCT  A list with ARSS results.
#' @param Biomass A data frame with official catches.
#'
#' @returns A data frame containing official catch data and estimated live weights.
#'
#' @examples
#'  \dontrun{
#'  wlive <- fn_Wlive(List_Tables, mfi, List_TCCT, Biomass)
#'  }
#' @export
fn_Wlive <- function(List_Tables, mfi, List_TCCT, Biomass){
  for(i in 1 : length(mfi)){
    # Parameters for WT vs WB
    b0 <- List_Tables[[mfi[i]]][i,4]
    b1 <- List_Tables[[mfi[i]]][i,6]
    SE <- sqrt(as.numeric(List_TCCT[[mfi[i]]][i,3])/
                 as.numeric(List_TCCT[[mfi[i]]][i,4]))
    # Biomass calculation
    Bio_med <- ((catch_g$Landed[i+1]/b1)-b0)/1000
    Biomass[3,i] <- Bio_med
    Biomass[4,i] <- (Bio_med - 1.96 * SE)     # CI95% lower
    Biomass[5,i] <- (Bio_med + 1.96 * SE)     # CI95% upper
  }

  (Biomass <- type.convert(Biomass))
}

