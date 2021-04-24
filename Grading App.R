#
# Author: Most Sarmin Sultana

library(shiny)

# Define UI for application that draws a histogram
ui <- pageWithSidebar(
    # Application title
    headerPanel("Grade Point Average (GPA) Calculator"),

    # Sidebar with a slider input for number of bins 
    sidebarPanel(
        numericInput('Marks', 'Obtained Marks', min = 1, max = 100, value = 70),
       
        submitButton('Submit')
    ),

    mainPanel(
        h3('Results of GPA Calculation'),
        h4('Your Obtained Marks'),
        verbatimTextOutput("inputValueMarks"),
        
        verbatimTextOutput("grade"),
        verbatimTextOutput("point")
    )
)

server <- function(input, output) {
    
    output$grade <- renderPrint(ProcessOptions({input$Marks}))

    
    ProcessOptions <- function(x){
         
        if (x>=0 && x<34) return('Your Grade is F and Point is  0') 
        else if (x>=35 && x<39) return('Your Grade is D and  Point is 1')
        else if (x>=40 && x<44) return('Your Grade is D+ and Point is 1.3')
        else if (x>=45 && x<49) return('Your Grade is C- and Point is 1.7')
        else if (x>=50 && x<54) return('Your Grade is C and Point is 2')
        else if (x>=55 && x<59) return('Your Grade is C+ and Point is 2.3')
        else if (x>=60 && x<64) return('Your Grade is B- and Point is 2.7')
        else if (x>=65 && x<69) return('Your Grade is B and Point is 3')
        else if (x>=70 && x<74) return('Your Grade is B+ and Point is 3.3')
        else if (x>=75 && x<79) return('Your Grade is A- and Point is 3.7')
        else if (x>=80 && x<89) return('Your Grade is A and Point is 4')
        else if (x>=90 && x<=100) return('Your Grade is A+ and Point is 4')
        
        }
    }


# Run the application 
shinyApp(ui = ui, server = server)
