# Import G04 - Age by Sex

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g04a <- melt(fread(paste0(path, "2016Census_G04A_AUS_SA1.csv")),
               id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)
dt_g04b <- melt(fread(paste0(path, "2016Census_G04B_AUS_SA1.csv")),
                id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)


dt_g04 <- rbind(dt_g04a, dt_g04b)

# assign gender for all records

# assign gender
dt_g04[, gender := str_right(variable, 1)]
dt_g04[gender == "M", gender := "Male"]
dt_g04[gender == "F", gender := "Female"]
dt_g04[gender == "P", gender := "All persons"]

# Age & Gender (individual years) -----------------------------------------

# filter for age data
dt_tmp <- dt_g04[(variable %like% "^Age_yr_\\d") & gender != "All persons" &
                   value > 0]
dt_tmp <- dt_tmp[!(grepl("\\d(|\\d)_\\d(|\\d)", variable) |
                     grepl("\\d\\d\\d", variable))]

# assign age
dt_tmp[variable %like% "^Age_yr_", age :=
         gsub("\\D", "", variable)]
dt_tmp[variable %like% "^Age_yr_100", age := "100+"]

census_g04_age_gender <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                    count = value)]
devtools::use_data(census_g04_age_gender, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Age & Gender (bandings of years) ----------------------------------------
# filter for age data
dt_tmp <- dt_g04[((variable %like% "^Age_yr_\\d(|\\d)_\\d") |
                    (variable %like% "^Age_yr_\\d\\d\\d")) &
                   gender != "All persons" &
                   value > 0]

# assign age
dt_tmp[variable %like% "^Age_yr_", age :=
         gsub("_", "-", str_mid(variable, 8, from_end = 2))]
dt_tmp[variable %like% "^Age_yr_100", age := "100+"]

census_g04_age_gender_grouped <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                    count = value)]
devtools::use_data(census_g04_age_gender_grouped, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

