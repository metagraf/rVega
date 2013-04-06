#' Vega treemap
#' 
#' Create a treemap visualization
#' 
#' @param data Numeric vector that determines the size of the boxes
#' @param labels Label vector, default "names(data)". If NULL labels will be removed.
#' @param font Font
#' @param font.size Font size
#' @param fill.color Fill color
#' @param hover.color Hover color
#' @param ... Vega class arguments (such as width, height, padding, viewport, etc.)
#' 
#' @export
treemap <- function(
    data,
    labels = names(data),
    font = "Helvetica Neue", 
    font.size = 14, 
    fill.color = "pink", 
    hover.color = "lightblue",
    ...
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
    a <- rVega:::Vega$new(...)

    a$data(
        name = "table",
        values = x,
        transform = list(
            list(type = "facet"), 
            list(type = "treemap", value = "data.a"),
            list(type = "filter", test = "!d.children"))
    )
    
    a$marks(
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
            update = list(fill = list(value = fill.color)),
            hover = list(fill = list(value = hover.color))
        )
    )
    
    a$marks(
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
                fontSize = list(value = font.size),
                align = list(value = "left"),
                baseline = list(value = "top"),
                fill = list(value = "#000"),
                text = list(field = "data.b")
            )
        )
    )
    
    return(a$copy())
}