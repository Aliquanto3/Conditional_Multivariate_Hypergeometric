Page_B_CatchParameterErrors = function(input){
  messageErreur.B = c()
  if(input$n.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre de cartes à piocher n est supérieur au nombre de cartes du deck N.")
  }
  if(input$k1Min.B + input$k2Min.B > input$n.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre minimal de cartes à piocher (K1Min + K2Min) est supérieur au nombre total de cartes à piocher n.")
  }
  if(input$M.B > input$n.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre de mulligans M est supérieur au nombre total de cartes à piocher n.")
  }
  if(input$K1Max.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre total de cartes X1 dans le deck (K1Max) est supérieur au nombre de cartes du deck N.")
  }
  if(input$K2Max.B > input$N.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre total de cartes X2 dans le deck (K2Max) est supérieur au nombre de cartes du deck N.")
  }
  if(input$k1Min.B > input$k1Max.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre minimum de cartes X1 à piocher (k1Min) est supérieur au nombre maximum de cartes X1 à piocher (k1Max).")
  }
  if(input$k2Min.B > input$k2Max.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre minimum de cartes X2 à piocher (k2Min) est supérieur au nombre maximum de cartes X2 à piocher (k2Max).")
  }
  if(input$k1Max.B > input$K1Min.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre maximum de cartes X1 à piocher (k1Max) est supérieur au nombre de cartes X1 dans le deck (K1Min).")
  }
  if(input$k2Max.B > input$K2Min.B){
    messageErreur.B <- 
      c(messageErreur.B, "Le nombre maximum de cartes X2 à piocher (k2Max) est supérieur au nombre minimal de cartes X2 dans le deck (K2Min).")
  }
  return(messageErreur.B)
}

Page_B_OutputLabels = function(input){
  
  # input =
  #   list(N.B = 99, n.B = 7, M.B = 3, k1Min.B = 1, k1Max.B = 7, k2Min.B = 3,
  #        k2Max.B = 5, K1Min.B = 18, K1Max.B = 22, K2Min.B = 35, K2Max.B = 42)
  
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
  if(input$M.B > 1){
    for (mull in 2:input$M.B){
      results.B[] <- lapply(results.B, function(x) {
        x + (1 - x) * x
      })
    }
  }
  
  # Update the export format
  results.B[] <- lapply(results.B, function(x){
    paste0(round(x * 100, digits = 2),"%")
  } )
  
  return(results.B)
}
