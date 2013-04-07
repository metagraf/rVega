# rVega: An R wrapper for Vega

Created by Thomas Reinholdsson (<reinholdsson@gmail.com>).

Shiny demo: [http://glimmer.rstudio.com/reinholdsson/rVega-treemap/](http://glimmer.rstudio.com/reinholdsson/rVega-treemap/).

More about Vega: [http://trifacta.github.com/vega/](http://trifacta.github.com/vega/).

## Installation

    devtools::install_github("rVega", "metagraf")

## Examples

```
library(rVega)
treemap(1:26, letters)
```

Demo: [http://glimmer.rstudio.com/reinholdsson/rVega-demo-1/](http://glimmer.rstudio.com/reinholdsson/rVega-demo-1/)

### Geopath

```
geopath(url = "json/world-countries.json", projection = "winkel3", scale = 200)

geopath(url = "json/wdi.geo.json", projection = "orthographic", scale = 300)
```

Demo: [http://glimmer.rstudio.com/reinholdsson/rVega-demo-2/](http://glimmer.rstudio.com/reinholdsson/rVega-demo-2/)

## Use with Shiny

#### server.R
```
library(rVega)
shinyServer(function(input, output) {
    output$plot <- renderVega({
        treemap(1:26, letters)
    })
})
```

#### ui.R
```
library(rVega)
shinyUI(bootstrapPage(
    vegaOutput("plot")
))
```

## See also

- [gg2v](https://github.com/hadley/gg2v) by Hadley Wickham

- [clickme](https://github.com/nachocab/clickme) by Nacho Caballero





