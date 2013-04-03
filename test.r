library(rVega)
library(RJSONIO)

fileName <- 'test.json'
x <- readChar(fileName, file.info(fileName)$size)
x <- fromJSON(x)

rVega:::Vega$new(x)