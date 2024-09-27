Page_B_CatchParameterErrors = function(input){
  print("Start Page_B_CatchParameterErrors()")
  messageErreur.B = c()
  if(input$n.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "The number of cards to draw n is greater than the number of cards in the deck N.")
  }
  if(input$k1Min.B + input$k2Min.B > input$n.B){
    messageErreur.B <- 
      c(messageErreur.B, "The minimum number of cards to draw (K1Min + K2Min) is greater than the total number of cards to draw n.")
  }
  if(input$K1Max.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "The total number of X1 cards in the deck (K1Max) is greater than the number of cards in the deck N.")
  }
  if(input$K2Max.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "The total number of X2 cards in the deck (K2Max) is greater than the number of cards in the deck N.")
  }
  if(input$k1Min.B > input$k1Max.B){
    messageErreur.B <- 
      c(messageErreur.B, "The minimum number of X1 cards to draw (k1Min) is greater than the maximum number of X1 cards to draw (k1Max).")
  }
  if(input$k2Min.B > input$k2Max.B){
    messageErreur.B <- 
      c(messageErreur.B, "The minimum number of X2 cards to draw (k2Min) is greater than the maximum number of X2 cards to draw (k2Max).")
  }
  if(input$k1Max.B > input$K1Min.B){
    messageErreur.B <- 
      c(messageErreur.B, "The maximum number of X1 cards to draw (k1Max) is greater than the number of X1 cards in the deck (K1Min).")
  }
  if(input$k2Max.B > input$K2Min.B){
    messageErreur.B <- 
      c(messageErreur.B, "The maximum number of X2 cards to draw (k2Max) is greater than the minimum number of X2 cards in the deck (K2Min).")
  }
  print("End Page_B_CatchParameterErrors()")
  return(messageErreur.B)
}

Page_B_Output = function(input){
  print("Start Page_B_Output()")
  
  # input =
  #   list(N.B = 60, n.B = 7, k1Min.B = 1, k1Max.B = 7, k2Min.B = 3,
  #        k2Max.B = 5, K1Min.B = 18, K1Max.B = 22, K2Min.B = 20, K2Max.B = 26)
  
  # Get the list of K1s and K2s to iterate over
  K1s = input$K1Min.B:input$K1Max.B
  K2s = input$K2Min.B:input$K2Max.B
  
  # Create the table to be filled with the results
  results.B = as.data.frame(matrix(rep(NA, length(K1s) * length(K2s)),
                                   nrow = length(K1s)))
  row.names(results.B) = K1s
  names(results.B) = K2s
  
  # Fill the table with the multivariate hypergeometric results for 2 variables
  for(i in 1:length(K1s)){
    for(j in 1:length(K2s)){
      results.B[i,j] = 
        multivariateHypergeometricComputation2params(
          input$N.B, 
          input$n.B, 
          c(K1s[i], K2s[j]),
          c(input$k1Min.B, input$k2Min.B),
          c(input$k1Max.B, input$k2Max.B))
    }
  }
  
  # Add conditional probability based on number of mulligans
  mulliganResults.B = list(results.B)
  probsAfterMull = results.B
  for (mull in 2:4){
    probsAfterMull[] = lapply(mulliganResults.B[[mull-1]], function(x) {
      x + (1 - x) * x
    })
    mulliganResults.B = append(mulliganResults.B, list(probsAfterMull))
  }
  
  # Update the export format
  for (mull in 1:4){
    mulliganResults.B[[mull]][] = lapply(mulliganResults.B[[mull]], function(x){
      paste0(round(x * 100, digits = 2),"%")
    } )
  }
  
  # Display of mulligan results
  mulliganLabels.B = 
    list(paste0("Probability table up to the 1st mulligan:<br>"))
  for (mull in 2:nbMulligansB){
    mulliganLabels.B = append(mulliganLabels.B, 
                              paste0("<br>Probability table up to the ",
                                     mull,"th mulligan:<br>"))
  }
  
  print("End Page_B_Output()")
  return(list(LabelB = mulliganLabels.B, TableB = mulliganResults.B))
}
