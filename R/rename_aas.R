#' Rename data from Shimadzu F-AAS
#'
#' Function to automatically rename column names of data imports from the
#' Shimadzu AA-7000 Flame-Atomic Absorption Spectroscope (F-AAS).
#'
#' @param data input data to rename columns
#'
#' @details
#' Column name mappings used in the function:
#' \itemize{
#'   \item{type}{Mapped from "Action"}
#'   \item{id1_sample}{Mapped from "Sample ID"}
#'   \item{X}{Mapped from "X"}
#'   \item{M}{Mapped from "M"}
#'   \item{Q}{Mapped from "Q"}
#'   \item{conc_true}{Mapped from "True Value (mg/L)"}
#'   \item{conc}{Mapped from "Conc. (mg/L)"}
#'   \item{abs}{Mapped from "Abs."}
#'   \item{bg}{Mapped from "BG"}
#'   \item{process}{Mapped from "Data Process Range (sec)"}
#'   \item{position}{Mapped from "Pos."}
#'   \item{V}{Mapped from "VOL"}
#'   \item{diluent}{Mapped from "Diluent"}
#'   \item{reagent1}{Mapped from "Reagent 1"}
#'   \item{reagent2}{Mapped from "Reagent 2"}
#'   \item{reagent3}{Mapped from "Reagent 3"}
#'   \item{V_total}{Mapped from "Total Volume"}
#'   \item{factor_m}{Mapped from "WF"}
#'   \item{factor_V}{Mapped from "VF"}
#'   \item{factor_dil}{Mapped from "DF"}
#'   \item{factor_dil_asc}{Mapped from "ASC DF"}
#'   \item{factor_cor}{Mapped from "CF"}
#'   \item{actual}{Mapped from "Actual Conc."}
#'   \item{actual_unit}{Mapped from "Actual Conc. Unit"}
#'   \item{rsd}{Mapped from "%RSD"}
#'   \item{sd}{Mapped from "SD"}
#'   \item{rpd}{Mapped from "RPD"}
#'   \item{recovery}{Mapped from "%R"}
#'   \item{cal_no}{Mapped from "C#"}
#'   \item{sample_group}{Mapped from "SG#"}
#'   \item{remark}{Mapped from "Out of Control Remark"}
#'   \item{date}{Mapped from "Date"}
#'   \item{time}{Mapped from "Time"}
#'   \item{user}{Mapped from "User Name"}
#'   \item{device}{Mapped from "Device Name"}
#' }
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom dplyr case_when
#' @importFrom dplyr rename_with
#'
#' @export
rename_aas <- function(data) {
  rename_columns <- function(colnames_raw) {
    dplyr::case_when(
      colnames_raw == "Action" ~ "type",
      colnames_raw == "Sample ID" ~ "id1_sample",
      colnames_raw == "X" ~ "X",
      colnames_raw == "M" ~ "M",
      colnames_raw == "Q" ~ "Q",
      colnames_raw == "True Value (mg/L)" ~ "conc_true",
      colnames_raw == "Conc. (mg/L)" ~ "conc",
      colnames_raw == "Abs." ~ "abs",
      colnames_raw == "BG" ~ "bg",
      colnames_raw == "Data Process Range (sec)" ~ "process",
      colnames_raw == "Pos." ~ "position",
      colnames_raw == "VOL" ~ "V",
      colnames_raw == "Diluent" ~ "diluent",
      colnames_raw == "Reagent 1" ~ "reagent1",
      colnames_raw == "Reagent 2" ~ "reagent2",
      colnames_raw == "Reagent 3" ~ "reagent3",
      colnames_raw == "Total Volume" ~ "V_total",
      colnames_raw == "WF" ~ "factor_m",
      colnames_raw == "VF" ~ "factor_V",
      colnames_raw == "DF" ~ "factor_dil",
      colnames_raw == "ASC DF" ~ "factor_dil_asc",
      colnames_raw == "CF" ~ "factor_cor",
      colnames_raw == "Actual Conc." ~ "actual",
      colnames_raw == "Actual Conc. Unit" ~ "actual_unit",
      colnames_raw == "%RSD" ~ "rsd",
      colnames_raw == "SD" ~ "sd",
      colnames_raw == "RPD" ~ "rpd",
      colnames_raw == "%R" ~ "recovery",
      colnames_raw == "C#" ~ "cal_no",
      colnames_raw == "SG#" ~ "sample_group",
      colnames_raw == "Out of Control Remark" ~ "remark",
      colnames_raw == "Date" ~ "date",
      colnames_raw == "Time" ~ "time",
      colnames_raw == "User Name" ~ "user",
      colnames_raw == "Device Name" ~ "device",
      TRUE ~ colnames_raw # Keep original name if no match
    )
  }

  renamed_data <- dplyr::rename_with(data, rename_columns)

  return(renamed_data)
}
