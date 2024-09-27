Page_A_SidebarPanel = sidebarPanel(
  numericInput("N.A", "Total number of cards in the deck N", 60),
  bsPopover(id = "N.A", title = "N", 
            content = "N must be the highest value",
            placement = "top", trigger = "hover"),
  numericInput("n.A", "Number of cards drawn n", 7),
  bsPopover(id = "n.A", title = "n", 
            content = "n must be less than or equal to N",
            placement = "top", trigger = "hover"),
  
  fluidRow(
    column(3, 
           textInput("labelX1.A", "Card category X1", "X1"),
           bsPopover(id = "labelX1.A", title = "Label of X1", 
                     content = "For visualization of the name of category X1",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX2.A", "Card category X2", "X2"),
           bsPopover(id = "labelX2.A", title = "Label of X2", 
                     content = "For visualization of the name of category X2",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX3.A", "Card category X3", "X3"),
           bsPopover(id = "labelX3.A", title = "Label of X3", 
                     content = "For visualization of the name of category X3",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX4.A", "Card category X4", "X4"),
           bsPopover(id = "labelX4.A", title = "Label of X4", 
                     content = "For visualization of the name of category X4",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("K1.A", "Nb of X1 in the deck (K1)", 12),
           bsPopover(id = "K1.A", title = "K1", 
                     content = "K1, the number of X1 cards, must be less than or equal to N.
                         Set K1 to 0 if you do not want to use this variable in the calculation.
                         K1 must be greater than or equal to k1Min and k1Max.
                         The sum K1+K2+K3+K4 must be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2.A", "Nb of X2 in the deck (K2)", 24),
           bsPopover(id = "K2.A", title = "K2", 
                     content = "K2, the number of X2 cards, must be less than or equal to N.
                         Set K2 to 0 if you do not want to use this variable in the calculation.
                         K2 must be greater than or equal to k2Min and k2Max.
                         The sum K1+K2+K3+K4 must be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K3.A", "Nb of X3 in the deck (K3)", 0),
           bsPopover(id = "K3.A", title = "K3", 
                     content = "K3, the number of X3 cards, must be less than or equal to N.
                         Set K3 to 0 if you do not want to use this variable in the calculation.
                         K3 must be greater than or equal to k3Min and k3Max.
                         The sum K1+K2+K3+K4 must be less than or equal to N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K4.A", "Nb of X4 in the deck (K4)", 0),
           bsPopover(id = "K4.A", title = "K4", 
                     content = "K4, the number of X4 cards, must be less than or equal to N.
                         Set K4 to 0 if you do not want to use this variable in the calculation.
                         K4 must be greater than or equal to k4Min and k4Max.
                         The sum K1+K2+K3+K4 must be less than or equal to N.",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("k1Min.A", "Min. drawn Nb of X1 (k1Min)", 1),
           bsPopover(id = "k1Min.A", title = "k1Min", 
                     content = "k1Min, the minimum desired number of X1 cards drawn, must be less than or equal to n.
                         Set k1Min to 0 if you do not want to use this variable in the calculation.
                         k1Min must be less than or equal to K1 and k1Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Min.A", "Min. drawn Nb of X2 (k2Min)", 2),
           bsPopover(id = "k2Min.A", title = "k2Min", 
                     content = "k2Min, the minimum desired number of X2 cards drawn, must be less than or equal to n.
                         Set k2Min to 0 if you do not want to use this variable in the calculation.
                         k2Min must be less than or equal to K2 and k2Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k3Min.A", "Min. drawn Nb of X3 (k3Min)", 0),
           bsPopover(id = "k3Min.A", title = "k3Min", 
                     content = "k3Min, the minimum desired number of X3 cards drawn, must be less than or equal to n.
                         Set k3Min to 0 if you do not want to use this variable in the calculation.
                         k3Min must be less than or equal to K3 and k3Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k4Min.A", "Min. drawn Nb of X4 (k4Min)", 0),
           bsPopover(id = "k4Min.A", title = "k4Min", 
                     content = "k4Min, the minimum desired number of X4 cards drawn, must be less than or equal to n.
                         Set k4Min to 0 if you do not want to use this variable in the calculation.
                         k4Min must be less than or equal to K4 and k4Max.",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("k1Max.A", "Max. drawn Nb of X1 (k1Max)", 5),
           bsPopover(id = "k1Max.A", title = "k1Max", 
                     content = "k1Max, the maximum desired number of X1 cards drawn, must be less than or equal to n.
                         Set k1Max to 0 if you do not want to use this variable in the calculation.
                         k1Max must be greater than or equal to k1Min and less than or equal to K1",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Max.A", "Max. drawn Nb of X2 (k2Max)", 6),
           bsPopover(id = "k2Max.A", title = "k2Max", 
                     content = "k2Max, the maximum desired number of X2 cards drawn, must be less than or equal to n.
                         Set k2Max to 0 if you do not want to use this variable in the calculation.
                         k2Max must be greater than or equal to k2Min and less than or equal to K2",
                     placement = "top", trigger = "hover"),
           
           numericInput("k3Max.A", "Max. drawn Nb of X3 (k3Max)", 0),
           bsPopover(id = "k3Max.A", title = "k3Max", 
                     content = "k3Max, the maximum desired number of X3 cards drawn, must be less than or equal to n.
                         Set k3Max to 0 if you do not want to use this variable in the calculation.
                         k3Max must be greater than or equal to k3Min and less than or equal to K3",
                     placement = "top", trigger = "hover"),
           
           numericInput("k4Max.A", "Max. drawn Nb of X4 (k4Max)", 0),
           bsPopover(id = "k4Max.A", title = "k4Max", 
                     content = "k4Max, the maximum desired number of X4 cards drawn, must be less than or equal to n.
                         Set k4Max to 0 if you do not want to use this variable in the calculation.
                         k4Max must be greater than or equal to k4Min and less than or equal to K4",
                     placement = "top", trigger = "hover"))
  ),
  actionButton("calc.A", "Calculate"),
  width = 7)

Page_A_MainPanel = 
  mainPanel(htmlOutput("labelResultat.A"),
            tags$head(tags$style(HTML("#labelResultat.A {font-size: 16px;}"))), 
            width = 5
  )
