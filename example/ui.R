library(rVega)
shinyUI(bootstrapPage(
    
    # Add custom CSS
    tagList(
        tags$head(
            tags$title("rVega Treemap Demo"),
            tags$link(rel="stylesheet", type="text/css",
                      href="style.css")
        )
    ),
    
    h3("rVega Treemap Demo"),
    HTML("<a href=\"https://github.com/metagraf/rVega\">https://github.com/metagraf/rVega</a>"),
    
    div(class = "row",
        div(class = "span4",
            sliderInput("si_vega1", label = "", min = 5, max = 10, value = 5)
        ),
        div(class = "span4",
            sliderInput("si_vega2", label = "", min = 5, max = 10, value = 5)
        )
    ),
    
    div(class = "row",
        div(class = "span4", vegaOutput("vega1")),
        div(class = "span4", vegaOutput("vega2"))
    )
))