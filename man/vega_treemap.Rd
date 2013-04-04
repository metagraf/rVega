\name{vega_treemap}
\alias{vega_treemap}
\title{Vega treemap}
\usage{
  vega_treemap(data, labels = names(data), width = 200,
    height = 200, font = "Helvetica Neue", font_size = 14,
    fill_color = "pink", hover_color = "lightblue",
    padding = c(0, 0, 0, 0))
}
\arguments{
  \item{data}{Numeric vector that determines the size of
  the boxes}

  \item{labels}{Label vector, default "names(data)". If
  NULL labels will be removed.}

  \item{width}{Width}

  \item{height}{Height}

  \item{font}{Font}

  \item{font.size}{Font size}

  \item{fill_color}{Fill color}

  \item{hover_color}{Hover color}

  \item{padding}{Padding c("top", "bottom", "left",
  "right")}
}
\description{
  Create a treemap visualization
}

