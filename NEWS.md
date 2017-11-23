# censaus 0.1.0

## New Stuff

* Initial release of data package with data from _G01 - Selected Person Characteristics by Sex_ with detail applied at the SLA1 level.
    * `census_g01_age_gender`: Age and gender data
    * `census_g01_count_location`: The location of people on counting night. I.e. At home or elsewhere.
    * `census_g01_indigenous`: The population counts of people who identify as Indigenous Australians.
    * `census_g01_birthplace`: Counts for whether a person was born in Australia or elsewhere.
    * `census_g01_citizen`: Counts for people who are Australian citizens.
    * `census_g01_attending_education`: Counts for people currently attending an educational institute.
    * `census_g01_highest_schooling`: The highest recognised level of schooling for people over 15.
* Added _G02 - Selected Medians and Averages_. Modified all periods to weekly rather than the mix of monthly / weekly provided in original ABS data.
    * `census_g02_all`: Selected medians and averages relating to age, income, housing expenses and household size.
