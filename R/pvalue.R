.calc_pvalue <- function(perms, observed, alt) {
  B <- length(perms)
  
  switch(alt,
         (sum(perms <= observed) + 1) / (B + 1),
         (sum(perms >= observed) + 1) / (B + 1),
         (sum(abs(perms) >= abs(observed)) + 1) / (B + 1),
         stop("Alternative not matched.")
  )
}
