#' Rename data from Shimadzu F-AAS
#'
#' Function to automatically rename column names of data imports from the
#' Shimadzu AA-7000 Flame-Atomic Absorption Spectroscope (F-AAS).
#'
#' @param data input data to rename columns
#'
#' @details
#' Column name mappings used in the function:\cr
#' \itemize{
#'   \item{type: }{Sample type:\cr
#'     - STD: Standard used to create the calibration curve\cr
#'     - BLK: Blank sample\cr
#'     - UNK: Unknown sample\cr
#'     Mapped from "Action"}
#'
#'   \item{id_sample: }{Sample ID specified by the user.\cr
#'     Mapped from "Sample ID"}
#'
#'   \item{X: }{Mapped from "X"}
#'   \item{M: }{Mapped from "M"}
#'   \item{Q: }{Mapped from "Q"}
#'
#'   \item{conc_true: }{Concentration of the calibration standard specified by the user.\cr
#'     Values are reported in mg/L.\cr
#'     Mapped from "True Value (mg/L)"}
#'
#'   \item{conc: }{Concentration calculated by WizAArd.\cr
#'     Values are reported in mg/L.\cr
#'     Mapped from "Conc. (mg/L)"}
#'
#'   \item{abs: }{Measured absorbance value.\cr
#'     Mapped from "Abs."}
#'
#'   \item{bg: }{Measured background signal emitted by the deuterium lamp.\cr
#'     Mapped from "BG"}
#'
#'   \item{process: }{Mapped from "Data Process Range (sec)"}
#'   \item{position}{Mapped from "Pos."}
#'   \item{V: }{Mapped from "VOL"}
#'   \item{diluent: }{Mapped from "Diluent"}
#'   \item{reagent1: }{Mapped from "Reagent 1"}
#'   \item{reagent2: }{Mapped from "Reagent 2"}
#'   \item{reagent3: }{Mapped from "Reagent 3"}
#'   \item{V_total: }{Mapped from "Total Volume"}
#'   \item{factor_m: }{Mapped from "WF"}
#'   \item{factor_V: }{Mapped from "VF"}
#'   \item{factor_dil: }{Mapped from "DF"}
#'   \item{factor_dil_asc: }{Mapped from "ASC DF"}
#'   \item{factor_cor: }{Mapped from "CF"}
#'
#'   \item{conc_actual: }{Recalculated concentration based on calculated concentration and all correction factors.\cr
#'     Mapped from "Actual Conc."}
#'
#'   \item{unit_actual: }{Unit of the recalculated concentration.\cr
#'     Mapped from "Actual Conc. Unit"}
#'
#'   \item{rsd: }{Mapped from "\%RSD"}
#'   \item{sd: }{Mapped from "SD"}
#'   \item{rpd: }{Mapped from "RPD"}
#'   \item{recovery: }{Mapped from "\%R"}
#'
#'   \item{id_cal: }{Identifier of the calibration curve.\cr
#'     If set for an unknown sample, this indicates which calibration was used.\cr
#'     Mapped from "C#"}
#'
#'   \item{sample_group: }{Mapped from "SG#"}
#'   \item{remark: }{Mapped from "Out of Control Remark"}
#'   \item{date: }{Mapped from "Date"}
#'   \item{time: }{Mapped from "Time"}
#'   \item{user: }{Mapped from "User Name"}
#'   \item{device: }{Mapped from "Device Name"}
#' }
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom dplyr case_when
#' @importFrom dplyr rename_with
#' @importFrom magrittr %>%
#'
#' @export
rename_aas <- function(data) {
  rename_columns <- function(colnames_raw) {
    dplyr::case_when(
      colnames_raw == "Action" ~ "type",
      colnames_raw == "Sample ID" ~ "id_sample",
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
      colnames_raw == "Actual Conc." ~ "conc_actual",
      colnames_raw == "Actual Conc. Unit" ~ "unit_actual",
      colnames_raw == "%RSD" ~ "rsd",
      colnames_raw == "SD" ~ "sd",
      colnames_raw == "RPD" ~ "rpd",
      colnames_raw == "%R" ~ "recovery",
      colnames_raw == "C#" ~ "id_cal",
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





#' Rename data from ThermoFisher FLASH 2000
#'
#' @author Anil Axel Tellbüscher
#'
#' @export
rename_chnso <- function(){

}





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
rename_toc <- function(data) {
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
      colnames_raw == "Vial" ~ "position",
      colnames_raw == "Excluded" ~ "excluded",
      colnames_raw == "Inj. Vol." ~ "V_injection",
      colnames_raw == "Auto. Dil." ~ "dil_auto",
      TRUE ~ colnames_raw # Keep original name if no match
    )
  }

  renamed_data <- dplyr::rename_with(data, rename_columns)

  return(renamed_data)
}
