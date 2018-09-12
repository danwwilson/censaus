# censaus 0.1.01 - 2018-09-12

* Added _G04 - Age by Sex_. 
    * `census_g04_age_gender`: A dataset of age / gender by individual year to age 79.
    * `census_g04_age_gender_grouped`: A dataset of age and gender data by 5 year age bands to 100.
* Added _G38 - Dwelling Structure by Number of Bedrooms_
    *`census_g38_dwelling_structure`: A dataset of the housing strucures and number of bedrooms in each structure.

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
* Added _G05 - Registered Marital Status by Age by Sex_
    * `census_g05_marital_status`: A dataset with the age, gender and registered marital status.
* Added _G06 - Social Marital Status by Age by Sex_
    * `census_g06_marital_status`: A dataset with the age, gender and social marital status.
* Added _G32 - Dwelling Structre_
    * `census_g32_dwelling_structure`: A dataset with information about the number of dwellings in an SLA1 area and the number of people resident in the dwellings.
