#' census_g01_age_gender
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
"census_g01_age_gender"

#' census_g01_count_location
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
"census_g01_count_location"

#' census_g01_indigenous
#'
#' The counts of people who identify as indigenous and their heritage. Data is
#' identified at the most granular statistical level (SA1) that the Australian
#' Bureau of Statistics publishes data to.
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
"census_g01_indigenous"

#' census_birthplace
#'
#' The birthplace of the person being counted in the 2016 Australian census.
#' Data is identified at the most granular statistical level (SA1) that the
#' Australian Bureau of Statistics publishes data to.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{birthplace}}{The birthplace of the person}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g01_birthplace"

#' census_g01_citizen
#'
#' The count of citizens in the 2016 Australian census.
#' Data is identified at the most granular statistical level (SA1) that the
#' Australian Bureau of Statistics publishes data to.
#'
#' @format A data frame / `data.table`  with three variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g01_citizen"

#' census_g01_attending_education
#'
#' Age of people attending an educational institute. Data is identified at
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
"census_g01_attending_education"

#' census_g01_highest_schooling
#'
#' The highest level of schooling achieved. It does not include tertiary
#' education. Data is identified at the most granular statistical level (SA1)
#' that the Australian Bureau of Statistics publishes data to.
#'
#' This data set does include total population counts for Australia.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{highest_school_year}}{Highest year of schooling education}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g01_highest_schooling"
