#' renderVega (use with Shiny)
#' 
#' ...
#' 
#' @param expr An expression that returns a chart object
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is expr a quoted expression (with \code{quote()})? This is useful if you want to save an expression in a variable.
#' 
#' @export
renderVega <- function(expr, env = parent.frame(), quoted = FALSE) {
    func <- shiny::exprToFunction(expr, env, quoted)
    
    function() {
        vega <- func()
        vega$html()
    }
}