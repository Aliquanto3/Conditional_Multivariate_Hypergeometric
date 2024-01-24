multivariateHypergeometricComputation4params = function(N,n,Ks,mins,maxs){
  prob = 0
  # Boucle pour sommer les probabilités
  for (x1 in mins[1]:maxs[1]) {
    for (x2 in mins[2]:maxs[2]) {
      for (x3 in mins[3]:maxs[3]) {
        for (x4 in mins[4]:maxs[4]) {
          if (x1 + x2 + x3 + x4 <= n) {
            prob = prob +
              (
                choose(Ks[1], x1) *
                  choose(Ks[2], x2) *
                  choose(Ks[3], x3) *
                  choose(Ks[4], x4) *
                  choose(N - Ks[1] - Ks[2] - Ks[3] - Ks[4], 
                         n - x1 -x2 - x3 - x4)
              ) /
              choose(N, n)
          }
        }
      }
    }
  }
  return(prob)
}

multivariateHypergeometricComputation2params = function(N,n,Ks,mins,maxs){
  prob = 0
  # Boucle pour sommer les probabilités
  for (x1 in mins[1]:maxs[1]) {
    for (x2 in mins[2]:maxs[2]) {
      if (x1 + x2 <= n) {
        prob = prob +
          (
            choose(Ks[1], x1) *
              choose(Ks[2], x2) *
              choose(N - Ks[1] - Ks[2], 
                     n - x1 -x2)
          ) /
          choose(N, n)
      }
    }
  }
  return(prob)
}
