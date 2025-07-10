#' Select variables from Shimadzu F-AAS data
#'
#' This function selects subsets of variables from a dataset that has been
#' renamed using `rename_aas()`. You can choose predefined subsets, such as
#' "calibration", "absorbance", "sample_info", etc.
#'
#' @param data A tibble or data frame that has already been renamed using `rename_aas()`.
#' @param subset A character string specifying the variable group to select.
#'   Options are:
#'   - `"all"` (default): select all renamed Shimadzu variables
#'   - `"calibration"`: variables related to calibration standards and factors
#'   - `"absorbance"`: absorbance and background signal
#'   - `"sample_info"`: sample identifiers and metadata
#'   - `"dilution"`: reagents and dilution details
#'
#' @return A tibble with the selected subset of columns
#'
#' @examples
#' data %>%
#'   rename_aas() %>%
#'   select_aas_subset("calibration")
#'
#' @export
select_aas_subset <- function(data, subset = "flame") {
  subset <- match.arg(subset, choices = c("flame", "all"))

  vars <- switch(subset,
                 all = c(
                   "type", "id_sample", "X", "M", "Q",
                   "conc_true", "conc", "abs", "bg", "process", "position",
                   "V", "diluent", "reagent1", "reagent2", "reagent3", "V_total",
                   "factor_m", "factor_V", "factor_dil", "factor_dil_asc", "factor_cor",
                   "conc_actual", "unit_actual", "rsd", "sd", "rpd", "recovery",
                   "id_cal", "sample_group", "remark", "date", "time", "user", "device"
                 ),
                 flame = c(
                   "type", "id_sample", "abs", "bg",
                   "conc_true", "conc", "conc_actual", "unit_actual", "id_cal",
                   "factor_m", "factor_V", "factor_dil", "factor_dil_asc", "factor_cor",
                   "rsd", "sd", "rpd", "recovery"
                 )
  )

  dplyr::select(data, dplyr::any_of(vars))
}
