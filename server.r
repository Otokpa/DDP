library(datasets)
data(InsectSprays)

insectMeasure <- function(spray, func) {
    if(func == 'Mean') {
        mean(InsectSprays$count[ InsectSprays$spray == spray])
    } else{ if(func == 'Sum') {
        sum(InsectSprays$count[ InsectSprays$spray == spray])
    }else{
        sd(InsectSprays$count[ InsectSprays$spray == spray])}
    
}
}

histSpray <- function(spray) {
    hist(InsectSprays$count[InsectSprays$spray == spray], main = paste('Spray type', spray), 
         xlab = 'Insect Count', col = 'lightblue', breaks = 8)}
shinyServer(
    function(input, output){
        output$oSelectSpray <- renderPrint({input$select})
        output$oFunction <- renderPrint({input$func})
        output$result <- renderPrint({insectMeasure(input$select, input$func)})
        output$hist <- renderPlot({histSpray(input$select)})
        output$boxplot <- renderPlot({boxplot(count ~ spray, data = InsectSprays,
                                              xlab = "Type of spray", ylab = "Insect count",
                                              main = "InsectSprays data", varwidth = TRUE, col = "lightblue")})
        
})



