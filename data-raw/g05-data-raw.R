# Import Registered Marital Status by Age by Sex

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g05 <- melt(fread(paste0(path, "2016Census_G05_AUS_SA1.csv")),
               id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

# remove records for all persons and totals and areas with 0 totals
dt_tmp <- dt_g05[!(variable %like% "^P") & !(variable %like% "_Tot")
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
dt_tmp[variable %like% "Married", marital_status := "Married"]
dt_tmp[variable %like% "Never_Married", marital_status := "Never Married"]
dt_tmp[variable %like% "Separated", marital_status := "Separated"]
dt_tmp[variable %like% "Divorced", marital_status := "Divorced"]
dt_tmp[variable %like% "Widowed", marital_status := "Widowed"]

# create dataset
census_g05_marital_status <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                        marital_status, count = value)]
devtools::use_data(census_g05_marital_status, overwrite = TRUE, compress = "xz")
rm(dt_tmp)
