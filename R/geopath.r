#' Vega geopath
#' 
#' Create a geopath visualization
#' 
#' @export
geopath <- function(
    data = NULL,  # variable data
    id = names(data),  # id vector (e.g. wdi codes for matching wdi.geo.json)
    #fill = "lightblue",
    stroke = "white",
    strokeWidth = 0.5,
    #hover.fill = fill,
    hover.stroke = stroke,
    hover.strokeWidth = strokeWidth,
    url = "json/wdi.geo.json",
    projection = "orthographic",
    scale = 800,
    translate = c(a$opt$width / 2,  a$opt$height / 2),  # as default map position is centered
    ...
    ) {
    
    # OBS:
    ## Currently requires that the data/id include all observations available in geoJSON
    
    # Prepare empty labels if set to null
    if (is.null(id)) {
        id <- rep("", length(data))
    }
    
    # Prepare data
    x <- to_array(
        data.frame(
            key = id, 
            val = data,
            stringsAsFactors = FALSE
        )
    )

    # Create Vega object
    a <- rVega:::Vega$new(...)

    a$data(
        name = "variable",
        values = x
    )

    a$data(
        name = "map",
        url = url,
        format = list(
            type = "json",
            property = "features"
        ),
        transform = list(
            list(
                type = "geopath",
                value = "data",
                projection = projection,
                scale = scale
            ),
            list(
                type = "zip",
                key = "data.id",
                with = "variable",
                withKey = "data.key",
                as = "value"
            )
        )
    )

    a$scales(
        name = "color",
        domain = list(
            data = "variable", 
            field = "data.val"
        ),
        range = c("yellow", "red")
    )
    
    a$marks(
        type = "path",
        from = list(
            data = "map"
        ),
        properties = list(
            enter = list(
                path = list(field = "path")
            ),
            update = list(
                fill = list(
                    scale = "color",
                    field = "value.data.val"
                ),
                strokeWidth = list(value = strokeWidth),
                stroke = list(value = stroke)
            ),
            hover = list(
                #fill = list(value = hover.fill),
                strokeWidth = list(value = hover.strokeWidth),
                stroke = list(value = hover.stroke)
            )
        )
    )
    
    return(a$copy())
}