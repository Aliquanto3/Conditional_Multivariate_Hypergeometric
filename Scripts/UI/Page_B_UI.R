Page_B_SidebarPanel = sidebarPanel(
  numericInput("N.B", "Total number of cards in the deck N", 60),
  bsPopover(id = "N.B", title = "N", 
            content = "N should be the highest value",
            placement = "top", trigger = "hover"),
  numericInput("n.B", "Number of cards drawn n", 7),
  bsPopover(id = "n.B", title = "n", 
            content = "n should be less than or equal to N",
            placement = "top", trigger = "hover"),
  
  fluidRow(
    column(6, 
           textInput("labelX1.B", "Card category X1", "X1"),
           bsPopover(id = "labelX1.B", title = "Label of X1", 
                     content = "For visualization of the category name X1",
                     placement = "top", trigger = "hover"),
           
           numericInput("K1Min.B", "Min of X1 in the deck (K1Min)", 8),
           bsPopover(id = "K1Min.B", title = "K1Min", 
                     content = "K1Min, the minimum number of X1 cards to test, should be less than or equal to N.
                         K1Min should be greater than or equal to k1Min and k1Max.
                         The sum K1Min+K2Min should be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K1Max.B", "Max of X1 in the deck (K1Max)", 16),
           bsPopover(id = "K1Max.B", title = "K1Max", 
                     content = "K1Max, the maximum number of X1 cards to test, should be less than or equal to N.
                         K1Max should be greater than or equal to k1Max and k1Max.
                         The sum K1Max+K2Max should be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k1Min.B", "Min. number of X1 drawn (k1Min)", 1),
           bsPopover(id = "k1Min.B", title = "k1Min", 
                     content = "k1Min, the minimum desired number of X1 cards drawn, should be less than or equal to n.
                         Set k1Min to 0 if you do not want to use this variable in the calculation.
                         k1Min should be less than or equal to K1 and k1Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k1Max.B", "Max. number of X1 drawn (k1Max)", 5),
           bsPopover(id = "k1Max.B", title = "k1Max", 
                     content = "k1Max, the maximum desired number of X1 cards drawn, should be less than or equal to n.
                         Set k1Max to 0 if you do not want to use this variable in the calculation.
                         k1Max should be greater than or equal to k1Min and less than or equal to K1",
                     placement = "top", trigger = "hover")
    ),
    
    column(6, 
           textInput("labelX2.B", "Card category X2", "X2"),
           bsPopover(id = "labelX2.B", title = "Label of X2", 
                     content = "For visualization of the category name X2",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2Min.B", "Min of X2 in the deck (K2Min)", 18),
           bsPopover(id = "K2Min.B", title = "K2Min", 
                     content = "K2Min, the minimum number of X2 cards to test, should be less than or equal to N.
                         K2Min should be greater than or equal to k2Min and k2Max.
                         The sum K1Min+K2Min should be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2Max.B", "Max of X2 in the deck (K2Max)", 28),
           bsPopover(id = "K2Max.B", title = "K2Max", 
                     content = "K2Max, the maximum number of X2 cards to test, should be less than or equal to N.
                         K2Max should be greater than or equal to k2Max and k2Max.
                         The sum K1Max+K2Max should be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Min.B", "Min. number of X2 drawn (k2Min)", 2),
           bsPopover(id = "k2Min.B", title = "k2Min", 
                     content = "k2Min, the minimum desired number of X2 cards drawn, should be less than or equal to n.
                         Set k2Min to 0 if you do not want to use this variable in the calculation.
                         k2Min should be less than or equal to K2 and k2Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Max.B", "Max. number of X2 drawn (k2Max)", 6),
           bsPopover(id = "k2Max.B", title = "k2Max", 
                     content = "k2Max, the maximum desired number of X2 cards drawn, should be less than or equal to n.
                         Set k2Max to 0 if you do not want to use this variable in the calculation.
                         k2Max should be greater than or equal to k2Min and less than or equal to K2",
                     placement = "top", trigger = "hover")
    )
  ),
  actionButton("calc.B", "Calculate"),
  width = 4)

Page_B_MainPanel = 
  mainPanel(
    lapply(1:nbMulligansB, function(i) {
      tagList(
        htmlOutput(paste("labelResultat.B", i, sep = "_")),
        tableOutput(paste("tableResultat.B", i, sep = "_"))
      )
    }),
    width = 8
  )
