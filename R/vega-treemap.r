#' Vega treemap
#' 
#' Create a treemap visualization
#' 
#' @param data Numeric vector that determines the size of the boxes
#' @param labels Label vector, default "names(data)". If NULL labels will be removed.
#' @param width Width
#' @param height Height
#' @param font Font
#' @param font.size Font size
#' @param fill_color Fill color
#' @param hover_color Hover color
#' @param padding Padding c("top", "bottom", "left", "right")
#' 
#' @export
vega_treemap <- function(
    data, 
    labels = names(data),
    width = 200, 
    height = 200, 
    font = "Helvetica Neue", 
    font_size = 14, 
    fill_color = "pink", 
    hover_color = "lightblue", 
    padding = c(0, 0, 0, 0)
) {
    
    # Prepare empty labels if set to null
    if (is.null(labels)) {
        labels <- rep("", length(data))
    }
    
    # Prepare data
    x <- to_array(
        data.frame(
            a = data, 
            b = labels
        )
    )

    # Create Vega object
    rVega:::Vega$new(
        list(
            name = "treemap",
            width = width,
            height = height,
            padding = list(top = padding[1], bottom = padding[2], left = padding[3], right = padding[4]),
            data = list(
                list(
                    name = "table",
                    values = x,
                    transform = list(
                        list(type = "facet"), 
                        list(type = "treemap", value = "data.a"),
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
                        update = list(fill = list(value = fill_color)),
                        hover = list(fill = list(value = hover_color))
                    )
                ),
                list(
                    type = "text",
                    from = list(data = "table"),
                    interactive = FALSE,
                    properties = list(
                        enter = list(
                            x = list(field = "x"),
                            y = list(field = "y"),
                            dx = list(value = 4),
                            dy = list(value = 4),
                            font = list(value = font),
                            fontSize = list(value = font_size),
                            align = list(value = "left"),
                            baseline = list(value = "top"),
                            fill = list(value = "#000"),
                            text = list(field = "data.b")
                        )
                    )
                )
            )
        )
    )
}