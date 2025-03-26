library(shiny)
library(ggplot2)
library(DT)

# Inicializácia reaktívneho dátového rámca s 7 náhodnými záznamami
init_data <- function() {
  data.frame(
    ID = 1:7,
    Vysledek = sample(c("aneuploidie", "mozaika", "euploidní"), 7, replace = TRUE),
    Popis = paste("Popis", 1:7),
    stringsAsFactors = FALSE
  )
}

ui <- fluidPage(
  titlePanel("R Shiny Test App"),
  sidebarLayout(
    sidebarPanel(
      selectInput("vysledek", "Výsledek:", choices = c("aneuploidie", "mozaika", "euploidní")),
      textInput("popis", "Popis:"),
      actionButton("add", "Přidat záznam"),
      actionButton("delete", "Smazat vybraný záznam"),
      br(), br(),
      downloadButton("download", "Exportovat do CSV"),
      helpText("Vyberte řádek v tabulce a klikněte na 'Smazat vybraný záznam' pro odstranění.")
    ),
    mainPanel(
      DTOutput("table"),
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  # Reaktívny dátový rámec s predvyplnenými hodnotami
  values <- reactiveValues(data = init_data())
  
  observeEvent(input$add, {
    # Generovanie ID
    new_id <- ifelse(nrow(values$data) == 0, 1, max(values$data$ID, na.rm = TRUE) + 1)
    new_row <- data.frame(ID = new_id, Vysledek = input$vysledek, Popis = input$popis, stringsAsFactors = FALSE)
    values$data <- rbind(values$data, new_row)
  })
  
  output$table <- renderDT({
    datatable(values$data, selection = "single", options = list(pageLength = 5))
  })
  
  observeEvent(input$delete, {
    selected_row <- input$table_rows_selected
    if (!is.null(selected_row) && length(selected_row) > 0) {
      values$data <- values$data[-selected_row, , drop = FALSE]
    }
  })
  
  output$plot <- renderPlot({
    ggplot(values$data, aes(x = Vysledek)) +
      geom_bar(fill = "steelblue") +
      labs(title = "Počet záznamů dle výsledku", x = "Výsledek", y = "Počet") +
      theme_minimal()
  })
  
  output$download <- downloadHandler(
    filename = function() { "data_export.csv" },
    content = function(file) {
      write.csv(values$data, file, row.names = FALSE)
    }
  )
}

shinyApp(ui, server)
