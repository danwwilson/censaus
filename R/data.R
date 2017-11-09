#' @importFrom data.table data.table
NULL

#' census_age_gender
#'
#' Age and gender data from the 2016 Australian census. Data is identified at
#' the most granular statistical level (SA1) that the Australian Bureau of
#' Statistics publishes data to.
#'
#' This data set does include total population counts for Australia.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{age}}{Age broken into age bands}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_age_gender"

#' census_count_location
#'
#' Location of where people where on counting night of the 2016 Australian
#' census. Data is identified at the most granular statistical level (SA1) that
#' the Australian Bureau of Statistics publishes data to.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{location}}{The location of the person on counting night}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_count_location"

#' census_indigenous
#'
#' Location of where people where on counting night of the 2016 Australian
#' census. Data is identified at the most granular statistical level (SA1) that
#' the Australian Bureau of Statistics publishes data to.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{heritage}}{The indigenous heritage of the Australian it includes
#'   the values of \code{Aboriginal}, \code{Torres Strait Islander},
#'   {\code{Aboriginal & Torres Strait Islander} and \code{Total}}}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_indigenous"



