#' Vega geopath
#' 
#' Create a geopath visualization
#' 
#' @export
vega_geopath <- function(
    data, 
    labels = names(data),
    width = 1200, 
    height = 800, 
    font = "Helvetica Neue", 
    font_size = 14, 
    fill_color = "pink", 
    hover_color = "lightblue", 
    padding = c(0, 0, 0, 0),
    url = "data/us-states.json",
    projection = "albersUsa",
    scale = 300,
    viewport = c(960, 500),
    translate = viewport
    ) {
    
    # TODO
    # How to get all url (geoJSON) and projection types to work?
    
    #suppressMessages(singleton(addResourcePath("geo", system.file('js/d3-plugins/geo/projection', package='rVega'))))

    # Create Vega object
    rVega:::Vega$new(
        list(
            width = width,
            height = height,
            viewport = viewport,
            data = list(
                list(
                    name = "world",
                    url = url,
                    format = list(
                        type = "json",
                        property = "features"
                    )
                )
            ),
            marks = list(
                list(
                    type = "path",
                    from = list(
                        data = "world",
                        transform = list(list(
                            type = "geopath",
                            value = "data",
                            projection = projection,
                            scale = scale,
                            translate = translate
                        ))
                    ),
                    properties = list(
                        enter = list(
                            stroke = list(value = "#fff"),
                            path = list(field = "path")
                        ),
                        update = list(fill = list(value = fill_color)),
                        hover = list(fill = list(value = hover_color))
                    )
                )
            )
        )
    )
}