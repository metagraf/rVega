#' vegaOutput (use with Shiny)
#' 
#' ...
#' 
#' @param outputId output variable to read the value from
#' 
#' @export
vegaOutput <- function(outputId) {
    
    # Add javascript resources
    suppressMessages(singleton(addResourcePath("js", system.file('js', package='rVega'))))

    # Add data resources
    suppressMessages(singleton(addResourcePath("json", system.file('json', package='rVega'))))
    
    div(class="rVega",
        
        # Add javascript sources to header
        tagList(
            singleton(tags$head(tags$script(src = "js/d3.v3.min.js", type='text/javascript'))),
            singleton(tags$head(tags$script(src = "js/d3.geo.projection.v0.min.js", type='text/javascript'))),
            singleton(tags$head(tags$script(src = "js/vega.min.js", type='text/javascript')))
            
        ),
        
        # Add chart html
        htmlOutput(outputId)
    )
}