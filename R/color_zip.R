# Zip Colors
zip_colors = c(
  # primary colors
  darkest = "#1b1323",
  dark = "#3b115b",
  medium = "#8364bf",
  fearless = "#aa8fff",
  light = "#c9b3ff",
  lighter = "#dbccff",
  lightest = "#ede6ff",
  control_white = "#fffffa",
  confidence_blue = "#1A0826",

  # secondary colors
  peach = "#FAE2B9",
  tan = "#F3F3E0",
  business = "#6EC8FF",
  business_light = "#AEDEFF",
  business_lighter = "#D0EEFD",
  electric_green = "#DCF995"
)

#' Zip Primary Color Palette list
#'
#' @export
zip_primary_colors <- list(
  darkest = "#1b1323",
  dark = "#3b115b",
  medium = "#8364bf",
  fearless = "#aa8fff",
  light = "#c9b3ff",
  lighter = "#dbccff",
  lightest = "#ede6ff",
  control_white = "#fffffa",
  confidence_blue = "#1A0826"
)

#' Zip Secondary Color Palette list
#'
#' @export
zip_secondary_colors <-
  list(
    peach = "#FAE2B9",
    tan = "#F3F3E0",
    business = "#6EC8FF",
    business_light = "#AEDEFF",
    business_lighter = "#D0EEFD",
    electric_green = "#DCF995"
  )


#' Function to extract Zip colors as hex codes
#'
#' @param ... Character names of zip_colors
#' @export
#' @examples
#' zip_cols()
#' zip_cols("dark")
zip_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (zip_colors)

  zip_colors[cols]
}


#' Zip Palettes list
#'
#' @export
zip_palettes <- list(
  `main`  = zip_cols("dark", "medium", "fearless"),

  `hot`   = zip_cols("dark", "medium", "fearless"),

  `cool`  = zip_cols("light", "lighter", "lightest"),

  `primary`  = zip_cols("darkest", "dark", "medium", "fearless", "light", "lighter", "lightest"),

  `secondary` = zip_cols("peach", "tan", "business", "business_light", "business_lighter",
    "electric_green")
)


#' Return function to interpolate a zip color palette
#'
#' @param palette Character name of palette in zip_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
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
#' @example
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#'   geom_point(size=3) +
#'   theme_minimal() +
#'   labs(title = "Displacement vs MPG", color="cyl") +
#'   scale_color_zip()
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
#' @example
#' ggplot(mtcars, aes(x = mpg, fill=as.factor(cyl))) +
#'   geom_histogram(bins=8) +
#'   theme_minimal() +
#'   labs(title = "MPG Distribution", fill="cyl") +
#'   scale_fill_zip()
scale_fill_zip <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- zip_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("zip_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
