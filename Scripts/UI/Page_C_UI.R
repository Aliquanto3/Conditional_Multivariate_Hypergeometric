Page_C_SidebarPanel = sidebarPanel(
  numericInput("N.C", "Nombre total de cartes dans le deck N", 99),
  bsPopover(id = "N.C", title = "N", 
            content = "N doit être la valeur la plus élevée",
            placement = "top", trigger = "hover"),
  numericInput("n.C", "Nombre de cartes piochées n", 7),
  bsPopover(id = "n.C", title = "n", 
            content = "n doit être inférieur ou égal à N",
            placement = "top", trigger = "hover"),
  textInput("labelX1.C", "Catégorie de carte X1", "X1"),
  bsPopover(id = "labelX1.C", title = "Label de X1", 
            content = "Pour visualisation du nom de la catégorie X1",
            placement = "top", trigger = "hover"),
  numericInput("K1Min.C", "Nb minimum de X1 dans le deck (K1Min)", 35),
  bsPopover(id = "K1Min.C", title = "K1Min", 
            content = "K1Min, le nombre de cartes X1 minimal à tester, doit être inférieur ou égal à N.
                         K1Min doit être supérieur ou égal à k1Min et k1Max.
                         K1Min doit être inférieur ou égal à K1Max.
                         K1Min doit être inférieur ou égale à N.",
            placement = "top", trigger = "hover"),
  numericInput("K1Max.C", "Nb maximum de X1 dans le deck (K1Max)", 45),
  bsPopover(id = "K1Max.C", title = "K1Max", 
            content = "K1Max, le nombre de cartes X1 maximal à tester, doit être inférieur ou égal à N.
                         K1Max doit être supérieur ou égal à k1Min et k1Max.
                         K1Min doit être supérieur ou égal à K1Min.
                         K1Max doit être inférieur ou égale à N.",
            placement = "top", trigger = "hover"),
  numericInput("k1Min.C", "Nb min. pioché de X1 (k1Min)", 3),
  bsPopover(id = "k1Min.C", title = "k1Min", 
            content = "k1Min, le nombre minimum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Min à 0 si vous ne souhaitez pas fixer de minimum.
                         k1Min doit être inférieur ou égal à K1Min, K1Max et k1Max.",
            placement = "top", trigger = "hover"),
  numericInput("k1Max.C", "Nb max. pioché de X1 (k1Max)", 5),
  bsPopover(id = "k1Max.C", title = "k1Max", 
            content = "k1Max, le nombre maximum voulu de cartes X1 piochées, doit être inférieur ou égal à n.
                         Fixer k1Max à n si vous ne souhaitez pas fixer de maximum.
                         k1Max doit être supérieur ou égal à k1Min et inférieur ou égal à K1Min et K1Max.",
            placement = "top", trigger = "hover"),
  actionButton("calc.C", "Calculer")
  )

Page_C_MainPanel = mainPanel(
  lapply(1:nbMulligansC, function(i) {
    plotlyOutput(paste("plotResultat.C", i, sep = "_"))
  })
)

