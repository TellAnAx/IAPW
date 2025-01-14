load_TOCTN <- function(

    # Define the path to the file to load
    filepath,

    # Define whether the file to be loaded is
    # "detailed": including data from each individual sample injection
    # "standard": including summarized results
    detailed = FALSE,

    # Set decimal mark
    # Czechia: "," instead of "."
    decimal_mark = ","
    ) {

  toctn_data <- read_delim(
    file = filepath,
    delim =  "\t",
    locale = locale(decimal_mark = decimal_mark),
    skip = if_else(detailed == TRUE, 14, 11)
    )

  return(toctn_data)
}
