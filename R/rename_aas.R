#' Rename data from Shimadzu F-AAS
#'
#' Function to automatically rename column names of data imports from the
#' Shimadzu AA-7000 Flame-Atomic Absorption Spectroscope (F-AAS).
#'
#' @param data input data to rename columns
#'
#' @return something
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
      colnames_raw == "True Value (mg/L)" == "conc_true",
      colnames_raw == "Conc. (mg/L)" == "conc",
      colnames_raw == "Abs." == "abs",
      colnames_raw == "BG" == "bg",
      colnames_raw == "Data Process Range (sec)",
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
      colnames_raw == "SG#" ~ "sample_group"
      colnames_raw == "Out of Control Remark" ~ "remark",
      colnames_raw == "Date" ~ "date",
      colnames_raw == "Time" ~ "time",
      colnames_raw == "User Name" ~ "user",
      colnames_raw == "Device Name" ~ "device"
      TRUE ~ colnames_raw # Keep original name if no match
    )
  }

  renamed_data <- dplyr::rename_with(data, rename_columns)

  return(renamed_data)
}
