# create translation table for meshblock 2016 to SA1

library(data.table)
library(segmentr)

path <- "/data/datasets/abs/asgs/"

mb_files <- list.files(path, pattern = "MB", full.names = TRUE)

mb_2016_reference <- lapply(mb_files, fread, colClasses = "text") %>%
  rbindlist()

devtools::use_data(mb_2016_reference, overwrite = TRUE, compress = "xz")
