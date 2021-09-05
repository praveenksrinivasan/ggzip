# Zip Colors
zip_colors <- c(
  `dark purple 2` = "#1b1323",
  `dark purple 1` = "#3b115b",
  `light purple 5` = "#8364bf",
  `light purple 4` = "#aa8fff",
  `light purple 3` = "#c9b3ff",
  `light purple 2` = "#dbccff",
  `light purple 1` = "#ede6ff",
  `near white` = "#fffffa"
)


#' Function to extract Zip colors as hex codes
#'
#' @param ... Character names of zip_colors
#' @export
#' @examples
#' zip_cols()
#' zip_cols("dark purple 1")
zip_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (zip_colors)

  zip_colors[cols]
}


zip_palettes <- list(
  `main`  = zip_cols("dark purple 2", "dark purple 1", "light purple 5"),

  `primary`  = zip_cols("dark purple 2", "light purple 5", "light purple 3"),

  `cool`  = zip_cols("light purple 5", "light purple 2"),

  `hot`   = zip_cols("dark purple 2", "dark purple 1", "light purple 5"),

  `mixed` = zip_cols(
    "dark purple 2",
    "dark purple 1",
    "light purple 5",
    "light purple 4",
    "light purple 3",
    "light purple 2",
    "light purple 1"
  ),

  `light`  = zip_cols("light purple 2", "light purple 1")
)


#' Return function to interpolate a zip color palette
#'
#' @param palette Character name of palette in zip_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
#' @example
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#'   geom_point(size=3) +
#'   theme_zip_minimal() +
#'   labs(title = "Displacement vs MPG") +
#'   theme(legend.position = "none")
zip_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- zip_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}


#' Color scale constructor for zip colors
#'
#' @param palette Character name of palette in zip_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#'
scale_color_zip <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- zip_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("zip_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}


#' Fill scale constructor for zip colors
#'
#' @param palette Character name of palette in zip_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#'
scale_fill_zip <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- zip_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("zip_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
