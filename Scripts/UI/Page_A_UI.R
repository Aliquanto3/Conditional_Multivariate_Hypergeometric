Page_A_SidebarPanel = sidebarPanel(
  numericInput("N.A", "Nombre total de cartes dans le deck N", 99),
  bsPopover(id = "N.A", title = "N", 
            content = "N doit être la valeur la plus élevée",
            placement = "top", trigger = "hover"),
  numericInput("n.A", "Nombre de cartes piochées n", 7),
  bsPopover(id = "n.A", title = "n", 
            content = "n doit être inférieur ou égal à N",
            placement = "top", trigger = "hover"),
  
  fluidRow(
    column(3, 
           textInput("labelX1.A", "Catégorie de carte X1", "X1"),
           bsPopover(id = "labelX1.A", title = "Label de X1", 
                     content = "Pour visualisation du nom de la catégorie X1",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX2.A", "Catégorie de carte X2", "X2"),
           bsPopover(id = "labelX2.A", title = "Label de X2", 
                     content = "Pour visualisation du nom de la catégorie X2",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX3.A", "Catégorie de carte X3", "X3"),
           bsPopover(id = "labelX3.A", title = "Label de X3", 
                     content = "Pour visualisation du nom de la catégorie X3",
                     placement = "top", trigger = "hover"),
           
           textInput("labelX4.A", "Catégorie de carte X4", "X4"),
           bsPopover(id = "labelX4.A", title = "Label de X4", 
                     content = "Pour visualisation du nom de la catégorie X4",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("K1.A", "Nb de X1 dans le deck (K1)", 20),
           bsPopover(id = "K1.A", title = "K1", 
                     content = "K1, le nombre de cartes X1, doit être inférieur ou égal à N.
                         Fixer K1 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K1 doit être supérieur ou égal à k1Min et k1Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K2.A", "Nb de X2 dans le deck (K2)", 40),
           bsPopover(id = "K2.A", title = "K2", 
                     content = "K2, le nombre de cartes X2, doit être inférieur ou égal à N.
                         Fixer K2 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K2 doit être supérieur ou égal à k2Min et k2Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K3.A", "Nb de X3 dans le deck (K3)", 0),
           bsPopover(id = "K3.A", title = "K3", 
                     content = "K3, le nombre de cartes X3, doit être inférieur ou égal à N.
                         Fixer K3 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K3 doit être supérieur ou égal à k3Min et k3Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover"),
           
           numericInput("K4.A", "Nb de X4 dans le deck (K4)", 0),
           bsPopover(id = "K4.A", title = "K4", 
                     content = "K4, le nombre de cartes X4, doit être inférieur ou égal à N.
                         Fixer K4 à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         K4 doit être supérieur ou égal à k4Min et k4Max.
                         La somme K1+K2+K3+K4 doit être inférieure ou égale à N.",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("k1Min.A", "Nb min. pioché de X1 (k1Min)", 1),
           bsPopover(id = "k1Min.A", title = "k1Min", 
                     content = "k1Min, le nombre minimum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Min doit être inférieur ou égal à K1 et k1Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Min.A", "Nb min. pioché de X2 (k2Min)", 2),
           bsPopover(id = "k2Min.A", title = "k2Min", 
                     content = "k2Min, le nombre minimum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Min doit être inférieur ou égal à K2 et k2Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k3Min.A", "Nb min. pioché de X3 (k3Min)", 0),
           bsPopover(id = "k3Min.A", title = "k3Min", 
                     content = "k3Min, le nombre minimum voulu de cartes X3 piochées, doit être inférieur ou égal à n.
                         Fixer k3Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k3Min doit être inférieur ou égal à K3 et k3Max.",
                     placement = "top", trigger = "hover"),
           
           numericInput("k4Min.A", "Nb min. pioché de X4 (k4Min)", 0),
           bsPopover(id = "k4Min.A", title = "k4Min", 
                     content = "k4Min, le nombre minimum voulu de cartes X4 piochées, doit être inférieur ou égal à n.
                         Fixer k4Min à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k4Min doit être inférieur ou égal à K4 et k4Max.",
                     placement = "top", trigger = "hover")),
    column(3, 
           numericInput("k1Max.A", "Nb max. pioché de X1 (k1Max)", 7),
           bsPopover(id = "k1Max.A", title = "k1Max", 
                     content = "k1Max, le nombre maximum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k1Max doit être supérieur ou égal à k1Min et inférieur ou égal à K1",
                     placement = "top", trigger = "hover"),
           
           numericInput("k2Max.A", "Nb max. pioché de X2 (k2Max)", 7),
           bsPopover(id = "k2Max.A", title = "k2Max", 
                     content = "k2Max, le nombre maximum voulu de cartes X2 piochées, doit être inférieur ou égal à n.
                         Fixer k2Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k2Max doit être supérieur ou égal à k2Min et inférieur ou égal à K2",
                     placement = "top", trigger = "hover"),
           
           numericInput("k3Max.A", "Nb max. pioché de X3 (k3Max)", 0),
           bsPopover(id = "k3Max.A", title = "k3Max", 
                     content = "k3Max, le nombre maximum voulu de cartes X3 piochées, doit être inférieur ou égal à n.
                         Fixer k3Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k3Max doit être supérieur ou égal à k3Min et inférieur ou égal à K3",
                     placement = "top", trigger = "hover"),
           
           numericInput("k4Max.A", "Nb max. pioché de X4 (k4Max)", 0),
           bsPopover(id = "k4Max.A", title = "k4Max", 
                     content = "k4Max, le nombre maximum voulu de cartes X4 piochées, doit être inférieur ou égal à n.
                         Fixer k4Max à 0 si vous ne souhaitez pas utiliser cette variable dans le calcul.
                         k4Max doit être supérieur ou égal à k4Min et inférieur ou égal à K4",
                     placement = "top", trigger = "hover"))
  ),
  actionButton("calc.A", "Calculer"),
  width = 7)

Page_A_MainPanel = 
  mainPanel(htmlOutput("labelResultat.A"),
    tags$head(tags$style(HTML("#labelResultat.A {font-size: 16px;}"))), 
    width = 5
  )