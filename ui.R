library(shiny)
shinyUI(
    fluidPage(
        headerPanel('Performance of Agricultural Insecticides'),
        fluidRow(column(12, h4('User Guide'), 
                        helpText('This application loads the InsectSprays dataset from the datasets library. ',
' This dataset gives the counts of insects in agricultural experimental units treated with different insecticides.',
' There are 6 types of sprays, named "A" "B" "C" "D" "E" "F".',
' As you choose a function and a spray type, the application applies the function to the distribution of insect counts by spray type.',
'The application also plots a histogram of the insect counts  chosen. ',
'There is also by default a boxplot of all the spray types insect counts.'))),
        fluidRow(
            column(3, selectInput("select", label = h4("Select Spray"), 
                        choices = list('Spray A' = 'A',
                                       'Spray B' = 'B',
                                       'Spray C' = 'C',
                                       'Spray D' = 'D',
                                       'Spray E' = 'E',
                                       'Spray F' = 'F'), 
                        selected = 'A')
                   ),
            column(3, radioButtons('func', label = h4('Select function'),  c('Mean' = 'Mean',
                                                               'Sum' = 'Sum',
                                                               'Standard Deviation' = 'Standard Deviation' )),
                   submitButton('Submit')),
                   
            
            column(6, h4('Output'),
                    h5('Selected Spray'),
                    verbatimTextOutput('oSelectSpray'),
                    h5('Selected Function'),
                    verbatimTextOutput('oFunction'),
                    h5('Result'),
                    verbatimTextOutput('result'))),
        fluidRow(
            
            column(6, h4('histogram of the selected spray'),
            plotOutput('hist')),
            column(6, h4('Boxplot of all the Sprays'),
            plotOutput('boxplot'))
        )
        )
    )
