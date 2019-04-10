library(shiny)
library(dplyr)

server <- shinyServer(function(input, output) {
  # Get the starwars data set ready for display
  tbl_dat <- dplyr::starwars
  # The last several columns are list columns which
  # don't currently work with filtering; so
  # they are excluded
  tbl_dat <- tbl_dat %>% select(name:species)
  
  output$starwars_tbl <- DT::renderDataTable({
    DT::datatable(tbl_dat, filter = "top")
  })
})

ui <- shinyUI(basicPage(
  h2("Starwars Data"),
  hr(),
  DT::dataTableOutput('starwars_tbl')
))

shinyApp(ui, server)

