Page_C_CatchParameterErrors = function(input){
  print("Start Page_C_CatchParameterErrors()")
  messageErreur.C = ""
  
  if(input$n.C > input$N.C){
    messageErreur.C <- 
      paste(messageErreur.C,"<b>Error</b> : The number of cards to draw n is 
            greater than the number of cards in the deck N.", sep = "<br>")
  }
  if (input$K1Min.C  > input$N.C) {
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The minimum total of cards in the category is 
            greater than the number of cards in the deck N.", sep = "<br>")
  }
  if (input$K1Max.C  > input$N.C) {
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The maximum total of cards in the category is 
            greater than the number of cards in the deck N.", sep = "<br>")
  }
  if(input$k1Min.C > input$n.C){
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The total number of cards to draw is 
            greater than the total number of cards to draw n.", sep = "<br>")
  }
  if(input$k1Min.C > input$k1Max.C){
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The minimum number of X1 cards to draw 
            (k1Min) is greater than the maximum number of X1 cards to draw 
            (k1Max).", sep = "<br>")
  }
  if(input$k1Max.C > input$K1Min.C){
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The maximum number of X1 cards to draw (k1Max) 
      is greater than the minimum number of X1 cards in the deck (K1Min).", 
            sep = "<br>")
  }
  if(input$K1Min.C > input$K1Max.C){
    messageErreur.C <- 
      paste(messageErreur.C,
            "<b>Error</b> : The minimum number of X1 cards in the deck (K1Min) 
      is greater than the maximum number of X1 cards in the deck (K1Max).", 
            sep = "<br>")
  }
  print("Start Page_C_CatchParameterErrors()")
  return(messageErreur.C)
}

Page_C_Output = function(input){
  
  print("Start Page_C_Output()")
  # input = list(labelX1.C = "Terrains", N.C = 60, n.C = 7, K1Min.C = 15, K1Max.C = 30, k1Min.C = 3, k1Max.C = 5)
  
  # Data on the x-axis
  inputCategoryInDeck = input$K1Min.C:input$K1Max.C
  
  # Data on the y-axis, converted to percentages
  probs = multivariateHypergeometricComputation1param(
    input$N.C, input$n.C, inputCategoryInDeck, input$k1Min.C, input$k1Max.C)
  
  # Create a data frame with the data
  probData = data.frame(inputCategoryInDeck, probs)
  probData$probs = unlist(probData$probs)
  probPlots = list(Page_C_Plot(input, probData, 1))
  
  for (mull in 2:nbMulligansC){
    
    # Add the probability after mulligan
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
  
  # Create the scatterplot
  probPlot = ggplot(probData, aes(x = inputCategoryInDeck, y = probs)) +
    geom_point() + # Add points
    geom_line() + # Add a line
    # Ensure that the x-axis values are integers
    scale_x_continuous(breaks = input$K1Min.C:input$K1Max.C) + 
    labs(title = paste("Probability of having between",input$k1Min.C,"and",
                       input$k1Max.C,input$labelX1.C,"\nwhen drawing",
                       input$n.C,"cards from a deck of",input$N.C,
                       "cards\ndepending on the number in the deck of",input$labelX1.C,
                       "\nafter",mull,mulliganLabel),
         x = paste("Number in the deck of",input$labelX1.C),
         y = "Probability (%)") + # Add labels
    theme_minimal() + # Use a minimalist theme
    theme(plot.title = element_text(hjust = 0.5), # Center the title
          plot.margin = margin(t = 100, r = 10, b = 10, l = 10)) # Adjust the margins
  
  # Convert the ggplot2 graph into an interactive plotly graph
  probPlot = ggplotly(probPlot, tooltip = c("x", "y"))
  
  # Customize the hover labels
  probPlot = probPlot %>% 
    layout(hoverlabel = list(bgcolor = "white", 
                             font = list(family = "Arial", 
                                         size = 12, 
                                         color = "black")))
  
  # Modify the hovertemplate to change the variable names 
  # and format x as an integer
  probPlot = probPlot %>% 
    style(hoverinfo = 'text', 
          hovertemplate = 'Terrains: %{x}<br>Probability: %{y:.2f}%')
  
  return(probPlot)
}
