# Import Social Marital Status by Age by Sex

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g06 <- melt(fread(paste0(path, "2016Census_G06_AUS_SA1.csv")),
               id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

# remove records for all persons and totals and areas with 0 totals
dt_tmp <- dt_g06[!(variable %like% "^P") & !(variable %like% "_Tot")
                 & value > 0]

# assign gender for all records

# assign gender (using this method rather than ifelse() as it is quicker)
dt_tmp[, gender := str_left(variable, 1)]
dt_tmp[gender == "M", gender := "Male"]
dt_tmp[gender == "F", gender := "Female"]

# assign age
dt_tmp[, age := gsub("_", "-", str_mid(variable, 3, 5))]
dt_tmp[age == "85ov-", age := "85+"]

# assign marital status
dt_tmp[variable %like% "reg_marrge", marital_status := "Registered Marriage"]
dt_tmp[variable %like% "de_facto", marital_status := "De Facto Marriage"]
dt_tmp[variable %like% "Not_married", marital_status := "Not_married"]

# create dataset
census_g06_marital_status <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                        marital_status, count = value)]
devtools::use_data(census_g06_marital_status, overwrite = TRUE, compress = "xz")
rm(dt_tmp)
