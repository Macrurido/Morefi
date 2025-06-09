#' Biometric data of the bullseye puffer
#'
#' Biometric data of the bullseye puffer *Sphoeroides annulatus*
#' collected from the Sinaloa coast of the Mexican Pacific Ocean.
#'
#' The variable 'Fleet' classifies types of fishing: artisanal (fresh market)
#' as 1 and trawling (frozen-thawed market) as 2.
#'
#' For further information, please refer to the article by Aguirre-Villaseñor
#' et al. (submitted).
#'
#' @format ## `Botete`
#' A data frame with 1397 obs. of  7 variables:
#' \describe{
#'   \item{LT}{Total length (cm)}
#'   \item{LS}{Standard length (cm)}
#'   \item{LB}{Body trunk length (cm)}
#'   \item{WT}{Total weight (g)}
#'   \item{WB}{Body trunk weight (g)}
#'   \item{Wfi}{Fillet weight (g)}
#'   \item{Fleet}{Fleet code 1: artisanal fishing and two trawling methods}
#' }
#' @source <https://github.com/Macrurido/Morefi.git>
#' @references
#' Aguirre-Villaseñor, H., Morales-Bojórquez, E., Cisneros-Mata (FISH13711).Biometric
#' relationships as a fisheries management tool: A case study of the bullseye puffer
#' (Sphoeroides annulatus. Tetraodontidae). Fisheries Research.
#'
"Botete"

#' Records of the bullseye puffer catch landed.
#'
#' This data set provides records of the bullseye puffer catch landed on the
#' Pacific coast of Mexico in 2023. It includes information on Biomass (live
#' weight) for each commercial landed presentation : total weight (WT), body
#' trunk weight (WB), and fillet weight (Wfi). The data also indicates whether
#' the catch was Fresh or Frozen-thawed. Values are provided in Mexican pesos
#' per landed category and per kilogram of landed weight (SIPESCA, 2024).
#'
#' Category includes five commercial landed presentations:
#' whole fresh (WT_Fresh);  body trunk fresh (WB_Fresh),
#' body trunk Fresh-Thawed (WB_Fresh_Thawed); fillet fresh (Wfi_Fresh),
#' and the sum of total (Total).
#'
#' @format ## `Botete_land`
#' A data frame with 5 obs. of  5 variables:
#' \describe{
#'   \item{Category}{Landed presentation.}
#'   \item{Landed}{Landed weigth by category (g).}
#'   \item{Biomass}{Converted landed category weigth to total weight (g).}
#'   \item{Pesos}{Value in Mexican pesos per landed category.}
#'   \item{Pesos_kg}{Mean value per kilogram of landed weight.}
#' }
#'
#' @source <https://github.com/Macrurido/Morefi.git>
#' @references
#' Aguirre-Villaseñor, H., Morales-Bojórquez, E., Cisneros-Mata (FISH13711).Biometric
#' relationships as a fisheries management tool: A case study of the bullseye puffer
#' (Sphoeroides annulatus. Tetraodontidae). Fisheries Research.
#'
#' @references
#' SIPESCA. 2024. Sistema de Información de Pesca y Acuacultura – SIPESCA.
#' Comisión Nacional de Pesca y Acuacultura. <https://sipesca.conapesca.gob.mx>
#'  (accessed 7 February 2024).
#'
"Botete_land"
