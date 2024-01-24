Page_B_SidebarPanel = sidebarPanel(
  numericInput("N.B", "Nombre total de cartes dans le deck N", 99),
  bsPopover(id = "N.B", title = "N", 
            content = "N doit être la valeur la plus élevée",
            placement = "top", trigger = "hover"),
  numericInput("n.B", "Nombre de cartes piochées n", 7),
  bsPopover(id = "n.B", title = "n", 
            content = "n doit être inférieur ou égal à N",
            placement = "top", trigger = "hover"),
  numericInput("M.B", "Nombre de mulligans M", 3),
  bsPopover(id = "M.B", title = "n", 
            content = "M doit être inférieur ou égal à n",
            placement = "top", trigger = "hover"),
  
  fluidRow(
    column(6, 
           textInput("labelX1.B", "Catégorie de carte X1", "X1"),
           bsPopover(id = "labelX1.B", title = "Label de X1", 
                     content = "Pour visualisation du nom de la catégorie X1",
                     placement = "top", trigger = "hover"),
           
           numericInput("K1Min.B", "Min de X1 dans le deck (K1Min)", 18),
           bsPopover(id = "K1Min.B", title = "K1Min", 
                     content = "K1Min, le nombre de cartes X1 minimum à tester, doit être inférieur ou égal à N.
                         K1Min doit être supérieur ou égal à k1Min et k1Max.
                         La somme K1Min+K2Min doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K1Max.B", "Max de X1 dans le deck (K1Max)", 22),
           bsPopover(id = "K1Max.B", title = "K1Max", 
                     content = "K1Max, le nombre de cartes X1 maximum à tester, doit être inférieur ou égal à N.
                         K1Max doit être supérieur ou égal à k1Max et k1Max.
                         La somme K1Max+K2Max doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k1Min.B", "Nb min. pioché de X1 (k1Min)", 1),
           bsPopover(id = "k1Min.B", title = "k1Min", 
                     content = "k1Min, le nombre minimum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Min doit être inférieur ou égal à K1 et k1Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k1Max.B", "Nb max. pioché de X1 (k1Max)", 7),
           bsPopover(id = "k1Max.B", title = "k1Max", 
                     content = "k1Max, le nombre maximum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Max doit être supérieur ou égal à k1Min et inférieur ou égal à K1",
                     placement = "top", trigger = "hover")
           ),
    
    column(6, 
           textInput("labelX2.B", "Catégorie de carte X2", "X2"),
           bsPopover(id = "labelX2.B", title = "Label de X2", 
                     content = "Pour visualisation du nom de la catégorie X2",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2Min.B", "Min de X2 dans le deck (K2Min)", 35),
           bsPopover(id = "K2Min.B", title = "K2Min", 
                     content = "K2Min, le nombre de cartes X2 minimum à tester, doit être inférieur ou égal à N.
                         K2Min doit être supérieur ou égal à k2Min et k2Max.
                         La somme K1Min+K2Min doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2Max.B", "Max de X2 dans le deck (K2Max)", 42),
           bsPopover(id = "K2Max.B", title = "K2Max", 
                     content = "K2Max, le nombre de cartes X2 maximum à tester, doit être inférieur ou égal à N.
                         K2Max doit être supérieur ou égal à k2Max et k2Max.
                         La somme K1Max+K2Max doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Min.B", "Nb min. pioché de X2 (k2Min)", 2),
           bsPopover(id = "k2Min.B", title = "k2Min", 
                     content = "k2Min, le nombre minimum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Min doit être inférieur ou égal à K2 et k2Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Max.B", "Nb max. pioché de X2 (k2Max)", 7),
           bsPopover(id = "k2Max.B", title = "k2Max", 
                     content = "k2Max, le nombre maximum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Max doit être supérieur ou égal à k2Min et inférieur ou égal à K2",
                     placement = "top", trigger = "hover")
           )
  ),
  actionButton("calc.B", "Calculer"),
  width = 4)

Page_B_MainPanel = 
  mainPanel(htmlOutput("labelResultat.B"),
            tags$head(tags$style(HTML("#labelResultat.B {font-size: 16px;}"))), 
            width = 8
  )