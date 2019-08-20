# hpackedbubble
<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis](https://travis-ci.org/czxa/hpackedbubble.svg?branch=master)](https://travis-ci.org/czxa/hpackedbubble)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-month/hpackedbubble?color=blue)](https://r-pkg.org/pkg/hpackedbubble)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-day/hpackedbubble?color=blue)](https://r-pkg.org/pkg/hpackedbubble)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-week/hpackedbubble?color=blue)](https://r-pkg.org/pkg/hpackedbubble)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/hpackedbubble?color=blue)](https://r-pkg.org/pkg/hpackedbubble)
<!-- badges: end -->
Create Split Packed Bubble Charts

See [Create Split Packed Bubble Charts @ Rpub](http://rpubs.com/czxatop/hpackedbubble)

By binding R functions and the 'Highcharts' <http://www.highcharts.com/> charting library, 'hpackedbubble' package provides a simple way to draw split packed bubble charts. When using this package, please pay attention to whether your computer is connected to the Internet. The software package can only work properly when there is a network connection.

## Installation

```r 
# From CRAN
install.packages("hpackedbubble", build_vignettes = TRUE)
# Or from GitHub
devtools::install_github("czxa/hpackedbubble", build_vignettes = TRUE)
```

This software package can draw two kinds of bubble chart, packed bubble charts and split packed bubble charts. these two pattern was controled by `split` parameter. `split = 1` means to draw split packed bubble charts and `split = 0` means packed bubble charts. 

## Packed Bubble Charts and Split Packed Bubble Charts

There is a build-in data set named `CO2`. It contains carbon emissions data from all over the world for 2014. Bubble charts can be used to visually show the relationship between the size of carbon emissions in different countries：

```r
library(hpackedbubble)
hpackedbubble(CO2$continent, CO2$country, CO2$CO2,
              title = "CARBON EMISSIONS AROUND THE WORLD (2014)",
              pointFormat = "<b>{point.name}:</b> {point.y}m CO<sub>2</sub>",
              dataLabelsFilter = 100,
              packedbubbleMinSize = "50%",
              packedbubbleMaxSize = "250%",
              theme = "sunset",
              packedbubbleZMin = 0,
              packedbubbleZmax = 10000, split = 0,
              gravitational = 0.02,
              parentNodeLimit = 1,
              dragBetweenSeries = 0,
              width = "100%")
```

![](https://czxb.github.io/br/hpackedbubble1.png)

It's very crowded to put together the bubbles of countries on all continents. Splot packed bubble chart separates bubbles from continents by a single large bubble: 

```r
hpackedbubble(CO2$continent, CO2$country, CO2$CO2,
              title = "CARBON EMISSIONS AROUND THE WORLD (2014)",
              pointFormat = "<b>{point.name}:</b> {point.y}m CO<sub>2</sub>",
              dataLabelsFilter = 100,
              packedbubbleMinSize = "50%",
              packedbubbleMaxSize = "150%",
              theme = "sunset",
              packedbubbleZMin = 0,
              packedbubbleZmax = 1000, split = 1,
              gravitational = 0.02,
              parentNodeLimit = 1,
              dragBetweenSeries = 0,
              seriesInteraction = 0,
              width = "100%")
```
![](https://czxb.github.io/br/hpackedbubble2.png)

It looks much better. 

## Theme parameter

I set many parameters for this chart, the most influential of which is the 'theme' parameter. there have 9 kinds of theme you can use: darkgreen, darkblue, avocado, darkunica, gray, gridlight, grid, sandsignika and sunset. 

### darkgreen

```r
hpackedbubble(CO2$continent, CO2$country, CO2$CO2,
              title = "CARBON EMISSIONS AROUND THE WORLD (2014)",
              pointFormat = "<b>{point.name}:</b> {point.y}m CO<sub>2</sub>",
              dataLabelsFilter = 100,
              packedbubbleMinSize = "50%",
              packedbubbleMaxSize = "150%",
              packedbubbleZMin = 0,
              packedbubbleZmax = 1000, split = 1,
              gravitational = 0.02,
              parentNodeLimit = 1,
              dragBetweenSeries = 0,
              seriesInteraction = 0,
              theme = "darkgreen",
              titleColor = "white",
              width = "100%")
```

![](https://czxb.github.io/br/hpackedbubble3.png)

### sandsignika

```r
hpackedbubble(CO2$continent, CO2$country, CO2$CO2,
              title = "CARBON EMISSIONS AROUND THE WORLD (2014)",
              pointFormat = "<b>{point.name}:</b> {point.y}m CO<sub>2</sub>",
              dataLabelsFilter = 100,
              packedbubbleMinSize = "50%",
              packedbubbleMaxSize = "150%",
              packedbubbleZMin = 0,
              packedbubbleZmax = 1000, split = 1,
              gravitational = 0.02,
              parentNodeLimit = 1,
              dragBetweenSeries = 0,
              seriesInteraction = 0,
              theme = "sandsignika",
              titleColor = "black",
              width = "100%")
```

![](https://czxb.github.io/br/hpackedbubble4.png)

To see more examples, you can run a shiny applications in this package:

```r
dir <- system.file("examples", "hpackedbubble", package = "hpackedbubble")
setwd(dir)
shiny::shinyAppDir(".")
```

![](https://czxb.github.io/br/hpackedbubble5.png)

## Using `hpackedbubble` within Shiny applications

Of course, it can be used in RMarkdown documents and Shiny applications.

------------

<h4 align="center">

License

</h4>

<h6 align="center">

MIT © czxa.top

</h6>


