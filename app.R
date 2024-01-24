### CODE FONCTIONNEL ###

library(shiny)
library(shinyBS)

# Définition de l'interface utilisateur
ui <- fluidPage(
  titlePanel("Calcul Hypergéométrique Multivarié avec probabilité conditionnelle après Mulligan"),
  sidebarLayout(
    sidebarPanel(
      numericInput("N", "Nombre total de cartes dans le deck N", 99),
      bsPopover(id = "N", title = "N", 
                content = "N doit être la valeur la plus élevée",
                placement = "top", trigger = "hover"),
      numericInput("n", "Nombre de cartes piochées n", 7),
      bsPopover(id = "n", title = "n", 
                content = "n doit être inférieur ou égal à N",
                placement = "top", trigger = "hover"),
      
      fluidRow(
        column(3, 
               textInput("labelX1", "Catégorie de carte X1", "X1"),
               bsPopover(id = "labelX1", title = "Label de X1", 
                         content = "Pour visualisation du nom de la catégorie X1",
                         placement = "top", trigger = "hover"),
               textInput("labelX2", "Catégorie de carte X2", "X2"),
               bsPopover(id = "labelX2", title = "Label de X2", 
                         content = "Pour visualisation du nom de la catégorie X2",
                         placement = "top", trigger = "hover"),
               textInput("labelX3", "Catégorie de carte X3", "X3"),
               bsPopover(id = "labelX3", title = "Label de X3", 
                         content = "Pour visualisation du nom de la catégorie X3",
                         placement = "top", trigger = "hover"),
               textInput("labelX4", "Catégorie de carte X4", "X4"),),
        bsPopover(id = "labelX4", title = "Label de X4", 
                  content = "Pour visualisation du nom de la catégorie X4",
                  placement = "top", trigger = "hover"),
        column(3, 
               numericInput("K1", "Nb de X1 dans le deck", 20),
               bsPopover(id = "K1", title = "K1", 
                         content = "K1, le nombre de cartes X1, doit être inférieur ou égal à N.
                         Fixer K1 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K1 doit être supérieur ou égal à k1Min et k1Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                         placement = "top", trigger = "hover"),
               numericInput("K2", "Nb de X2 dans le deck", 40),
               bsPopover(id = "K2", title = "K2", 
                         content = "K2, le nombre de cartes X2, doit être inférieur ou égal à N.
                         Fixer K2 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K2 doit être supérieur ou égal à k2Min et k2Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                         placement = "top", trigger = "hover"),
               numericInput("K3", "Nb de X3 dans le deck", 0),
               bsPopover(id = "K3", title = "K3", 
                         content = "K3, le nombre de cartes X3, doit être inférieur ou égal à N.
                         Fixer K3 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K3 doit être supérieur ou égal à k3Min et k3Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                         placement = "top", trigger = "hover"),
               numericInput("K4", "Nb de X4 dans le deck", 0),
               bsPopover(id = "K4", title = "K4", 
                         content = "K4, le nombre de cartes X4, doit être inférieur ou égal à N.
                         Fixer K4 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K4 doit être supérieur ou égal à k4Min et k4Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                         placement = "top", trigger = "hover")),
        column(3, 
               numericInput("k1Min", "Nb min. pioché de X1", 1),
               bsPopover(id = "k1Min", title = "k1Min", 
                         content = "k1Min, le nombre minimum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Min doit être inférieur ou égal à K1 et k1Max.",
                         placement = "top", trigger = "hover"),
               numericInput("k2Min", "Nb min. pioché de X2", 2),
               bsPopover(id = "k2Min", title = "k2Min", 
                         content = "k2Min, le nombre minimum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Min doit être inférieur ou égal à K2 et k2Max.",
                         placement = "top", trigger = "hover"),
               numericInput("k3Min", "Nb min. pioché de X3", 0),
               bsPopover(id = "k3Min", title = "k3Min", 
                         content = "k3Min, le nombre minimum voulu de cartes X3 piochées, doit être inférieur ou égal à n.
                         Fixer k3Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k3Min doit être inférieur ou égal à K3 et k3Max.",
                         placement = "top", trigger = "hover"),
               numericInput("k4Min", "Nb min. pioché de X4", 0),
               bsPopover(id = "k4Min", title = "k4Min", 
                         content = "k4Min, le nombre minimum voulu de cartes X4 piochées, doit être inférieur ou égal à n.
                         Fixer k4Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k4Min doit être inférieur ou égal à K4 et k4Max.",
                         placement = "top", trigger = "hover")),
        column(3, 
               numericInput("k1Max", "Nb max. pioché de X1", 7),
               bsPopover(id = "k1Max", title = "k1Max", 
                         content = "k1Max, le nombre maximum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Max doit être supérieur ou égal à k1Min et inférieur ou égal à K1",
                         placement = "top", trigger = "hover"),
               numericInput("k2Max", "Nb max. pioché de X2", 7),
               bsPopover(id = "k2Max", title = "k2Max", 
                         content = "k2Max, le nombre maximum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Max doit être supérieur ou égal à k2Min et inférieur ou égal à K2",
                         placement = "top", trigger = "hover"),
               numericInput("k3Max", "Nb max. pioché de X3", 0),
               bsPopover(id = "k3Max", title = "k3Max", 
                         content = "k3Max, le nombre maximum voulu de cartes X3 piochées, doit être inférieur ou égal à n.
                         Fixer k3Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k3Max doit être supérieur ou égal à k3Min et inférieur ou égal à K3",
                         placement = "top", trigger = "hover"),
               numericInput("k4Max", "Nb max. pioché de X4", 0),
               bsPopover(id = "k4Max", title = "k4Max", 
                         content = "k4Max, le nombre maximum voulu de cartes X4 piochées, doit être inférieur ou égal à n.
                         Fixer k4Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k4Max doit être supérieur ou égal à k4Min et inférieur ou égal à K4",
                         placement = "top", trigger = "hover"))
      ),
      actionButton("calc", "Calculer"),
      width = 6),
    mainPanel(
      htmlOutput("labelResultat"),
      tags$head(tags$style(HTML("
                            #labelResultat {
                              font-size: 16px;
                            }
                            "))), 
      width = 6
    )
  )
)

# Définition du serveur
server <- function(input, output) {
  observeEvent(input$calc, {
    if(input$n > input$N){
      output$result <- renderText("Erreur : Le nombre de cartes à piocher n est supérieur au nombre de cartes du deck N.")
    }else if (input$K1 + input$K2 + input$K3  + input$K4  > input$N) {
      output$result <- renderText("Erreur : Le total de cartes de chaque catégorie est supérieur au total de cartes du deck.")
    }else if(input$k1Min + input$k2Min + input$k3Min + input$k4Min > input$n){
      output$result <- renderText("Erreur : Le nombre total de cartes à piocher est supérieur au nombre total de cartes à piocher n.")
    }else if(input$k1Min > input$K1){
      output$result <- renderText("Erreur : Le nombre minimum de cartes X1 à piocher (k1Min) est supérieur au nombre de cartes X1 à piocher (K1).")
    }else if(input$k2Min > input$K2){
      output$result <- renderText("Erreur : Le nombre minimum de cartes X2 à piocher (k2Min) est supérieur au nombre de cartes X2 à piocher (K2).")
    }else if(input$k3Min > input$K3){
      output$result <- renderText("Erreur : Le nombre minimum de cartes X3 à piocher (k3Min) est supérieur au nombre de cartes X3 à piocher (K3).")
    }else if(input$k4Min > input$K4){
      output$result <- renderText("Erreur : Le nombre minimum de cartes X4 à piocher (k4Min) est supérieur au nombre de cartes X4 à piocher (K4).")
    }else if(input$k1Max > input$K1){
      output$result <- renderText("Erreur : Le nombre maximum de cartes X1 à piocher (k1Max) est supérieur au nombre de cartes X1 à piocher (K1).")
    }else if(input$k2Max > input$K2){
      output$result <- renderText("Erreur : Le nombre maximum de cartes X2 à piocher (k2Max) est supérieur au nombre de cartes X2 à piocher (K2).")
    }else if(input$k3Max > input$K3){
      output$result <- renderText("Erreur : Le nombre maximum de cartes X3 à piocher (k3Max) est supérieur au nombre de cartes X3 à piocher (K3).")
    }else if(input$k4Max > input$K4){
      output$result <- renderText("Erreur : Le nombre maximum de cartes X4 à piocher (k4Max) est supérieur au nombre de cartes X4 à piocher (K4).")
    }
    
    else {
      # Initialisation de la probabilité totale
      prob <- 0
      
      # Boucle pour sommer les probabilités
      for (x1 in input$k1Min:input$k1Max) {
        for (x2 in input$k2Min:input$k2Max) {
          for (x3 in input$k3Min:input$k3Max) {
            for (x4 in input$k4Min:input$k4Max) {
              if (x1 + x2 + x3 + x4 <= input$n) {
                prob <- prob +
                  (
                    choose(input$K1, x1) *
                      choose(input$K2, x2) *
                      choose(input$K3, x3) *
                      choose(input$K4, x4) *
                      choose(input$N - input$K1 - input$K2 - input$K3 - input$K4, 
                             input$n - x1 -x2 - x3 - x4)
                  ) /
                  choose(input$N, input$n)
              }
            }
          }
        }
      }
      
      texteLabel = paste0("Nous piochons ",input$n," cartes d'un deck de ",input$N," cartes.<br>",
                         "<br>Nous cherchons la probabilité d'avoir les cartes suivantes en main :<br>")
      if(input$K1 > 0){
        if(input$k1Min == input$k1Max){
          texteLabel = paste(texteLabel, "- Exactement<b>",input$k1Min,input$labelX1,"</b><br>")
        }else{
          texteLabel = paste(texteLabel, "- Entre<b>",input$k1Min,"et",input$k1Max,input$labelX1,"</b>inclus<br>")
        }
      }
      if(input$K2 > 0){
        if(input$k2Min == input$k2Max){
          texteLabel = paste(texteLabel, "- Exactement<b>",input$k2Min,input$labelX2,"</b><br>")
        }else{
          texteLabel = paste(texteLabel, "- Entre<b>",input$k2Min,"et",input$k2Max,input$labelX2,"</b>inclus<br>")
        }
      }
      if(input$K3 > 0){
        if(input$k3Min == input$k3Max){
          texteLabel = paste(texteLabel, "- Exactement<b>",input$k3Min,input$labelX3,"</b><br>")
        }else{
          texteLabel = paste(texteLabel, "- Entre<b>",input$k3Min,"et",input$k3Max,input$labelX3,"</b>inclus<br>")
        }
      }
      if(input$K4 > 0){
        if(input$k4Min == input$k4Max){
          texteLabel = paste(texteLabel, "- Exactement<b>",input$k4Min,input$labelX4,"</b><br>")
        }else{
          texteLabel = paste(texteLabel, "- Entre<b>",input$k4Min,"et",input$k4Max,input$labelX4,"</b>inclus<br>")
        }
      }
      
      # Calcul de la probabilité conditionnelle de chaque mulligan dépendant du précédent,
      # 4 pioches avec remise
      nbMulligans = 4
      probs = c(prob)
      for(mull in 2:nbMulligans){
        probs = c(probs, probs[length(probs)] + 
                    probs[length(probs)] * (1 - probs[length(probs)]))
      }
      
      # Affichage des résultats du mulligan
      texteLabel = paste0(texteLabel,"<br>La probabilité lors du 1er mulligan d'avoir les cartes voulues en main est : <b>",
                           round(100 * probs[1], digits = 2),"%</b>.<br>")
      for (mull in 2:nbMulligans){
        newRow = paste0("La probabilité lors du ", mull, "e mulligan d'avoir les cartes voulues en main est : <b>",
                        round(100 * probs[mull], digits = 2),"%</b>.<br>")
        texteLabel = paste(texteLabel, newRow)
      }
      
      output$labelResultat <- renderText(texteLabel)
    }
  })
}

# Exécution de l'application
shinyApp(ui = ui, server = server)
