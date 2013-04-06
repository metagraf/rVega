\name{treemap}
\alias{treemap}
\title{Vega treemap}
\usage{
  treemap(data, labels = names(data), width = 500,
    height = 400, font = "Helvetica Neue", font.size = 14,
    fill.color = "pink", hover.color = "lightblue",
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

  \item{fill.color}{Fill color}

  \item{hover.color}{Hover color}

  \item{padding}{Padding c("top", "bottom", "left",
  "right")}
}
\description{
  Create a treemap visualization
}

