library(rVega)
library(RJSONIO)

fileName <- 'example/treemap.json'
x <- readChar(fileName, file.info(fileName)$size)
x <- fromJSON(x)
rVega:::Vega$new(x)

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
