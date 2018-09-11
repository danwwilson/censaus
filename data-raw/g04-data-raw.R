# Import Age by Sex
# NOTE: This is covered largely by census_g01_age_gender dataset. The only
#       advantage with this dataset is that it looks at age bands up to 100+
#       rather than to 85+.
#       Opting to just make census_g01_age_gender available unles requested
#       otherwise.

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g04a <- melt(fread(paste0(path, "2016Census_G04A_AUS_SA1.csv")),
                id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

dt_g04b <- melt(fread(paste0(path, "2016Census_G04B_AUS_SA1.csv")),
                id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

dt_g04 <- rbindlist(list(dt_g04a[value > 0], dt_g04b[value > 0]))
rm(dt_g04a, dt_g04b)

# assign gender for all records

# assign gender
dt_g04[, gender := str_right(variable, 1)]
dt_g04[gender == "M", gender := "Male"]
dt_g04[gender == "F", gender := "Female"]
dt_g04[gender == "P", gender := "All persons"]

# Determine Age -----------------------------------------------------------
dt_tmp <- dt_g04[variable %like% "^Age" & gender != "All persons"]

# assign age
dt_tmp[variable %like% "^Age_", age := str_mid(variable, 8, from_end = 2)]
census_g04_age_gender <- dt_tmp[age %like% "_",
                                .(SA1_7DIGITCODE_2016, age, gender,
                                  count = value)]

# devtools::use_data(census_g04_age_gender, overwrite = TRUE, compress = "xz")
rm(dt_tmp)
