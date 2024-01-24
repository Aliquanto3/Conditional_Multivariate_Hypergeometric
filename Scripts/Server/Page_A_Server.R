Page_A_CatchParameterErrors = function(input){
  
  messageErreur.A = ""
  
  if(input$n.A > input$N.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre de cartes à piocher n est 
            supérieur au nombre de cartes du deck N.", sep = "<br>")
  }
  if (input$K1.A + input$K2.A + input$K3.A  + input$K4.A  > input$N.A) {
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le total de cartes de chaque catégorie est 
            supérieur au nombre de cartes du deck N.", sep = "<br>")
  }
  if(input$k1Min.A + input$k2Min.A + input$k3Min.A + input$k4Min.A > input$n.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre total de cartes à piocher est 
            supérieur au nombre total de cartes à piocher n.", sep = "<br>")
  }
  if(input$k1Min.A > input$k1Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre minimum de cartes X1 à piocher 
            (k1Min) est supérieur au nombre maximum de cartes X1 à piocher 
            (k1Max).", sep = "<br>")
  }
  if(input$k2Min.A > input$k2Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre minimum de cartes X2 à piocher 
            (k2Min) est supérieur au nombre maximum de cartes X2 à piocher 
            (k2Max).", sep = "<br>")
  }
  if(input$k3Min.A > input$k3Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre minimum de cartes X3 à piocher 
            (k3Min) est supérieur au nombre maximum de cartes X3 à piocher 
            (k3Max).", sep = "<br>")
  }
  if(input$k4Min.A > input$k4Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre minimum de cartes X4 à piocher 
            (k4Min) est supérieur au nombre maximum de cartes X4 à piocher 
            (k4Max).", sep = "<br>")
  }
  if(input$k1Max.A > input$K1.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre maximum de cartes X1 à piocher 
            (k1Max) est supérieur au nombre de cartes X1 à piocher (K1).", 
            sep = "<br>")
  }
  if(input$k2Max.A > input$K2.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre maximum de cartes X2 à piocher 
            (k2Max) est supérieur au nombre de cartes X2 à piocher (K2).", 
            sep = "<br>")
  }
  if(input$k3Max.A > input$K3.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre maximum de cartes X3 à piocher 
            (k3Max) est supérieur au nombre de cartes X3 à piocher (K3).", 
            sep = "<br>")
  }
  if(input$k4Max.A > input$K4.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Erreur</b> : Le nombre maximum de cartes X4 à piocher 
            (k4Max) est supérieur au nombre de cartes X4 à piocher (K4).", 
            sep = "<br>")
  }
  return(messageErreur.A)
}

Page_A_OutputLabels = function(input){
  
  # Calcul de la probabilité totale
  prob = multivariateHypergeometricComputation4params(
    input$N.A, 
    input$n.A, 
    c(input$K1.A, input$K2.A, input$K3.A, input$K4.A),
    c(input$k1Min.A, input$k2Min.A, input$k3Min.A, input$k4Min.A),
    c(input$k1Max.A, input$k2Max.A, input$k3Max.A, input$k4Max.A))

  texteLabel = paste0("Nous piochons ",input$n.A," cartes d'un deck de ",
                      input$N.A," cartes.<br>",
                      "<br>Nous cherchons la probabilité d'avoir les cartes 
                      suivantes en main :<br>")
  
  if(input$K1.A > 0){
    if(input$k1Min.A == input$k1Max.A){
      texteLabel = paste(texteLabel, "- Exactement<b>",input$k1Min.A,
                         input$labelX1.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Entre<b>",input$k1Min.A,"et",
                         input$k1Max.A,input$labelX1.A,"</b>inclus<br>")
    }
  }
  if(input$K2.A > 0){
    if(input$k2Min.A == input$k2Max.A){
      texteLabel = paste(texteLabel, "- Exactement<b>",input$k2Min.A,
                         input$labelX2.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Entre<b>",input$k2Min.A,"et",
                         input$k2Max.A,input$labelX2.A,"</b>inclus<br>")
    }
  }
  if(input$K3.A > 0){
    if(input$k3Min.A == input$k3Max.A){
      texteLabel = paste(texteLabel, "- Exactement<b>",input$k3Min.A,
                         input$labelX3.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Entre<b>",input$k3Min.A,"et",
                         input$k3Max.A,input$labelX3.A,"</b>inclus<br>")
    }
  }
  if(input$K4.A > 0){
    if(input$k4Min.A == input$k4Max.A){
      texteLabel = paste(texteLabel, "- Exactement<b>",input$k4Min.A,
                         input$labelX4.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Entre<b>",input$k4Min.A,"et",
                         input$k4Max.A,input$labelX4.A,"</b>inclus<br>")
    }
  }
  
  # Calcul de la probabilité conditionnelle de chaque mulligan dépendant du 
  # précéden - 4 pioches avec remise
  nbMulligans = 4
  probs = c(prob)
  for(mull in 2:nbMulligans){
    probs = c(probs, probs[length(probs)] + 
                probs[length(probs)] * (1 - probs[length(probs)]))
  }
  
  # Affichage des résultats du mulligan
  texteLabel = paste0(texteLabel,"<br>La probabilité lors du 1er mulligan 
                      d'avoir les cartes voulues en main est : <b>",
                      round(100 * probs[1], digits = 2),"%</b>.<br>")
  for (mull in 2:nbMulligans){
    newRow = paste0("La probabilité lors du ", mull, "e mulligan d'avoir les 
                    cartes voulues en main est : <b>",
                    round(100 * probs[mull], digits = 2),"%</b>.<br>")
    texteLabel = paste(texteLabel, newRow)
  }
  
  return(texteLabel)
}