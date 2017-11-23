#' census_g32_dwelling_structure
#'
#' A dataset with information about the number of dwellings in an SLA1 area and
#' the number of people resident in the dwellings.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{occupy}}{An indicator for whether a dwelling is occupied or not}
#' \item{\code{dwelling type}}{A description of the type of dwelling}
#' \item{\code{storeys}}{The number of storeys for semi detached structures,
#' flats and apartments}
#' \item{\code{dwellings}}{The count of dwellings}
#' \item{\code{people}}{The count of people}
#' }
#'
"census_g32_dwelling_structure"
