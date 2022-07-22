# Creating named vector for EDI colors (This can be modified in future)
edi_cols_vec <- c(
  `Warm Blue` = "#007396",
  `Burnt Orange` = "#CF4520",
  `Dark Blue` = "#004F71"
)

#' Creates EDI color HEX codes
#'
#' Function to extract EDI colors as hex codes from edi_cols_vec
#'
#' @param ... Character names of "edi_cols_vec" vector: Any one of
#'     "Warm Blue", "Burnt Orange" or "Dark Blue"
#'
#' @return HEX code of the selected color
#' @export
#'
#' @examples
#' edi_cols("Warm Blue")
#' edi_cols("Burnt Orange")
edi_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) return (edi_cols_vec)

  edi_cols_vec[cols]
}
