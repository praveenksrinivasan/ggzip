library(ggplot2)

fonts = c(
  "IBM Plex Sans",
  "Source Sans Pro",
  "Work Sans",
  "Titillium Web",
  "Public Sans Light",
  "Cooper Light BT",
  "Sharp Grotesk Light 20"
)

# Zip Theme
theme_zip <- function(base_size, base_family, base_line_size, base_rect_size) {


  ggplot2::theme_minimal(base_size = base_size,
                         base_family = base_family,
                         base_line_size = base_line_size,
                         base_rect_size = base_rect_size
                         ) +
  ggplot2::theme(
      # grid elements
      panel.background = ggplot2::element_blank(),
      strip.background = ggplot2::element_rect(fill="white"),

      # text elements
      plot.title = ggplot2::element_text(
        # set font family
        # family = base_family,
        # set font size
        # size = 12.5,
        # bold typeface
        # face = 'bold',
        # left align
        hjust = 0,
        # raise slightly
        vjust = 2
      ),

      plot.subtitle = ggplot2::element_text(
        # family = base_family,
        # size = 10,
        hjust = 0,
        vjust = 2,
        color = "#888888"
      ),

      plot.caption = ggplot2::element_text(
        # family = base_family,
        # size = 8,
        # right align
        hjust = 1,
        vjust = -3,
        color = "#888888"
      ),

      # axis.title = ggplot2::element_text(
        # family = base_family,
        # size = 10
      # ),

      # axis.text = ggplot2::element_text(
        # family = base_family,
        # size = 10
      # ),

      axis.text.x = ggplot2::element_text(
        margin = ggplot2::margin(1)
      ),

      plot.margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, unit = "cm")

      # since the legend often requires manual tweaking
      # based on plot content, don't define it here
    )
}

#' Add zip minimal theme to ggplot chart
#'
#' This function allows you to add the zip minimal theme to your ggplotgraphics.
#' @keywords zip_style
#' @export
#' @examples
#' require(ggplot2)
#' require(showtext)
#' font_add_google(name = "Source Sans Pro", family = "Source Sans Pro")
#' showtext_auto()
#'
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#' geom_point(size=3) +
#'   theme_zip_minimal() +
#'   labs(title = "Displacement vs MPG")
theme_zip_minimal <- function(
                       base_size = 11,
                       base_family = "Titillium Web",
                       base_line_size = base_size / 22,
                       base_rect_size = base_size / 22) {
    theme_zip(
      base_size = base_size,
      base_family = base_family,
      base_line_size = base_line_size,
      base_rect_size = base_rect_size
    )
  }

#' Add zip classic theme to ggplot chart
#'
#' This function allows you to add the zip classic theme to your ggplotgraphics.
#' @keywords zip_style
#' @export
#' @examples
#' require(ggplot2)
#' require(showtext)
#' font_add_google(name = "Source Sans Pro", family = "Source Sans Pro")
#' showtext_auto()
#'
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#' geom_point(size=3) +
#'   theme_zip_classic() +
#'   labs(title = "Displacement vs MPG")
theme_zip_classic <- function(
                        base_size = 11,
                        base_family = "Titillium Web",
                        base_line_size = base_size / 22,
                        base_rect_size = base_size / 22) {
  theme_zip(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) +
  ggplot2::theme(
      # grid elements
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
    )
}
