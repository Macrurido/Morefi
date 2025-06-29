#' fn_ARSS
#'
#' The function fn_ARSS perform the Coincident Curves Test, to determine if there
#' are significant differences between the fitted curves for each database.It is
#' based on the Analysis of the Residual Sum of Squares (ARSS) (Chen et al. 1992).
#'
#' The residual sum of squares (RSS) and the degrees of freedom (DF) for each
#' fitted regression are stored previously in the List_TCCT list. Calculations
#' for ARSS are also stored here.
#'
#' Inside the function, the RSS and DF for the joined sample are calculated to
#' perform the F test for two tails alpha/2. The decision criteria is performed:
#' "*" if the p-value is less than or equal to alpha or "NS" if the p-value is
#' greater than alpha.
#'
#' The function requires defining.
#'
#' @param List_TCCT An empty list to save the matrix results from each regression.
#' @param i An integer value indicating the ith regression analyzed.
#' @param alfa A numerical value that defines the significance level. If this is not set, the default number is 0.05.
#'
#' @return
#' List_TCCT calculations for ARSS are stored here
#'
#' @importFrom stats qf pf
#'
#' @seealso FDist from the package stats (version 4.4.0)
#'
#' @examples
#' \dontrun{
#'
#' # The Total length (LT) - Total weight (WT) was estimated for the bullseye puffer
#' # *Sphoeroides annulatus* for landed categories: Fresh, Frozen-thawed (Frozen), Total
#' # (All sample) and Joined (sum of values of Fresh and Frozen). The Residual Sum of
#' # Squares (RSS) and the degrees of freedom (DF) are provided for each data source.
#' # In the table the first row displays the Analysis of Residual Sum of Squares (ARSS),
#' # the p-value (p), and the decision criteria for the ARSS test (Criteria).
#'
#' # The adjusted models show the following data: Fresh SSR=   and DF= 742; Frozen
#' # SSR= 1280131.81 and DF= 651; and the total sample SSR= 6115874.53 and DF= 1395.
#' # Values are stored in the table `Table_CC`, this is stored in a list, and the name
#' # of each item is built with the acronyms of the model variables (e.g. LTWT).
#'
#' Table_CC <- data.frame(matrix(NA,nrow=4,ncol=8))
#' Table_CC[1,1] <- "Lt-WT"
#' Table_CC[,2] <- c("Fresh","Frozen","Total","Joined")
#' colnames(Table_CC) <- c("Model","Category","RSS","DF","ARSS","F-table","p-value","Criteria")
#'
#' Table_CC[1,3] <- 4424418.33
#' Table_CC[1,4] <-  742
#' Table_CC[2,3] <- 1280131.81
#' Table_CC[2,4] <-  651
#' Table_CC[3,3] <- 6115874.53
#' Table_CC[3,4] <-  1395
#'
#' List_ARSS <- list(LTWT=Table_CC)
#'
#' i <- 1
#'
#' ARSS <- fn_ARSS(List_ARSS, i,  alfa= 0.05)
#' ARSS[[i]]
#'}
#'
#' @export
fn_ARSS <- function(List_TCCT, i,  alfa= 0.05){
  T  <- list()
  for (i in 1:length(List_TCCT)){

    T1 <- List_TCCT[[i]]
    lvar <- names(List_TCCT[i])

    T1[1,1] <- paste0(substr(lvar,1,2)," vs. ",
                      substr(lvar,3,nchar(lvar)))
    # RSSs sum of the RSS of each regression fitted
    T1[4,3] <- round(sum(as.numeric(T1[1,3]),
                         as.numeric(T1[2,3])),2)

    # DF Sum GL1 + GL2
    T1[4,4] <- sum(as.numeric(T1[1,4]),as.numeric(T1[2,4]))

    # F calculated (Fc)
    T1[1,5] <- round(abs((as.numeric(T1[3,3])-as.numeric(T1[4,3]))/
                           as.numeric(T1[4,3])),4)

    # F table (critical value)
    T1[1,6] <- round(qf(alfa, as.numeric(T1[3,4]),
                        as.numeric(T1[4,4]),
                        lower.tail= FALSE),4)

    # p-value for two tails
    P_value <- pf(as.numeric(T1[1,6]),
                  as.numeric(T1[4,4]),
                  as.numeric(T1[3,4]),
                  lower.tail=FALSE)

    T1[1,7] <- if(P_value>1-alfa){
      "p>0.95"
    } else {
      format(P_value, format= "e", digits = 4)
    } # End if

    # Decision criteria
    T1[1,8] <-  if(P_value>alfa){
      "NS"
    } else {
      "*"
    } # End if
    T[[i]] <- as.data.frame(T1)
  } # End for
  return(T)
}  # End function

#' @references
#'  Chen Y., Jackson, D. A., & Harvey, H. H. 1992. A comparison of
#' von Bertalanffy and polynomial functions in modelling fish growth data.
#' Can. J. Fish. Aquat. Sci. 49(6): 1228–1235. https://doi.org/10.1139/f92-13
