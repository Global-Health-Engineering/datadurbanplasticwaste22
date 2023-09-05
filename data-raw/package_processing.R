library(tidyverse)
library(here)
library(janitor)
library(devtools)
library(usethis)
library(openwashdata)
library(desc)

# Add documentation -------------------------------------------------------

# # Done
# # load openwashdata package
# devtools::install_github("openwashdata/openwashdata")
# library(openwashdata)

# # Done
# # Initiate documentation folder for writing up metadata and documentation for objects
# dir.create("R")
# usethis::use_r("litterboom_counts")
# usethis::use_r("litterboom_weights")
# usethis::use_r("locations")
# usethis::use_r("plastic_types")

# # Done
# # Add documentation from data dictionary to script as roxygen (was only necessary for 'plastic_types')
# openwashdata::generate_roxygen_docs("data-raw/dictionary.csv", output_file_path = "R/plastic_types.R")
#
# # Add additional info (title, description, "DATASET1")

# # Done
# # Add an additional package documentation to Package
# usethis::use_package_doc()

# # Done
# # Add license
# usethis::use_ccby_license()

# # Done
# # Add dependencies in DESCRIPTION file
# # use_package("tidyverse")
# use_package("knitr", "rmarkdown","Suggests")

# Done
# add authors -------------------------------------------------------------

# legacy function is going to be replaced by use_author_skeleton()
# # Creatre authors skeleton
# use_authors_skeleton <- function(dest = NULL){
#   if(is.null(dest)){
#     dest <- file.path(proj_get(),"bootstrap","authors.csv")
#   } else {
#     dest
#   }
#   tbl <- tibble(
#     first_name = character(),
#     last_name = character(),
#     email = character(),
#     role = character(),
#     orcid = character()
#   )
#   write_csv(tbl, file = paste0(dest, "authors.csv"))
#   openxlsx::write.xlsx(x = tbl, file = paste0(dest, "authors.xlsx"))
# }
# use_authors_skeleton(dest = "data-raw/")

# # Legacy function is going to be replaced with use_author()
# # Create converting function from xlsx to csv
# update_authors_csv <- function(authors_path) {
#   authors_excel <-
#     readxl::read_excel(authors_path)
#
#   authors_excel |>
#     readr::write_csv("data-raw/authors.csv")
# }

# DONE
# Create use authors information function
#' @param f character file location of the authors .csv file
#' @param quiet logical should the function be quiet about the number of authors
#' found in the csv file? Defaults to FALSE.
#' @importFrom usethis use_author
#' @importFrom dplyr rowwise
#' @importFrom readr read_csv
#' @export
# use_authors_from_csv <- function(f = "bootstrap/authors.csv", quiet = FALSE){
#   a <- read_csv(f, col_types = "cccc")
#   n <- a |>
#     rowwise() |>
#     transmute(df = use_author(given = first_name,
#                               family = last_name,
#                               email = email,
#                               role = role,
#                               comment = ifelse(is.na(orcid),
#                                                '',
#                                                orcid)
#     )
#     ) |>
#     nrow()
#   if(!quiet){
#     message(
#       sprintf("%d authors added to the DESCRIPTION file.", n)
#     )
#   }
# }
# use_authors_from_csv_replace <- function(f = "raw-data/authors.csv", quiet = FALSE){
#
#   a <- read_csv(f, col_types = "cccc")
#
#   old <- length(desc_get_authors())
#
#   for (i in row(a[1])) {
#     desc_del_author(given = a$first_name[i],
#                     family = a$last_name[i],
#                     email = a$email[i],
#                     role = a$role[i])
#   }
#
#   u <- old - length(desc_get_authors())
#
#   n <- a |>
#     rowwise() |>
#     transmute(df = use_author(given = first_name,
#                               family = last_name,
#                               email = email,
#                               role = role,
#                               comment = ifelse(is.na(orcid),
#                                                '',
#                                                orcid)
#     )
#     ) |>
#     nrow()
#
#   if(!quiet){
#     message(
#       sprintf("%d authors updated to the DESCRIPTION file \n", u),
#       sprintf("%d authors added to the DESCRIPTION file.", (n - u))
#     )
#   }
# }

# # DONE
# # Update Authors csv
# update_authors_csv("data-raw/authors.xlsx")
# use_authors_from_csv(f = "data-raw/authors.csv")
# use_authors_from_csv_replace(f = "data-raw/authors.csv")

# # Add Sebastians author data
# use_author(
#   given = "Sebastian Camilo",
#   family = "Loos",
#   role = c("ctb"),
#   email = "sloos@ethz.ch",
#   comment = c(ORCID = "0000-0002-8830-1734")
# )

# # Done
# # Add CITATION.cff file
# cffr::cff_write()

# # load, document, check, and install
# devtools::load_all()  # "Cmd + Shift + L"
# devtools::document()  # "Cmd + Shift + D"
# devtools::check()     # "Cmd + Shift + E"
# devtools::install()   # "Cmd + Shift + B"

# # DONE
# # Create a rmd README for package
# usethis::use_readme_rmd()

# Done
# Knit README.Rmd once!!!

# # DONE
# # Create an examples article for the package
# usethis::use_article("examples")
# devtools::build_rmd("vignettes/articles/examples.Rmd")

# TODO UPDATE
# Write example page

# # DONE
# # Add automated CMD BUILD check
# usethis::use_github_action("check-standard.yaml")

# # DONE
# # Setup pkgdown configuration and github actions
# usethis::use_pkgdown()

# Build pkgdown website
pkgdown::build_site()
