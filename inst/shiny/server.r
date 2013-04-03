require(rVega)
shinyServer(function(input, output) {
    output$show <- renderVega({
        return(.vega_object)
    })
})
