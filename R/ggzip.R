library(ggplot2)

# Zip Theme
theme_zip <- function() {
  font <- "Source Sans Pro"
  # font <- "Work Sans"
  # font <- "Gelasio"

  # ggplot2::theme_minimal() %+replace%    #replace elements we want to change

  ggplot2::theme_minimal() + ggplot2::theme(
      # grid elements
      panel.background = ggplot2::element_blank(),
      strip.background = ggplot2::element_rect(fill="white"),
      # panel.grid.major = element_blank(),
      # panel.grid.minor = element_blank(),
      # axis.ticks = element_blank(),

      # text elements
      plot.title = ggplot2::element_text(
        # set font family
        family = font,
        # set font size
        size = 12.5,
        # bold typeface
        # face = 'bold',
        # left align
        hjust = 0,
        # raise slightly
        vjust = 4
      ),

      plot.subtitle = ggplot2::element_text(
        family = font,
        size = 10,
        color = "#888888",
        hjust = 0,
        vjust = 2
      ),

      plot.caption = ggplot2::element_text(
        family = font,
        size = 8,
        # right align
        hjust = 1,
        vjust = -3
      ),

      axis.title = ggplot2::element_text(
        family = font,
        size = 10
      ),

      axis.text = ggplot2::element_text(
        family = font,
        size = 10
      ),

      axis.text.x = ggplot2::element_text(
        margin = ggplot2::margin(1)
      ),

      plot.margin = ggplot2::margin(0.5, 0.2, 0.5, 0.5, unit = "cm")

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
#' font_add_google(name = "Work Sans", family = "Work Sans")
#' showtext_auto()
#'
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#' geom_point(size=3) +
#'   theme_zip_minimal() +
#'   labs(title = "Displacement vs MPG")
theme_zip_minimal <- function() {
  theme_zip()
}

#' Add zip classic theme to ggplot chart
#'
#' This function allows you to add the zip classic theme to your ggplotgraphics.
#' @keywords zip_style
#' @export
#' @examples
#' require(ggplot2)
#' require(showtext)
#' font_add_google(name = "Work Sans", family = "Work Sans")
#' showtext_auto()
#'
#' ggplot(mtcars, aes(x = mpg, y = disp, color=as.factor(cyl))) +
#' geom_point(size=3) +
#'   theme_zip_classic() +
#'   labs(title = "Displacement vs MPG")
theme_zip_classic <- function() {
  theme_zip() +
  ggplot2::theme(
      # grid elements
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
    )
}
