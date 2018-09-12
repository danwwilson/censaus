#' census_g38_dwelling_structure
#'
#' Dwelling structure and number of bedroom data from the 2016 Australian
#' census. Data is identified at the most granular statistical level (SA1)
#' that the Australian Bureau of Statistics publishes data to.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{structure}}{The stucture of the dwelling}
#' \item{\code{bedrooms}}{The number of bedrooms in the dwelling}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g38_dwelling_structure"
