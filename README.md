# rVega: An R wrapper for Vega

Created by Thomas Reinholdsson (<reinholdsson@gmail.com>).

Read more about Vega at [http://trifacta.github.com/vega/](http://trifacta.github.com/vega/).

...

## Installation

    library(devtools)
    install_github("rVega", "reinholdsson")

## Example

```
library(rVega)

# Treemap specification
treemap <- list(
    name = "treemap",
    width = 900,
    height = 500,
    padding = c(top = 0, bottom = 0, left = 0, right = 0),
    data = list(
        list(
            name = "table",
                values = c(99,23,47,6,52,19),
                transform = list(
                    c(type = "facet"), 
                    c(type = "treemap"),
                    c(type = "filter", test = "!d.children"))
            )
        ),
    marks = list(
        list(
            type = "rect",
            from = c(data = "table"),
            properties = list(
                enter = list(
                    x = c(field = "x"),
                    y = c(field = "y"),
                    width = c(field = "width"),
                    height = c(field = "height"),
                    stroke = c(value = "#fff")
                ),
                update = list(fill = c(value = "#ccc")),
                hover = list(fill = c(value = "pink"))
            )
        ),
        list(
            type = "text",
            from = c(
                data = "table"
            ),
            interactive = FALSE,
            properties = list(
                enter = list(
                    x = c(field = "x"),
                    y = c(field = "y"),
                    dx = c(value = 4),
                    dy = c(value = 4),
                    font = c(value = "Helvetica Neue"),
                    fontSize = c(value = 14),
                    align = c(value = "left"),
                    baseline = c(value = "top"),
                    fill = c(value = "#000"),
                    text = c(field = "data")
                )
            )
        )
    )
)

rVega:::Vega$new(treemap)
```
