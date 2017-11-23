str_right <- function(x, n) {
  substr(x, nchar(x) - n + 1, nchar(x))
}

str_left <- function(x, n) {
  substr(x, 1, n)
}

str_mid <- function(x, start, length, from_end) {
  if (!missing(length)  & !missing(from_end))
    stop("str_mid cannot have both a length and from_end paramater provided")

  if (missing(length)  & missing(from_end))
    stop("str_mid requires either the length or from_end paramater")

  if (!missing(length))
    mid <- substr(x, start, start + length - 1)

  if (!missing(from_end))
    mid <- substr(x, start, nchar(x) - from_end)

  mid
}
