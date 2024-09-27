Page_A_CatchParameterErrors = function(input){
  print("Start Page_A_CatchParameterErrors()")
  
  messageErreur.A = ""
  
  if(input$n.A > input$N.A){
    messageErreur.A <- 
      paste(messageErreur.A,"<b>Error</b> : The number of cards to draw n is 
            greater than the number of cards in the deck N.", sep = "<br>")
  }
  if (input$K1.A + input$K2.A + input$K3.A  + input$K4.A  > input$N.A) {
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The total number of cards of each category is 
            greater than the number of cards in the deck N.", sep = "<br>")
  }
  if(input$k1Min.A + input$k2Min.A + input$k3Min.A + input$k4Min.A > input$n.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The total number of cards to draw is 
            greater than the total number of cards to draw n.", sep = "<br>")
  }
  if(input$k1Min.A > input$k1Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The minimum number of X1 cards to draw 
            (k1Min) is greater than the maximum number of X1 cards to draw 
            (k1Max).", sep = "<br>")
  }
  if(input$k2Min.A > input$k2Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The minimum number of X2 cards to draw 
            (k2Min) is greater than the maximum number of X2 cards to draw 
            (k2Max).", sep = "<br>")
  }
  if(input$k3Min.A > input$k3Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The minimum number of X3 cards to draw 
            (k3Min) is greater than the maximum number of X3 cards to draw 
            (k3Max).", sep = "<br>")
  }
  if(input$k4Min.A > input$k4Max.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The minimum number of X4 cards to draw 
            (k4Min) is greater than the maximum number of X4 cards to draw 
            (k4Max).", sep = "<br>")
  }
  if(input$k1Max.A > input$K1.A){
    messageErreur.A <- 
      paste(messageErreur.A,
            "<b>Error</b> : The maximum number of X1 cards to draw 
            (k1Max) is greater than the number of X1 cards in the deck (K1).", 
            sep = "<br>")
  }
  if(input$k2Max.A > input$K2.A){
    messageErreur.A <- 
      paste(messageErreur.A,
            "<b>Error</b> : The maximum number of X2 cards to draw 
            (k2Max) is greater than the number of X2 cards in the deck (K2).", 
            sep = "<br>")
  }
  if(input$k3Max.A > input$K3.A){
    messageErreur.A <- 
      paste(messageErreur.A,
            "<b>Error</b> : The maximum number of X3 cards to draw 
            (k3Max) is greater than the number of X3 cards in the deck (K3).", 
            sep = "<br>")
  }
  if(input$k4Max.A > input$K4.A){
    messageErreur.A <- 
      paste(messageErreur.A,"
      <b>Error</b> : The maximum number of X4 cards to draw 
            (k4Max) is greater than the number of X4 cards in the deck (K4).", 
            sep = "<br>")
  }
  print("End Page_A_CatchParameterErrors()")
  return(messageErreur.A)
}

Page_A_Output = function(input){
  
  print("Start Page_A_Output()")
  # Calculation of the total probability
  prob = multivariateHypergeometricComputation4params(
    input$N.A, 
    input$n.A, 
    c(input$K1.A, input$K2.A, input$K3.A, input$K4.A),
    c(input$k1Min.A, input$k2Min.A, input$k3Min.A, input$k4Min.A),
    c(input$k1Max.A, input$k2Max.A, input$k3Max.A, input$k4Max.A))
  
  texteLabel = paste0("We draw ",input$n.A," cards from a deck of ",
                      input$N.A," cards.<br>",
                      "<br>We are looking for the probability of having the 
                      following cards in hand :<br>")
  
  if(input$K1.A > 0){
    if(input$k1Min.A == input$k1Max.A){
      texteLabel = paste(texteLabel, "- Exactly<b>",input$k1Min.A,
                         input$labelX1.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Between<b>",input$k1Min.A,"and",
                         input$k1Max.A,input$labelX1.A,"</b>included<br>")
    }
  }
  if(input$K2.A > 0){
    if(input$k2Min.A == input$k2Max.A){
      texteLabel = paste(texteLabel, "- Exactly<b>",input$k2Min.A,
                         input$labelX2.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Between<b>",input$k2Min.A,"and",
                         input$k2Max.A,input$labelX2.A,"</b>included<br>")
    }
  }
  if(input$K3.A > 0){
    if(input$k3Min.A == input$k3Max.A){
      texteLabel = paste(texteLabel, "- Exactly<b>",input$k3Min.A,
                         input$labelX3.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Between<b>",input$k3Min.A,"and",
                         input$k3Max.A,input$labelX3.A,"</b>inclusive<br>")
    }
  }
  if(input$K4.A > 0){
    if(input$k4Min.A == input$k4Max.A){
      texteLabel = paste(texteLabel, "- Exactly<b>",input$k4Min.A,
                         input$labelX4.A,"</b><br>")
    }else{
      texteLabel = paste(texteLabel, "- Between<b>",input$k4Min.A,"and",
                         input$k4Max.A,input$labelX4.A,"</b>inclusive<br>")
    }
  }
  
  # Calculation of the conditional probability of each mulligan depending on 
  # the previous one - 4 draws with replacement
  nbMulligans = 4
  probs = c(prob)
  for(mull in 2:nbMulligans){
    probs = c(probs, probs[length(probs)] + 
                probs[length(probs)] * (1 - probs[length(probs)]))
  }
  
  # Display of mulligan results
  texteLabel = paste0(texteLabel,"<br>The probability during the 1st mulligan 
                      of having the wanted cards in hand is : <b>",
                      round(100 * probs[1], digits = 2),"%</b>.<br>")
  for (mull in 2:nbMulligans){
    newRow = paste0("The probability during the ", mull, "th mulligan of having 
                    the wanted cards in hand is : <b>",
                    round(100 * probs[mull], digits = 2),"%</b>.<br>")
    texteLabel = paste(texteLabel, newRow)
  }
  
  print("End Page_A_Output()")
  return(texteLabel)
}
