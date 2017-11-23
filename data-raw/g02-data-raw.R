# Import G02 - Selected Medians & Averages data

library(data.table)

path <- "data-raw/2016_GCP_SA1_for_AUS_short-header/2016 Census GCP Statistical Area 1 for AUST/"

dt_g02 <- fread(paste0(path, "2016Census_G02_AUS_SA1.csv"))

census_g02_all <-
  dt_g02[, .(SA1_7DIGITCODE_2016,
             median_age_persons = Median_age_persons,
             median_mortgage_repayment_weekly =
               Median_mortgage_repay_monthly * 12 / 52,
             median_rent_weekly = Median_rent_weekly,
             median_tot_personal_inc_weekly = Median_tot_prsnl_inc_weekly,
             median_tot_family_inc_weekly = Median_tot_fam_inc_weekly,
             median_tot_household_inc_weekly = Median_tot_hhd_inc_weekly,
             average_household_size = Average_household_size,
             average_num_persons_per_bedroom = Average_num_psns_per_bedroom)]

devtools::use_data(census_g02_all, overwrite = TRUE, compress = "xz")
