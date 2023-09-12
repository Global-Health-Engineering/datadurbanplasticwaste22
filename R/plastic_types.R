#' Plastic types at beach and litterboom
#'
#' Weight in kg of identified PET, PE, PP, PS, other plastic and other waste items.
#'
#' @format A tibble with 13 rows and 16 variables:#' \describe{
#'   \item{date}{Collection date of the data}
#'   \item{place}{Place where the collection was done}
#'   \item{total}{Total amount of waste chategorized in kg.}
#'   \item{pet}{Amount of polyethylene terephthalate (PET) in kg.}
#'   \item{pe}{Amount of polyethylene (PE) in kg. During the sorting process HDPE and LDPE plastics were not distinguished.}
#'   \item{pp}{Amount of polypropylene (PP) in kg.}
#'   \item{ps}{Amount of polystyrene (PS) in kg.}
#'   \item{hdpe_pp}{Amount of high-density polyethylene (HDPE) and polypropylene (PP) combined weight in kg. During the sorting process these two plastics were not distinguished.}
#'   \item{other_plastics}{Amount of other plastics in kg. The category ‘Other plastics’ included plastics that couldn’t be identified by the scanner or plastics that are in such small amounts the weighing scale could not distinguish it.}
#'   \item{other_waste}{Amount of other waste in kg remaining at the end of the categorization.}
#'   \item{glass}{Amount of glass in kg.}
#'   \item{shoes}{Amount of shoes in kg.}
#'   \item{shoes_quantity}{Number of shoes found at the location. Surprisingly a lot of shoes were found. As they often consisted of a combination of different plastics then a separate category was made for shoes.}
#'   \item{bag_quantity}{Number of bags that where collected.}
#'   \item{beach}{Categorical variable showing whether the collection was done at the beach (TRUE) or at the a litterboom (FALSE).}
#'   \item{details}{Additional information about the sampled data.}
#' }
#'
"plastic_types"
