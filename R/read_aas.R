#' Import data from Shimadzu F-AAS
#'
#'  Function that imports either a basic or a detailed data report file
#'  from the Shimadzu AA-7000 Flame-Atomic absorption spectroscope
#'  located in the small lab at ZR.
#'
#'  @param file_path character; path to the file to load
#'  @param detailed logical; indicating whether the file to be loaded is a basic
#'  report (only summarized results) or a detailed report (including data from
#'  individual injections).
#'
#'  @return a tibble
#'
#'  @author Anil Axel Tellbüscher
#'
#'  @export
read_aas <- function(

  # Define the path to the file to load
  file_path,

  # Define whether the file to be loaded is
  # "detailed": including data from each individual sample injection
  # "standard": including summarized results
  detailed = FALSE,

  skip_lines = 2
) {

  aas_data <- readr::read_delim(
    file = file_path,
    skip = skip_lines,
    delim =  "\t"
  )

  return(aas_data)
}
