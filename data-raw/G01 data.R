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
dt_tmp[variable %like% "Indig_Bth",
       heritage := "Aboriginal & Torres Strait Islander"]
dt_tmp[variable %like% "Indigenous_P_Tot", heritage := "Total"]

census_indigenous <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, heritage,
                                count = value)]
devtools::use_data(census_indigenous, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Birthplace --------------------------------------------------------------

dt_tmp <- dt_g01[variable %like% "^Birthplace" & value > 0]

# assign birthplace
dt_tmp[variable %like% "Australia", birthplace := "Australia"]
dt_tmp[variable %like% "Elsewhere", birthplace := "Elsewhere"]

census_birthplace <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, birthplace,
                                count = value)]
devtools::use_data(census_birthplace, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Citizen -----------------------------------------------------------------

dt_tmp <- dt_g01[variable %like% "^Australian_citizen" & value > 0]

census_citizen <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender,
                                count = value)]
devtools::use_data(census_citizen, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Attending education -----------------------------------------------------

dt_tmp <- dt_g01[variable %like% "^Age_psns" & value > 0]

# assign age
dt_tmp[variable %like% "^Age_psns_att_educ_inst", age :=
         gsub("_", "-", str_mid(variable, 24, from_end = 2))]
dt_tmp[variable %like% "^Age_psns_att_edu_inst", age :=
         gsub("_", "-", str_mid(variable, 23, from_end = 2))]
dt_tmp[variable %like% "^Age_psns_att_edu_inst_25", age := "25+"]

census_attending_education <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender, age,
                                count = value)]
devtools::use_data(census_attending_education, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

# Highest school year -----------------------------------------------------

dt_tmp <- dt_g01[variable %like% "^High_yr" & value > 0]

# assign highest school year
dt_tmp[variable %like% "Yr_1", highest_school_year :=
         gsub("_", "-", str_mid(variable, 22, from_end = 5))]
dt_tmp[variable %like% "Yr_9", highest_school_year := "9"]
dt_tmp[variable %like% "Yr_8", highest_school_year := "8 or below"]
dt_tmp[variable %like% "D_n_g", highest_school_year := "Did not go to school"]

census_highest_schooling <- dt_tmp[, .(SA1_7DIGITCODE_2016, gender,
                                       highest_school_year, count = value)]
devtools::use_data(census_highest_schooling, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

