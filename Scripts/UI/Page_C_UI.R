Page_C_SidebarPanel = sidebarPanel(
  numericInput("N.C", "Total number of cards in the deck N", 60),
  bsPopover(id = "N.C", title = "N", 
            content = "N must be the highest value",
            placement = "top", trigger = "hover"),
  numericInput("n.C", "Number of cards drawn n", 7),
  bsPopover(id = "n.C", title = "n", 
            content = "n must be less than or equal to N",
            placement = "top", trigger = "hover"),
  textInput("labelX1.C", "Card category X1", "X1"),
  bsPopover(id = "labelX1.C", title = "Label of X1", 
            content = "For visualization of the name of the category X1",
            placement = "top", trigger = "hover"),
  numericInput("K1Min.C", "Min. number of X1 in the deck (K1Min)", 18),
  bsPopover(id = "K1Min.C", title = "K1Min", 
            content = "K1Min, the minimum number of X1 cards to test, must be less than or equal to N.
                         K1Min must be greater than or equal to k1Min and k1Max.
                         K1Min must be less than or equal to K1Max.
                         K1Min must be less than or equal to N.",
            placement = "top", trigger = "hover"),
  numericInput("K1Max.C", "Max. number of X1 in the deck (K1Max)", 28),
  bsPopover(id = "K1Max.C", title = "K1Max", 
            content = "K1Max, the maximum number of X1 cards to test, must be less than or equal to N.
                         K1Max must be greater than or equal to k1Min and k1Max.
                         K1Min must be greater than or equal to K1Min.
                         K1Max must be less than or equal to N.",
            placement = "top", trigger = "hover"),
  numericInput("k1Min.C", "Min. number of X1 drawn (k1Min)", 2),
  bsPopover(id = "k1Min.C", title = "k1Min", 
            content = "k1Min, the minimum number of X1 cards wanted to be drawn, must be less than or equal to n.
                         Set k1Min to 0 if you do not want to set a minimum.
                         k1Min must be less than or equal to K1Min, K1Max and k1Max.",
            placement = "top", trigger = "hover"),
  numericInput("k1Max.C", "Max. number of X1 drawn (k1Max)", 5),
  bsPopover(id = "k1Max.C", title = "k1Max", 
            content = "k1Max, the maximum number of X1 cards wanted to be drawn, must be less than or equal to n.
                         Set k1Max to n if you do not want to set a maximum.
                         k1Max must be greater than or equal to k1Min and less than or equal to K1Min and K1Max.",
            placement = "top", trigger = "hover"),
  actionButton("calc.C", "Calculate")
)

Page_C_MainPanel = mainPanel(
  lapply(1:nbMulligansC, function(i) {
    plotlyOutput(paste("plotResultat.C", i, sep = "_"))
  })
)
