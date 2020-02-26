library(shiny)
library(seoR)
library(rlist)
ui <- fluidPage(
  
 
  titlePanel("upload your csv file"),
  sidebarLayout(
    sidebarPanel(
      
      fileInput("file1", "upload a csv file"),
      
      
    ),

    mainPanel(

      downloadButton("downloadData", "Download")
      
      
    )
  )
)

server <- function(input, output) {


  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data.csv")
    },
    content = function(file1) {
      df = input$file1
      df = df[order(df[c(1)]),]

      df_2 = df[1:4,]
      
      len = length(df$Page)
      
      for (i in 1:len){
        word = df$Page[i]
        if(df$Page[i+1]==df$Page[i]){next}
        token = 0
        for (j in 1:4){
          df_2 = rbind(df_2,df[i+j,])
        }
      }
      
      
      write.csv(df_2, file1, row.names = FALSE)
    }

  )
  
  
  
}

shinyApp(ui = ui, server = server)
