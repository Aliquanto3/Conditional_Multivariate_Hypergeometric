### CODE FONCTIONNEL ###

library(shiny)
library(shinyBS)
library(shinythemes)

scriptDir = "Scripts"
UIDir = "UI"
ServerDir = "Server"

UIFilesToSource = c("Page_A_UI.R",
                    "Page_B_UI.R")
for (i in 1:length(UIFilesToSource)){
  source(paste(scriptDir,UIDir,UIFilesToSource[i],sep="/"))
}

# Définition de l'interface utilisateur
ui <- navbarPage("Mulligan Hypergéométrique Multivarié",
                 theme = shinytheme("cerulean"),
                 tabPanel("Probas de votre deck", 
                          Page_A_SidebarPanel, 
                          Page_A_MainPanel),
                 tabPanel("Evolution de 2 variables", 
                          Page_B_SidebarPanel, 
                          Page_B_MainPanel)
)

ServerFilesToSource = c("multivariateHypergeometricComputation.R", 
                        "Page_A_Server.R", 
                        "Page_B_Server.R")
for (i in 1:length(ServerFilesToSource)){
  source(paste(scriptDir,ServerDir,ServerFilesToSource[i],sep="/"))
}

# Définition du serveur
server <- function(input, output) {
  observeEvent(input$calc.A, {
    result.A = Page_A_CatchParameterErrors(input)
    if (result.A == ""){
      result.A = Page_A_OutputLabels(input)
    }
    output$labelResultat.A <- renderText(result.A)
  })
  observeEvent(input$calc.B, {
    result.B = Page_B_CatchParameterErrors(input)
    if (length(result.B) == 0){
      result.B = Page_B_OutputLabels(input)
    }else{
      result.B = data.frame(result.B)
      names(result.B) = "Erreur(s) :"
    }
    output$labelResultat.B = 
      renderTable(result.B, rownames = T, colnames = T)
  })
}

# Exécution de l'application
shinyApp(ui = ui, server = server)
