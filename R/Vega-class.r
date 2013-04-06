#' @title Vega class
#' 
#' @description ...
#' 
#' @section \code{html()}: A method to convert the chart object to HTML code. The code does not include necessary JavaScript files (e.g. Vega and jQuery); however, when used interactively (\code{show()}) or with Shiny, those are automatically included.
#' 
#' @examples \dontrun{
#' ...
#' }
#' 
Vega <- setRefClass(
    "Vega",
    fields = list(opt = "list"),
    methods = list(
        initialize = function(
            # Defaults
            width = 600,
            height = 400,
            padding = c(0, 0, 0, 0),
            viewport = NULL,
            name = NULL,
            spec = NULL  # specification list
        ) {
            # Set arguments
            opt <<- if (is.null(spec)) list() else spec
            opt$name <<- name
            opt$width <<- width
            opt$height <<- height
            opt$padding <<- list(
                top = padding[[1]], 
                bottom = padding[[2]], 
                left = padding[[3]], 
                right = padding[[4]]
            )
            opt$viewport <<- viewport
        },

        #' Wrapper methods
        data = function(..., replace = FALSE) {
            opt$data <<- if (replace) list(list(...))
            else c(opt$data, list(list(...)))
        },
        
        marks = function(..., replace = FALSE) {
            opt$marks <<- if (replace) list(list(...))
            else c(opt$marks, list(list(...)))
        },
        
        scales = function(...) opt$scales <<- list(...),
        axes = function(...) opt$axes <<- list(...),

        #' Print chart as HTML
        html = function(id = tempfile(tmpdir = "")) {  # tempfile() is just used to create a random string

            id <- gsub("/", "", id)
            
            html <- sprintf("<div id=\"%2$s\"></div>
                <script type=\"text/javascript\">
                    vg.parse.spec(%1$s, function(chart){ 
                        chart({el:\"#%2$s\"}).update();});
                </script>", RJSONIO:::toJSON(opt), id)
            return(html)
        },
        
        show = function() {
            assign(".vega_object", .self$copy(), envir = .GlobalEnv)
            shiny::runApp(file.path(system.file(package = "rVega"), "shiny"))
        }
    )
)
