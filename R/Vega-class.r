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
        initialize = function(x = NULL) {
            opt <<- if (is.null(x)) list() else x
        },

        #' Wrapper methods
        name = function(...) opt$name <<- list(...),
        width = function(...) opt$width <<- list(...),
        height = function(...) opt$height <<- list(...),
        viewport = function(...) opt$viewport <<- list(...),
        padding = function(...) opt$padding <<- list(...),
        data = function(...) opt$data <<- list(...),
        scales = function(...) opt$scales <<- list(...),
        axes = function(...) opt$axes <<- list(...),
        marks = function(...) opt$marks <<- list(...),

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
