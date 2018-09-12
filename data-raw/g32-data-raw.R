# Import Dwelling Structure

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g32 <- fread(paste0(path, "2016Census_G32_AUS_SA1.csv"))

# Column Unoccupied_PDs_Psns has values of .. so needs to be removed
dt_g32[, Unoccupied_PDs_Psns := NULL]

dt_tmp <- melt(dt_g32, id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)

# assign variable for dwellings/persons
dt_tmp[variable %like% "Dwellings$", type := "dwellings"]
dt_tmp[variable %like% "Dwgs$", type := "dwellings"]
dt_tmp[variable %like% "Ds$", type := "dwellings"]
dt_tmp[variable %like% "Persons$", type := "people"]
dt_tmp[variable %like% "Psns$", type := "people"]
dt_tmp[variable %like% "Ps$", type := "people"]

# remove unncessary records
dt_tmp <- dt_tmp[!(variable %like% "Tot") & value > 0]

# create occupation type
dt_tmp[variable %like% "^OPD", occupy := "Occupied"]
dt_tmp[variable %like% "^Unoccupied", occupy := "Unoccupied"]

# create dwelling type
dt_tmp[variable %like% "Separate_house", dwelling_type := "Separate house"]
dt_tmp[variable %like% "SD", dwelling_type := "Semi detached"]
dt_tmp[variable %like% "F_ap", dwelling_type := "Flat or apartment"]
dt_tmp[variable %like% "Flt_apt_Att", dwelling_type := "Flat attached to house"]
dt_tmp[variable %like% "Cvn", dwelling_type := "Caravan"]
dt_tmp[variable %like% "cab_hboat", dwelling_type := "Cabin or houseboat"]
dt_tmp[variable %like% "Im_hm", dwelling_type := "Improvised home"]
dt_tmp[variable %like% "Hs_f", dwelling_type := "Flat attached to shop/office"]
dt_tmp[variable %like% "structur_NS", dwelling_type := "Not stated"]
dt_tmp[variable %like% "Unoccupied", dwelling_type := "Unoccupied"]

# Determine number of storeys
dt_tmp[variable %like% "1_sty", storeys := "<=2"]
dt_tmp[variable %like% "2_sty", storeys := "<=2"]
dt_tmp[variable %like% "1or2_sty", storeys := "<=2"]
dt_tmp[variable %like% "3_sty", storeys := "3"]
dt_tmp[variable %like% "4_m_sty", storeys := ">=4"]
dt_tmp[is.na(storeys), storeys := "Not stated"]

dt_tmp2 <- dt_tmp[, .(SA1_7DIGITCODE_2016 = as.character(SA1_7DIGITCODE_2016),
                      type, occupy, dwelling_type, storeys, count = value)]

census_g32_dwelling_structure <-
  dcast(dt_tmp2, SA1_7DIGITCODE_2016 + occupy + dwelling_type + storeys ~ type,
        fun.aggregate = sum, value.var = "count")

devtools::use_data(census_g32_dwelling_structure, overwrite = TRUE,
                   compress = "xz")
rm(dt_tmp, dt_tmp2)
