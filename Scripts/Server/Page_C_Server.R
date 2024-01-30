Page_C_CatchParameterErrors = function(input){
  print("Start Page_C_CatchParameterErrors()")
  messageErreur.C = ""
  
  if(input$n.C > input$N.C){
    messageErreur.C <- 
      paste(messageErreur.C,"<b>Erreur</b> : Le nombre de cartes à piocher n est 
            supérieur au nombre de cartes du deck N.", sep = "<br>")
  }
  if (input$K1Min.C  > input$N.C) {
    messageErreur.C <- 
      paste(messageErreur.C,
      "<b>Erreur</b> : Le total minimal de cartes de la catégorie est 
            supérieur au nombre de cartes du deck N.", sep = "<br>")
  }
  if (input$K1Max.C  > input$N.C) {
    messageErreur.C <- 
      paste(messageErreur.C,
      "<b>Erreur</b> : Le total maximal de cartes de la catégorie est 
            supérieur au nombre de cartes du deck N.", sep = "<br>")
  }
  if(input$k1Min.C > input$n.C){
    messageErreur.C <- 
      paste(messageErreur.C,
      "<b>Erreur</b> : Le nombre total de cartes à piocher est 
            supérieur au nombre total de cartes à piocher n.", sep = "<br>")
  }
  if(input$k1Min.C > input$k1Max.C){
    messageErreur.C <- 
      paste(messageErreur.C,
      "<b>Erreur</b> : Le nombre minimum de cartes X1 à piocher 
            (k1Min) est supérieur au nombre maximum de cartes X1 à piocher 
            (k1Max).", sep = "<br>")
  }
  if(input$k1Max.C > input$K1Min.C){
    messageErreur.C <- 
      paste(messageErreur.C,
      "<b>Erreur</b> : Le nombre maximum de cartes X1 à piocher (k1Max) 
      est supérieur au nombre minimal de cartes X1 dans le deck (K1Min).", 
            sep = "<br>")
  }
  if(input$K1Min.C > input$K1Max.C){
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Erreur</b> : Le nombre minimal de cartes X1 à dans le deck (K1Min) 
      est supérieur au nombre maximal de cartes X1 dans le deck (K1Max).", 
            sep = "<br>")
  }
  print("Start Page_C_CatchParameterErrors()")
  return(messageErreur.C)
}

Page_C_Output = function(input){
  
  print("Start Page_C_Output()")
  # input = list(labelX1.C = "Terrains", N.C = 99, n.C = 7, K1Min.C = 35, K1Max.C = 45, k1Min.C = 3, k1Max.C = 5)
  
  # Données en abscisses
  inputCategoryInDeck = input$K1Min.C:input$K1Max.C
  
  # Données en ordonnées, converties en pourcentages
  probs = multivariateHypergeometricComputation1param(
    input$N.C, input$n.C, inputCategoryInDeck, input$k1Min.C, input$k1Max.C)
  
  # Créer un data frame avec les données
  probData = data.frame(inputCategoryInDeck, probs)
  probData$probs = unlist(probData$probs)
  probPlots = list(Page_C_Plot(input, probData, 1))
  
  for (mull in 2:nbMulligansC){
    
    # Ajouter la probabilité après mulligan
    probData$probs = sapply(probData$probs, function(x) {
      x + (1 - x) * x
    })
    
    probPlots[[mull]]  = local({
      i = mull
      Page_C_Plot(input, probData, i)
    })
    
  }
  
  print("End Page_C_Output()")
  return(probPlots)
}

Page_C_Plot = function(input, probData, mull){
  
  mulliganLabel = ifelse(mull == 1, "mulligan", "mulligans")
  
  probData$probs = round(probData$probs * 100, digits = 2)

  # Créer le scatterplot
  probPlot = ggplot(probData, aes(x = inputCategoryInDeck, y = probs)) +
    geom_point() + # Ajouter des points
    geom_line() + # Ajouter une ligne
    # S'assurer que les abscisses sont des entiers
    scale_x_continuous(breaks = input$K1Min.C:input$K1Max.C) + 
    labs(title = paste("Probabilité d'avoir entre",input$k1Min.C,"et",
                       input$k1Max.C,input$labelX1.C,"\nen piochant",
                       input$n.C,"cartes dans un deck de",input$N.C,
                       "cartes\nen fonction du nombre de",input$labelX1.C,
                       "\naprès",mull,mulliganLabel),
         x = paste("Nombre de",input$labelX1.C),
         y = "Probabilité (%)") + # Ajouter des étiquettes
    theme_minimal() + # Utiliser un thème minimaliste
    theme(plot.title = element_text(hjust = 0.5), # Centrer le titre
          plot.margin = margin(t = 100, r = 10, b = 10, l = 10)) # Ajuster les marges
  
  # Convertir le graphique ggplot2 en graphique plotly interactif
  probPlot = ggplotly(probPlot, tooltip = c("x", "y"))
  
  # Personnaliser les labels de survol
  probPlot = probPlot %>% 
    layout(hoverlabel = list(bgcolor = "white", 
                             font = list(family = "Arial", 
                                         size = 12, 
                                         color = "black")))
  
  # Modifier le hovertemplate pour changer les noms des variables 
  # et formater x en entier
  probPlot = probPlot %>% 
    style(hoverinfo = 'text', 
          hovertemplate = 'Terrains: %{x}<br>Probabilité: %{y:.2f}%')
  
  return(probPlot)
}
