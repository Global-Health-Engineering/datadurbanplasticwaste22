
<!-- README.md is generated from README.Rmd. Please edit that file -->

# durbanplasticwaste

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/604573987.svg)](https://zenodo.org/badge/latestdoi/604573987)
[![R-CMD-check](https://github.com/Global-Health-Engineering/durbanplasticwaste/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Global-Health-Engineering/durbanplasticwaste/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# Overview

This packages combines data collected as part of an MSc. Thesis Project
and an MSc. Semester Project conducted in Durban, South Africa. The
projects were supported by the Global Health Engineering group at ETH
Zurich, Switzerland.

# Installation

You can install the development version of durbanplasticwaste from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Global-Health-Engineering/durbanplasticwaste")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset            | CSV                                                                                                                          | XLSX                                                                                                                           |
|:-------------------|:-----------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------|
| litterboom_counts  | [Download CSV](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_counts.csv)  | [Download XLSX](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_counts.xlsx)  |
| litterboom_weights | [Download CSV](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_weights.csv) | [Download XLSX](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_weights.xlsx) |
| locations          | [Download CSV](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/locations.csv)          | [Download XLSX](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/locations.xlsx)          |

# Projects

## MSc. Thesis Project

Evaluating the potential of Extended Producer Responsibility returns for
a small local waste collection company through a brand audit of riverine
plastic waste in Durban, South Africa.

### Description

This Master’s Thesis Project focuses on determining the growth
opportunities for a small-sized plastic recycling enterprise in light of
the shift from a voluntary to a mandatory Extended Producer
Responsibility (EPR) policy in South Africa.

To achieve this goal in the context of a small start-up in Durban, South
Africa , a brand audit is conducted to identify the top brands that can
be targeted for financing or partnership opportunities. The company,
called [TRI ECO Tours](https://triecotours.co.za/), is a small tourism
and waste collection startup in Durban operated by Siphiwe Rakgabale.

### Research Question

What is the characterization by type, application, and brand of plastic
waste collected in the uMngeni River system in Durban, South Africa?

### Data

The data was collected throughout two months in Durban, South Africa
right before the rainy season. The collection took place in 6 different
litterboom locations throughout Durban. The data gathered was the audit
of the occurence of the brands washed into the litterbooms.

The package provides access to three data sets.

``` r
library(durbanplasticwaste)
```

The `litterboom_counts` data set has 7 variables and 2784 observations.
For an overview of the variable names, see the following table.

``` r
litterboom_counts
```

| variable_name | variable_type | description                                                                                                                    |
|:--------------|:--------------|:-------------------------------------------------------------------------------------------------------------------------------|
| date          | date          | Date of the collected litterboom sample.                                                                                       |
| location      | character     | Descriptive name of the sample location. See \[`locations`\] for longitude and latitude.                                       |
| brand         | character     | Brand name of the collected item (e.g. Coca Cola).                                                                             |
| group         | character     | Group name that owns the brand (e.g. Coca Cola Beverages South Africa).                                                        |
| plastic       | character     | Type of plastic of the item. Identified plastic types are PET, HDPE, and PP. HDPE and PP were categorised together as HDPE/PP. |
| category      | character     | Categorisation of waste into 15 product type categories (e.g. Alcohol, Milk, Tobacco, Water).                                  |
| count         | numeric       | Number of counted items.                                                                                                       |

The `litterboom_weights` data set has 4 variables and 14 observations.
For an overview of the variable names, see the following table.

| variable_name | variable_type | description                              |
|:--------------|:--------------|:-----------------------------------------|
| date          | date          | Date of the collected litterboom sample. |
| location      | character     | Descriptive name of the sample location. |
| pet           | numeric       | Weight (in kg) of PET items.             |
| hpde_pp       | numeric       | Weight (in kg) of PET items.             |

The `locations` data set has 3 variables and 6 observations. For an
overview of the variable names, see the following table.

| variable_name | variable_type                            | description |
|:--------------|:-----------------------------------------|:------------|
| location      | Descriptive name of the sample location. | NA          |
| latitude      | Latitude coordinate.                     | NA          |
| longitude     | Longitude coordinate.                    | NA          |

Locations data as a map illustrating the six litterboom sampling
locations in Durban, South Africa. For an interactive map and other code
examples, see `vignette("examples")`.

<img src="man/figures/map-litterboom-sampling-locations.png" width="100%" />

## MSc. Semester Project

Examination of non-recycled marine plastic litter in order to identify
recycling and beneficiation pathways in Durban, South Africa

### Description

This Semester Thesis Project focuses on determining the distribution of
plastic litter on the Durban beachfront in order to identify key targets
for policy and financial support through the South African EPR policy to
reduce plastic spills into the environment and promote higher recycling
rates. Research Question

What types and amounts of plastic are found along the beachfront in the
mangroves of Durban-North, South Africa?

### Data

## Examples

The `litterboom_counts` data identifies 40 unique groups that own the
identified brands. The top 10 brands are shown in the following table.
All other brands are lumped together as OTHER.

``` r
library(durbanplasticwaste)
library(dplyr)
library(forcats)

litterboom_counts |> 
  mutate(group = factor(group)) |> 
  mutate(group = fct_lump(group, n = 10, other_level = "OTHER")) |> 
  group_by(group) |> 
  summarise(
    count = sum(count)
  ) |> 
  arrange(desc(count)) |> 
  mutate(percent = count / sum(count) * 100) |> 
  knitr::kable(digits = 0)
```

| group                            | count | percent |
|:---------------------------------|------:|--------:|
| OTHER                            |  8086 |      52 |
| Coca Cola Beverages South Africa |  4030 |      26 |
| unidentifiable                   |  1202 |       8 |
| Clover Industries LTD            |   737 |       5 |
| Unilever                         |   442 |       3 |
| Tiger Brands                     |   232 |       2 |
| danone                           |   183 |       1 |
| Siqolo Foods                     |   144 |       1 |
| Willowton Group                  |   139 |       1 |
| Amka Products                    |   132 |       1 |
| RCL Foods                        |    95 |       1 |

## License

Data are available as
[CC-BY](https://github.com/Global-Health-Engineering/durbanplasticwaste/blob/main/LICENSE.md).

## Citation

To cite this package, please use:

``` r
citation("durbanplasticwaste")
#> 
#> Bergen R, Schöbitz L, Meyer-Piening C, Boynton L, Tilley E, Kalina M,
#> Rakgabale S, Luvuno SN (2023). "durbanplasticwaste. Durban (South
#> Aftica) Plastic Waste Data." doi: 10.5281/zenodo.7825679 (URL:
#> https://doi.org/10.5281/zenodo.7825679), <URL:
#> https://global-health-engineering.github.io/durbanplasticwaste/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{R-durbanplasticwaste,
#>     title = {durbanplasticwaste. Durban (South Aftica) Plastic Waste Data},
#>     author = {Raúl Bergen and Lars Schöbitz and Chiara Meyer-Piening and Lin Boynton and Elizabeth Tilley and Marc Kalina and Siphiwe Rakgabale and Sfiso Nduduzo Luvuno},
#>     doi = {10.5281/zenodo.7825679},
#>     url = {https://global-health-engineering.github.io/durbanplasticwaste/},
#>     abstract = {Waste characterisation data for extended producer responsibility.
#>     The plastic waste was collected in the uMngeni River system in Durban, 
#>     South Africa, and categorised by brand, corporate group, application, and 
#>     type of plastic.},
#>     version = {0.1.1},
#>     year = {2023},
#>   }
```
