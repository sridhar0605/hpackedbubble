#' Create Split Packed Bubble Charts
#'
#' @description By binding R functions and the 'Highcharts' <http://www.highcharts.com/> charting library, 'hpackedbubble' package provides a simple way to draw split packed bubble charts.
#'
#' @param cat category verctor;
#' @param name name vector;
#' @param value value vector;
#' @param width chart width, for example, "100\%";
#' @param height chart height, for example, "400px";
#' @param theme chart theme, you can use these themes:
#' darkgreen/darkblue/avocado/darkunica/gray/
#' gridlight/grid/sandsignika/sunset;
#' @param title title;
#' @param titleAlign title alignment, left/center/right;
#' @param titleSize title size, like "20px";
#' @param titleColor title color, like "#333333";
#' @param subtitle subtitle;
#' @param subtitleAlign subtitle alignment, left/center/right;
#' @param subtitleSize subtitle size, like "16px";
#' @param subtitleColor subtitle color, like "#666666"
#' @param pointFormat The HTML of the point's line in the tooltip.
#' @param split Whether to split series into individual groups or to mix all series together. 1 means to split, 0 means to not, defaults to split;
#' @param packedbubbleMinSize Minimum bubble size. Defaults to '50\%';
#' @param packedbubbleMaxSize Maximum bubble size. Defaults to '250\%';
#' @param packedbubbleZMin The minimum for the Z value range. Defaults to 0, you can use the lowest Z value in the data;
#' @param packedbubbleZmax The maximum for the Z value range. Defaults to 1000, you can use the highest Z value in the data;
#' @param gravitational Gravitational const used in the barycenter force of the algorithm. Defaults to 0.0625.
#' @param seriesInteraction Whether series should interact with each other or not. 1 means to true, 0 means to false, defaults to 1;
#' @param dragBetweenSeries In case of split series, this option allows user to drag and drop points between series, for changing point related series. 1 means to true, 0 means to false, defaults to 1;
#' @param parentNodeLimit Whether bubbles should interact with their parentNode to keep them inside. 1 means to true, 0 means to false, defaults to 1;
#' @param dataLabels Options for the series data labels, appearing next to each data point. 1 means to true, 0 means to false, defaults to 1;
#' @param dataLabelsformat Data labels' format
#' @param dataLabelsFilter Show data labels while 'value' larger than dataLabelsFilter. defaults to 250.
#' @param dataLabelsColor Data labels' color, defaults to black.
#'
#' @import htmlwidgets
#' @examples
#' library(hpackedbubble)
#' if (interactive()) {
#'   hpackedbubble(CO2$continent, CO2$country, CO2$CO2)
#' }
#' @export
hpackedbubble <- function(
  cat,
  name,
  value,
  theme = "sandsignika",
  width = NULL,
  height = NULL,
  title = "",
  titleAlign = "center",
  titleSize = "20px",
  titleColor = "#333333",
  subtitle = "",
  subtitleAlign = "center",
  subtitleSize = "",
  subtitleColor = "#666666",
  pointFormat = "<b>{point.name}:</b> {point.y}",
  split = 1,
  packedbubbleMinSize = '50%',
  packedbubbleMaxSize = '250%',
  packedbubbleZMin = 0,
  packedbubbleZmax = 1000,
  gravitational = 0.0625,
  seriesInteraction = 1,
  dragBetweenSeries = 1,
  parentNodeLimit = 1,
  dataLabels = 1,
  dataLabelsformat = '{point.name}',
  dataLabelsFilter = 250,
  dataLabelsColor = "black"
) {

  # forward options using x
  x = list(
    cat = cat,
    name = name,
    value = value,
    theme = theme,
    title = title,
    titleAlign = titleAlign,
    titleSize = titleSize,
    titleColor = titleColor,
    subtitle = subtitle,
    subtitleAlign = subtitleAlign,
    subtitleSize = subtitleSize,
    subtitleColor = subtitleColor,
    pointFormat = pointFormat,
    split = split,
    packedbubbleMinSize = packedbubbleMinSize,
    packedbubbleMaxSize = packedbubbleMaxSize,
    packedbubbleZMin = packedbubbleZMin,
    packedbubbleZmax = packedbubbleZmax,
    gravitational = gravitational,
    seriesInteraction = seriesInteraction,
    dragBetweenSeries = dragBetweenSeries,
    parentNodeLimit = parentNodeLimit,
    dataLabels = dataLabels,
    dataLabelsformat = dataLabelsformat,
    dataLabelsFilter = dataLabelsFilter,
    dataLabelsColor = dataLabelsColor
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'hpackedbubble',
    x,
    width = width,
    height = height,
    package = 'hpackedbubble'
  )
}

#' Shiny bindings for hpackedbubble
#'
#' Output and render functions for using hpackedbubble within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a hpackedbubble
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name hpackedbubble-shiny
#'
#' @export
hpackedbubbleOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'hpackedbubble', width, height, package = 'hpackedbubble')
}

#' @rdname hpackedbubble-shiny
#' @export
renderHpackedbubble <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, hpackedbubbleOutput, env, quoted = TRUE)
}
