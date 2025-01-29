#' Rename data from Shimadzu TOC-L/TNM-L
#'
#' Function to automatically rename column names of data imports from the
#' Shimadzu TOC-L/TNM-L analyzer.
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
rename_toctn <- function(data) {
  rename_columns <- function(colnames_raw) {
    dplyr::case_when(
      colnames_raw == "Type" ~ "type",
      colnames_raw == "Anal." ~ "analyte",
      colnames_raw == "Sample Name" ~ "id1_sample",
      colnames_raw == "Sample ID" ~ "id2_sample",
      colnames_raw == "Origin" ~ "path_method",
      colnames_raw == "Cal. Curve" ~ "path_calib",
      colnames_raw == "Manual Dilution" ~ "dil_manual",
      colnames_raw == "Notes" ~ "notes",
      colnames_raw == "Comments" ~ "comments",
      colnames_raw == "Date / Time" ~ "datetime",
      colnames_raw == "Spl. No." ~ "no_wash",
      colnames_raw == "Inj. No." ~ "no_injection",
      colnames_raw == "Analysis(Inj.)" ~ "analysis",
      colnames_raw == "Area" ~ "area",
      colnames_raw == "Mean Area" ~ "area_mean",
      colnames_raw == "Conc." ~ "conc",
      colnames_raw == "Mean Conc." ~ "conc_mean",
      colnames_raw == "Result(TOC)" ~ "conc_TOC",
      colnames_raw == "Result(TC)" ~ "conc_TC",
      colnames_raw == "Result(IC)" ~ "conc_IC",
      colnames_raw == "Result(POC)" ~ "conc_POC",
      colnames_raw == "Result(NPOC)" ~ "conc_NPOC",
      colnames_raw == "Result(TN)" ~ "conc_TN",
      colnames_raw == "Result" ~ "conc_char",
      colnames_raw == "Mean Result" ~ "conc_mean_char",
      colnames_raw == "Rem." ~ "remark",
      colnames_raw == "SD Area" ~ "area_sd",
      colnames_raw == "CV Area" ~ "area_cv",
      colnames_raw == "SD Conc" ~ "conc_sd",
      colnames_raw == "CV Conc" ~ "conc_cv",
      colnames_raw == "Vial" ~ "no_vial",
      colnames_raw == "Excluded" ~ "excluded",
      colnames_raw == "Inj. Vol." ~ "V_injection",
      colnames_raw == "Auto. Dil." ~ "dil_auto",
      TRUE ~ colnames_raw # Keep original name if no match
    )
  }

  renamed_data <- dplyr::rename_with(data, rename_columns)

  return(renamed_data)
}
