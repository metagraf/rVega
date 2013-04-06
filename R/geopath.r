#' Vega geopath
#' 
#' Create a geopath visualization
#' 
#' @export
geopath <- function(
    data, 
    labels = names(data),
    width = 1200, 
    height = 800, 
    font = "Helvetica Neue", 
    font.size = 14, 
    fill.color = "pink", 
    hover.color = "lightblue",
    border.color = "black",
    padding = c(0, 0, 0, 0),
    url = "data/us-states.json",
    projection = "albersUsa",
    scale = 300,
    translate = c(width / 2, height / 2)  # map position is centered given the width and height
    ) {

    # Create Vega object
    a <- rVega:::Vega$new()
    
    a$width(width)
    a$height(height)
    
    a$data(
        name = "world",
        url = url,
        format = list(
            type = "json",
            property = "features"
        )
    )

    a$marks(
        type = "path",
        from = list(
            data = "world",
            transform = list(
                list(
                    type = "geopath",
                    value = "data",
                    projection = projection,
                    scale = scale,
                    translate = translate
                )
            )
        ),
        properties = list(
            enter = list(
                stroke = list(value = border.color),
                path = list(field = "path")
            ),
            update = list(
                fill = list(
                    value = fill.color
                )
            ),
            hover = list(
                fill = list(
                    value = hover.color
                )
            )
        )
    )
    
    return(a)

}