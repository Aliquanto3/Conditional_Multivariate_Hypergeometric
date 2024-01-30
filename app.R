# Imports
scriptDir = "Scripts"

source(paste(scriptDir,"Libraries.R",sep="/"))
source(paste(scriptDir,"Parameters.R",sep="/"))


for (i in 1:length(UIFilesToSource)){
  source(paste(scriptDir,UIDir,UIFilesToSource[i],sep="/"))
}

# Définition de l'interface utilisateur
ui <- navbarPage("Mulligan Hypergéométrique Multivarié",
                 theme = shinytheme("cerulean"),
                 tabPanel("Probas de votre deck", 
                          Page_A_SidebarPanel, 
                          Page_A_MainPanel),
                 tabPanel("Tableau pour 2 variables", 
                          Page_B_SidebarPanel, 
                          Page_B_MainPanel),
                 tabPanel("Graphique pour 1 variable", 
                          Page_C_SidebarPanel, 
                          Page_C_MainPanel)
)

for (i in 1:length(ServerFilesToSource)){
  source(paste(scriptDir,ServerDir,ServerFilesToSource[i],sep="/"))
}

# Définition du serveur
server <- function(input, output) {
  observeEvent(input$calc.A, {
    
    error.A = Page_A_CatchParameterErrors(input)
    if (error.A == ""){
      
      output$labelResultat.A = renderText(Page_A_Output(input))
    } else {
      
      output$labelResultat.A = renderText(error.A)
    }
    
  })
  observeEvent(input$calc.B, {
    error.B = Page_B_CatchParameterErrors(input)
    if (length(error.B) == 0){
      
      output_B = Page_B_Output(input)
      lapply(1:nbMulligansB, function(i) {
        
        output[[paste("labelResultat.B", i, sep = "_")]] = 
          renderText(output_B$LabelB[[i]])
        
        output[[paste("tableResultat.B", i, sep = "_")]] = 
          renderTable(output_B$TableB[[i]], rownames = T, colnames = T)
      })
      
    }else{
      error.B = data.frame(error.B)
      names(error.B) = "Erreur(s) :"
      output$tableResultat.B_1 = 
        renderTable(error.B, rownames = T, colnames = T)
    }
    
  })
  observeEvent(input$calc.C, {
    
    error.C = Page_C_CatchParameterErrors(input)
    if (error.C == ""){
      
      output_C = Page_C_Output(input)
      lapply(1:nbMulligansC, function(i) {
        
        output[[paste("plotResultat.C", i, sep = "_")]] = 
          renderPlotly(output_C[[i]])
      })
    }else {
      
      output$labelResultat.C = renderText(error.C)
    }
    
  })
}

# Exécution de l'application
shinyApp(ui = ui, server = server)
