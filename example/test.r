library(rVega)

# fileName <- 'example/treemap.json'
# x <- readChar(fileName, file.info(fileName)$size)
# x <- fromJSON(x)
# rVega:::Vega$new(x)

# Treemap specification
treemap <- list(
    name = "treemap",
    width = 900,
    height = 500,
    padding = list(top = 0, bottom = 0, left = 0, right = 0),
    data = list(
        list(
            name = "table",
                values = list(99,23,47,6,52,19),
                transform = list(
                    list(type = "facet"), 
                    list(type = "treemap"),
                    list(type = "filter", test = "!d.children"))
            )
        ),
    marks = list(
        list(
            type = "rect",
            from = list(data = "table"),
            properties = list(
                enter = list(
                    x = list(field = "x"),
                    y = list(field = "y"),
                    width = list(field = "width"),
                    height = list(field = "height"),
                    stroke = list(value = "#fff")
                ),
                update = list(fill = list(value = "#ccc")),
                hover = list(fill = list(value = "pink"))
            )
        ),
        list(
            type = "text",
            from = list(
                data = "table"
            ),
            interactive = FALSE,
            properties = list(
                enter = list(
                    x = list(field = "x"),
                    y = list(field = "y"),
                    dx = list(value = 4),
                    dy = list(value = 4),
                    font = list(value = "Helvetica Neue"),
                    fontSize = list(value = 14),
                    align = list(value = "left"),
                    baseline = list(value = "top"),
                    fill = list(value = "#000"),
                    text = list(field = "data")
                )
            )
        )
    )
)

rVega:::Vega$new(treemap)
