# Import General Community Profile (GCP) data

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g01 <- melt(fread(paste0(path, "2016Census_G01_AUS_SA1.csv")),
               id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

# assign gender for all records

# assign gender
dt_g01[, gender := str_right(variable, 1)]
dt_g01[gender == "M", gender := "Male"]
dt_g01[gender == "F", gender := "Female"]
dt_g01[gender == "P", gender := "All persons"]

# Age & Gender ------------------------------------------------------------

# filter for age data
dt_tmp <- dt_g01[(variable %like% "^Tot_P" | variable %like% "^Age_\\d") &
                   value > 0]

# assign age
dt_tmp[variable %like% "^Age_", age :=
         gsub("_", "-", str_mid(variable, 5, from_end = 5))]
dt_tmp[variable %like% "^Age_85ov", age := "85+"]

census_age_gender <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                count = value)]
devtools::use_data(census_age_gender, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Count location ----------------------------------------------------------

dt_tmp <- dt_g01[(variable %like% "^Counted_Census" |
                   variable %like% "^Count_Census") & value > 0]

# assign location
dt_tmp[variable %like% "home", location := "Completed at home"]
dt_tmp[variable %like% "Ewhere", location := "Completed elsewhere in Aust."]

census_count_location <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, location,
                                    count = value)]
devtools::use_data(census_count_location, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Indigenous Australians --------------------------------------------------

dt_tmp <- dt_g01[variable %like% "Indig" & value > 0]

# assign indigenous heritage
dt_tmp[variable %like% "Aboriginal", heritage := "Aboriginal"]
dt_tmp[variable %like% "Torres_Strait", heritage := "Torres Strait Islander"]
dt_tmp[variable %like% "Indig_Bth", heritage := "Aboriginal & Torres Strait Islander"]
dt_tmp[variable %like% "Indigenous_P_Tot", heritage := "Total"]

census_indigenous <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, heritage,
                                count = value)]
devtools::use_data(census_indigenous, overwrite = TRUE, compress = "xz")
rm(dt_tmp)
