# 0.1 predefined function
get_kappa <- function(vec1, vec2) {
  tbl <- table(factor(vec1, levels = c(0, 1)), factor(vec2, levels = c(0, 1)))
  po <- sum(diag(tbl)) / sum(tbl)
  pe <- sum(rowSums(tbl) * colSums(tbl)) / (sum(tbl)^2)
  k <- (po - pe) / (1 - pe)

  if(is.nan(k)) return(0)
  return(k)
}

