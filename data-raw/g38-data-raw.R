# Import G38 - Dwelling Structure by Number of Bedrooms

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_38 <- melt(fread(paste0(path, "2016Census_G38_AUS_SA1.csv")),
                id.vars = "SA1_7DIGITCODE_2016", variable.factor = FALSE)


# Identify structure ------------------------------------------------------
dt_38[grepl("Separate_house", variable), structure := "Separate House"]
dt_38[grepl("Se_d_r_or_t_h_t_1_s", variable), structure := "Semi detached - single storey"]
dt_38[grepl("Se_d_r_or_t_h_t_2_s", variable), structure := "Semi detached - multi storey"]
dt_38[grepl("Flt_at_(|In_)1_or2", variable), structure := "Flat/Apartment - one or two storey"]
dt_38[grepl("Flt_apt_(|In_)3", variable), structure := "Flat/Apartment - three storey"]
dt_38[grepl("Flt_apt_4_or_m", variable), structure := "Flat/Apartment - four+ storey"]
dt_38[grepl("Flt_apt_At_to_a_hs", variable), structure := "Flat/Apartment - attached to house"]
dt_38[grepl("Other_dwelling", variable), structure := "Other"]
dt_38[grepl("Dwel.*NS", variable), structure := "Not Stated"]

dt_38 <- dt_38[!is.na(structure)]

# Identify number of rooms ------------------------------------------------
dt_38[grepl("No(|f)B_0", variable), bedrooms := "0"]
dt_38[grepl("No(|f)B_1", variable), bedrooms := "1"]
dt_38[grepl("No(|f)B_2", variable), bedrooms := "2"]
dt_38[grepl("No(|f)B_3", variable), bedrooms := "3"]
dt_38[grepl("No(|f)B_4", variable), bedrooms := "4"]
dt_38[grepl("No(|f)B_5", variable), bedrooms := "5"]
dt_38[grepl("No(|f)B_6", variable), bedrooms := "6"]
dt_38[grepl("No(|f)B_NS", variable), bedrooms := "Not Stated"]

dt_38 <- dt_38[!is.na(bedrooms)]

census_g38_dwelling_structure <- dt_38[value > 0, .(SA1_7DIGITCODE_2016, structure, bedrooms,
                                            count = value)]
devtools::use_data(census_g38_dwelling_structure, overwrite = TRUE, compress = "xz")
rm(dt_tmp)

