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

# Creating EDI color palette (This can be modified in future)
edi_palettes <- list(
  `main`  = edi_cols("Warm Blue", "Burnt Orange", "Dark Blue"), # This list is open to potential changes in the future

  `blue`  = edi_cols("Warm Blue", "Dark Blue"),

  `mixed` = edi_cols("Warm Blue", "Burnt Orange")
)

#' Interpolates an EDI color palette
#'
#' Function to create a color spectrum of the given palette
#'
#' @param palette Character name of palette in "edi_palettes" list
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette() function
#'
#' @return Character of hex codes of the given palette
#'
#' @examples
edi_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- edi_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}
