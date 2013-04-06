\name{treemap}
\alias{treemap}
\title{Vega treemap}
\usage{
  treemap(data, labels = names(data),
    font = "Helvetica Neue", font.size = 14,
    fill.color = "pink", hover.color = "lightblue", ...)
}
\arguments{
  \item{data}{Numeric vector that determines the size of
  the boxes}

  \item{labels}{Label vector, default "names(data)". If
  NULL labels will be removed.}

  \item{font}{Font}

  \item{font.size}{Font size}

  \item{fill.color}{Fill color}

  \item{hover.color}{Hover color}

  \item{...}{Vega class arguments (such as width, height,
  padding, viewport, etc.)}
}
\description{
  Create a treemap visualization
}

