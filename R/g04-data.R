#' census_g04_age_gender
#'
#' Age and gender data from the 2016 Australian census. Data is identified at
#' the most granular statistical level (SA1) that the Australian Bureau of
#' Statistics publishes data to.
#'
#' This dataset differs from \link[censaus]{census_g01_age_gender} in that it
#' reports on individual ages from 0-79
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{age}}{Age in individual years to 79}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g04_age_gender"

#' census_g04_age_gender_grouped
#'
#' Age and gender data from the 2016 Australian census. Data is identified at
#' the most granular statistical level (SA1) that the Australian Bureau of
#' Statistics publishes data to.
#'
#' This dataset differs from \link[censaus]{census_g01_age_gender} in that it
#' reports in five year age bands all the way to 100 instead of to 85 and over.
#'
#' @format A data frame / `data.table`  with four variables:
#' \describe{
#' \item{\code{SA1_7DIGITCODE_2016}}{A 7 digit identifier for the Statistical Area 1 (SA1)}
#' \item{\code{gender}}{Gender}
#' \item{\code{age}}{Age broken into age bands}
#' \item{\code{count}}{The count of people}
#' }
#'
"census_g04_age_gender_grouped"
