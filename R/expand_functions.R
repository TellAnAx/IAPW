#' Match QC IDs
#'
#' Helper function to match sample IDs with samples for QC and QA tasks.
#' This includes blanks, standards for calibration, and so on.
#'
#' @param col character; name of the column that holds the IDs to be checked.
#' @param cal character; identifier for calibration standards.
#' @param blank character; identifier for blank samples.
#' @param qual character; identifier for QC samples.
#'
#' @author Anil Axel Tellbüscher
#'
#' @export
match_id_qc <- function(x,
                        col,
                        cal,
                        blank,
                        qual) {

  #

  mutate(
    x,
    id_quality = case_when(
      col == cal[1] ~ cal[2],
      col == blank[1] ~ blank[2],
      col == qual[1] ~ qual[2]
    )
  )

  return(x)
}
