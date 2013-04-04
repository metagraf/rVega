library(rVega)
shinyServer(function(input, output) {

    output$text <- renderText({
      "Some text"  
    })
    
    # VEGA 1
    output$vega1 <- renderVega({
        treemap <- list(
            name = "treemap",
            width = 220,
            height = 200,
            padding = list(top = 0, bottom = 0, left = 0, right = 0),
            data = list(
                list(
                    name = "table",
                    values = sample(20:100, input$si_vega1),
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
                        update = list(fill = list(value = "pink")),
                        hover = list(fill = list(value = "lightblue"))
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
    })
    
    # VEGA 2
    output$vega2 <- renderVega({
        treemap <- list(
            name = "treemap",
            width = 220,
            height = 200,
            padding = list(top = 0, bottom = 0, left = 0, right = 0),
            data = list(
                list(
                    name = "table",
                    values = sample(20:100, input$si_vega2),
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
                        update = list(fill = list(value = "lightblue")),
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
    })
})
