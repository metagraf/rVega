#' Vega geopath
#' 
#' Create a geopath visualization
#' 
#' @export
geopath <- function(
    fill.color = "pink", 
    hover.color = "lightblue",
    border.color = "black",
    url = "data/us-states.json",
    projection = "albersUsa",
    scale = 500,
    translate = c(a$opt$width / 2,  a$opt$height / 2),  # as default map position is centered
    ...
    ) {

    # Create Vega object
    a <- rVega:::Vega$new(...)

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
    
    return(a$copy())
}