#'  Import data from Shimadzu TOC-L/TNM-L
#'
#'  Function that imports either a basic or a detailed data report file
#'  from the Shimadzu TOC-L/TNM-L analyzer located in the small lab at
#'  ZR.
#'
#' @param file_path character; path to the file to load
#' @param detailed logical; indicating whether the file to be loaded is a basic
#' report (only summarized results) or a detailed report (including data from
#' individual injections).
#' @param ... further arguments passed to or from other methods.
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom readr read_delim
#' @importFrom readr locale
#' @importFrom dplyr if_else
#'
#' @export
read_toc <- function(

    # Define the path to the file to load
    file_path,

    # Define whether the file to be loaded is
    # "detailed": including data from each individual sample injection
    # "standard": including summarized results
    detailed = FALSE,

    ...
    ) {

  toctn_data <- readr::read_delim(
    file = file_path,
    delim =  "\t",
    locale = readr::locale(decimal_mark = ","),
    skip = dplyr::if_else(detailed == TRUE, 13, 11)
    )

  return(toctn_data)
}
