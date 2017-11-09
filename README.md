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

* `census_age_gender`: Age and gender data
* `census_count_location`: The location of people on counting night. I.e. At home or elsewhere.
* `census_indigenous`: The population counts of people who identify as Indigenous Australians.
* `census_birthplace`: Counts for whether a person was born in Australia or elsewhere.
* `census_citizen`: Counts for people who are Australian citizens.
* `census_attending_education`: Counts for people currently attending an educational institute.
* `census_highest_schooling`: The highest recognised level of schooling for people over 15.

More information about Australian statistical geopgraphies can be found [here](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS))

## Attribution
This package is based on Australian Bureau of Statistics data. You can download your own versions of the raw data from the 2016 census [data packs](http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/2016%20DataPacks).
