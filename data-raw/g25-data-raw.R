# Import Family Composition

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g25 <- melt(fread(paste0(path, "2016Census_G25_AUS_SA1.csv")),
               id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

# TODO: Need to think about how to make sense of families as structure by ABS
