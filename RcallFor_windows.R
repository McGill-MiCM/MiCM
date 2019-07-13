# setwd("")
# Set working directory
# It is easier to also put your .f90 and .dll in this directory.

dyn.load("mat_mul_for.dll")

# Check whether the function is loaded
is.loaded("mat_mul_for")

mmf <- function(A, B) {
  ra <- nrow(A)
  ca <- ncol(A)
  rb <- nrow(B)
  cb <- ncol(B)
  
  if (ca == rb) {
    result <- .Fortran("mat_mul_for",
                       A = as.double(A),
                       B = as.double(B),
                       AB = double(ra * cb),
                       RowA = as.integer(ra),
                       ColA = as.integer(ca),
                       RowB = as.integer(rb),
                       ColB = as.integer(cb),
                       RowAB = as.integer(ra),
                       ColAB = as.integer(cb)
    )
    mm <- matrix(result$AB, nrow = result$RowAB, byrow = F)
  } else {
    stop('non-conformable arguments')
  }
  return(list(Result = mm,
              Dimension = c(result$RowAB, result$ColAB)
  )
  )
}


set.seed(20190813)

ra <- 2
ca <- 4
rb <- 4
cb <- 3

A <- matrix(rnorm(ra*ca), nrow = ra)
B <- matrix(rnorm(rb*cb), nrow = rb)

A; B

mmf(A, B)