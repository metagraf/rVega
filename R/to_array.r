#' Data frame to list array
#'
#' @param x data frame
#'
#' @export
#'
to_array <- function(x) {
    lapply(as.list(1:dim(x)[1]), function(i) x[i[1],])
} 
