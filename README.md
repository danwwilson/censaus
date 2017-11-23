# Australian Census Data 2016

This package contains census related data from the Australian Bureau of Statistics. The data is split into several different packs each containing slightly different information.

The data currently included in the package covers:
* `General Community Profile (GCP)`: This contains the Census characteristics on persons, families and dwellings. The data is based on place of usual residence.

In 2016 the Australian census was conducted online. A sample version of the questionnaire can be found [here](http://www.abs.gov.au/ausstats/abs@.nsf/Lookup/2901.0Main%20Features802016/$FILE/2016%20Census%20Sample%20Household%20Form.pdf).

## Installation

Due to the size of the data this package is only available on [GitHub](www.github.com/danwwilson/censaus).

```R
# Install from github
devtools::install_github("danwwilson/censaus")
```
## Datasets
The package currently includes the following datasets with the intention of increasing the coverage over time.

### G01 - Selected Person Characteristics by Sex
The following datasets are recorded at the Statistical Level Area 1 (SLA1 - `SA1_7DIGITCODE_2016`). They all contain `gender` and `count`s of the population.

* `census_g01_age_gender`: Age and gender data
* `census_g01_count_location`: The location of people on counting night. I.e. At home or elsewhere.
* `census_g01_indigenous`: The population counts of people who identify as Indigenous Australians.
* `census_g01_birthplace`: Counts for whether a person was born in Australia or elsewhere.
* `census_g01_citizen`: Counts for people who are Australian citizens.
* `census_g01_attending_education`: Counts for people currently attending an educational institute.
* `census_g01_highest_schooling`: The highest recognised level of schooling for people over 15.

### G02 - Selected Medians and Averages
The following datasets are recorded at the SLA1 level of detail. The original census data looks at mortgage repayments at a monthly level. This has been adjusted to reflect a weekly amount in line with the associated median income amounts.

* `census_g02_all`: Selected medians and averages relating to age, income, housing expenses and household size.

### G05 - Registered Marital Status by Age by Sex
* `census_g05_marital_status`: A dataset with the age, gender and registered marital status.

### G06 - Social Marital Status by Age by Sex
* `census_g06_marital_status`: A dataset with the age, gender and social marital status.

More information about Australian statistical geographies can be found [here](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS))

## Attribution
This package is based on Australian Bureau of Statistics data. You can download your own versions of the raw data from the 2016 census [data packs](http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/2016%20DataPacks).
