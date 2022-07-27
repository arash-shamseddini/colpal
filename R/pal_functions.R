########## edi_cols_vec ##########

# Creating named vector for EDI colors (This can be modified in future)
edi_cols_vec <- c(
  `Warm Blue` = "#007396",
  `Burnt Orange` = "#CF4520",
  `Dark Blue` = "#004F71"
)

########## edi_cols() ##########

#' Creates EDI color HEX codes
#'
#' Function to extract EDI colors as hex codes from edi_cols_vec
#'
#' @param ... Character names of "edi_cols_vec" vector: Any one of
#'     "Warm Blue", "Burnt Orange" or "Dark Blue" or combination thereof
#'
#' @return HEX code of the selected color
#' @export
#'
#' @examples
#' edi_cols("Warm Blue")
#' edi_cols("Burnt Orange")
edi_cols <- function(...) {

  cols <- c(...)

  # Tests whether input length is always one
  if(is.null(cols)){
    stop("Please pick just one EDI color: 'Warm Blue', 'Burnt Orange' or 'Dark Blue'")
  }

  # Tests whether input length is maximum three
  if(length(cols) > 3){
    stop("Please pick at most three EDI colors: 'Warm Blue', 'Burnt Orange' or 'Dark Blue'")
  }

  # Tests whether input is one of the three available options
  if(!('Warm Blue' %in% cols) & !('Burnt Orange' %in% cols) & !('Dark Blue' %in% cols)){
    stop("Please pick an EDI color: 'Warm Blue', 'Burnt Orange', 'Dark Blue' or their combinations")
  }

  edi_cols_vec[cols]
}

########## edi_palettes ##########

# Creating EDI color palette (This can be modified in future)
edi_palettes <- list(
  `main`  = edi_cols("Warm Blue", "Burnt Orange", "Dark Blue"),

  `blue`  = edi_cols("Warm Blue", "Dark Blue"),

  `mixed` = edi_cols("Warm Blue", "Burnt Orange")
)

########## edi_pal() ##########

#' Interpolates an EDI color palette
#'
#' Function to create a color spectrum of the given palette
#'
#' @param palette Character name of palette in "edi_palettes" list
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette() function
#'
#' @return An interim function which takes the number of the levels within interpolation
#' as the input.  Eventually this returns a character of hex codes of the given palette
#'
#' @examples
edi_pal <- function(palette = "main", reverse = FALSE, ...) {

  # Tests whether the size of the palette is not zero
  if((length(palette) == 0)){
    stop("Please pick at least one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether the size of the palette is maximum one
  if((length(palette) != 1)){
    stop("Please pick just one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether input palette is one of the three available options
  if(!(palette %in% c("main", "blue", "mixed"))){
    stop("Please pick from an existing palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether reverse is TRUE or FALSE
  if(!(is.logical(reverse))){
    stop("'reverse' argument is either TRUE or FALSE")
  }

  pal <- edi_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

########## edi_scale_col() ##########

#' Constructs color scale for EDI colors
#'
#' Function to create a color scale of the given palette
#' @param palette Character name of palette in "edi_palettes"
#' @param discrete Boolean indicating whether color aesthetic is discrete or continuous
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @return A ggplot2 color scale based on the inputs
#' @export
#'
#' @examples
#' edi_scale_col("mixed", reverse = TRUE)
edi_scale_col <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {

  # Tests whether the size of the palette is not zero
  if((length(palette) == 0)){
    stop("Please pick at least one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether the size of the palette is maximum one
  if((length(palette) != 1)){
    stop("Please pick just one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether input palette is one of the three available options
  if(!(palette %in% c("main", "blue", "mixed"))){
    stop("Please pick from an existing palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether reverse is TRUE or FALSE
  if(!(is.logical(reverse))){
    stop("'reverse' argument is either TRUE or FALSE")
  }

  # Tests whether discrete is TRUE or FALSE
  if(!(is.logical(discrete))){
    stop("'discrete' argument is either TRUE or FALSE")
  }

  pal <- edi_pal(palette = palette, reverse = reverse)

  if (discrete) {
    list(ggplot2::discrete_scale("colour", paste("EDI", palette, "scale", sep = " "), palette = pal, ...),
         ggplot2::theme(axis.line = ggplot2::element_line(),   # Removing grid, color & borders
               panel.grid.major = ggplot2::element_blank(),
               panel.grid.minor = ggplot2::element_blank(),
               panel.border = ggplot2::element_blank(),
               panel.background = ggplot2::element_blank()))
  } else {
    list(ggplot2::scale_color_gradientn(colours = pal(256), ...),
         ggplot2::theme(axis.line = ggplot2::element_line(),   # Removing grid, background color & borders
               panel.grid.major = ggplot2::element_blank(),
               panel.grid.minor = ggplot2::element_blank(),
               panel.border = ggplot2::element_blank(),
               panel.background = ggplot2::element_blank()))
  }
}

########## edi_scale_fill() ##########

#' Constructs fill scale for EDI colors
#'
#' Function to create a color scale of the given palette
#' @param palette Character name of palette in "edi_palettes"
#' @param discrete Boolean indicating whether color aesthetic is discrete or continuous
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @return A ggplot2 fill scale based on the inputs
#' @export
#'
#' @examples
#' edi_scale_fill("mixed", discrete = FALSE, reverse = TRUE)
edi_scale_fill <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {

  # Tests whether the size of the palette is not zero
  if((length(palette) == 0)){
    stop("Please pick at least one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether the size of the palette is maximum one
  if((length(palette) != 1)){
    stop("Please pick just one palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether input palette is one of the three available options
  if(!(palette %in% c("main", "blue", "mixed"))){
    stop("Please pick from an existing palette: Either 'main', 'blue' or 'mixed'")
  }

  # Tests whether reverse is TRUE or FALSE
  if(!(is.logical(reverse))){
    stop("'reverse' argument is either TRUE or FALSE")
  }

  # Tests whether discrete is TRUE or FALSE
  if(!(is.logical(discrete))){
    stop("'discrete' argument is either TRUE or FALSE")
  }

  pal <- edi_pal(palette = palette, reverse = reverse)

  if (discrete) {
    list(ggplot2::discrete_scale("fill", paste("EDI", palette, "scale", sep = " "), palette = pal, ...),
         ggplot2::theme(axis.line = ggplot2::element_line(),   # Removing grid, background color & borders
               panel.grid.major = ggplot2::element_blank(),
               panel.grid.minor = ggplot2::element_blank(),
               panel.border = ggplot2::element_blank(),
               panel.background = ggplot2::element_blank()))
  } else {
    list(ggplot2::scale_fill_gradientn(colours = pal(256), ...),
         ggplot2::theme(axis.line = ggplot2::element_line(),   # Removing grid, color & borders
               panel.grid.major = ggplot2::element_blank(),
               panel.grid.minor = ggplot2::element_blank(),
               panel.border = ggplot2::element_blank(),
               panel.background = ggplot2::element_blank()))
  }
}
