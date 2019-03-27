require(shiny)
library(DT)

ui <- shinyUI(
  DT::dataTableOutput('mytable')
)

dat <- data.frame(
  country = c('Portugal', 'China'),
  flag = c('<img src="https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg" height="52"></img>',
           '<img src="https://upload.wikimedia.org/wikipedia/commons/2/2e/Flag_of_China.png" height="52"></img>'
  )
)

server <- shinyServer(function(input, output){
  output$mytable <- DT::renderDataTable({
    DT::datatable(dat, escape = FALSE)
  })
})

shinyApp(ui, server)

