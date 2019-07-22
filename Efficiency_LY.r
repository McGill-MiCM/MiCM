
# double
class(5); is.double(5)

# integer
class(5L); is.double(5L)

object.size(rep(5, 1000))
object.size(rep(5L, 1000))

# How precise is double precision?
options(digits = 22) # show more digits in output
print(1/3)
options(digits = 7) # default

# logical
class(TRUE); class(F)

# character
class("TRUE")

# Not important for this workshop
fac <- as.factor(c(1, 5, 11, 3))
fac

class(fac)

fac.ch <- as.factor(c("B", "a", "1", "ab", "b", "A"))
fac.ch

# Scalar - a vector of length 1
myscalar <- 5
myscalar

class(myscalar)

# Vector
myvector <- c(1, 1, 2, 3, 5, 8)
myvector

class(myvector)

# Matrix - a 2d array
mymatrix <- matrix(c(1, 1, 2, 3, 5, 8), nrow = 2, byrow = FALSE)
mymatrix

class(mymatrix)

# Array - not important for this workshop
myarray <- array(c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144), dim = c(2, 2, 3))
print(myarray) # print() is not needed if run in R or Rstudio.

class(myarray)

# List - very important for the workshop
mylist <- list(Title = "Efficient Coding and Computing",
               Duration = c(3, 3),
               sections = as.factor(c(1, 2, 3, 4)),
               Date = as.Date("2019-08-13"),
               Lunch_provided = FALSE,
               Feedbacks = c("Amazing!", "Great workshop!", "Yi is the best!", "Wow!")
)
print(mylist) # No need for print if running in R or Rstudio

class(mylist)

# Access data stored in lists
mylist$Title

# or
mylist[[6]]

# Further
mylist$Duration[1]
mylist[[6]][2]

# Elements in lists can have different data types
lapply(mylist, class) # We will talk about lapply() later

# Elements in list can have different lengths
lapply(mylist, length)

# Data frames - most commonly used for analyses
head(mtcars)

# Access a column (variable) in data frames
mtcars$mpg

# Let's try to invert a large matrix.
A <- diag(4000)
# A.inv <- solve(A)

# optim() in R calls C programs, run optim to see source code.
# optim

# Vectorized operation
t <- system.time( x1 <- sqrt(1:1000000) )
head(x1)

# We can do worse
# For loop with memory pre-allocation
x2 <- rep(NA, 1000000)
t0 <- proc.time()
for (i in 1:1000000) {
    x2[i] <- sqrt(i)
}
t1 <- proc.time()

identical(x1, x2) # Check whether results are the same

# Even worse
# For loop without memory pre-allocation
x3 <- NULL
t2 <- proc.time()
for (i in 1:1000000) {
    x3[i] <- sqrt(i)
}
t3 <- proc.time()

identical(x2, x3) # Check whether results are the same

# As we can see, R is not very good with loops.
t; t1 - t0; t3 - t2
# ?proc.time

# microbenchmark runs the code multiple times and take a summary
library(microbenchmark)
result <- microbenchmark(sqrt(1:1000000),
                         for (i in 1:1000000) {x2[i] <- sqrt(i)},
                         unit = "s", times = 20
                        )
summary(result)
# Result in seconds

# Use well-developped R functions
result <- microbenchmark(sqrt(500),
                         500^0.5,
                         unit = "ns", times = 1000
                        )
summary(result)
# Result in nanoseconds

data <- read.csv("https://raw.githubusercontent.com/ly129/MiCM/master/sample.csv", header = TRUE)
head(data, 10)

summary(data)







cts.var <- sapply(X = data, FUN = is.double) # We'll talk about sapply later.
cts <- data[ , cts.var]
head(cts)





















# Return a list using tapply()













adult <- 18

head(data)

if (data$Age >= 18) {
    data$Adult2 = "Yes"
} else {
    data$Adult2 = "No"
}
head(data)

# Delete Adult2
data <- subset(data, select=-c(Adult2))

cut.points <- c(0, 16, 18, 20, 22, Inf)
# labels as default

# Set labels to false

# Customized labels
label <- c("Curry", "Drake", "VanVleet", "Lin", "Leonard")



cut.points <- c(0, 16, 18, 20, 22, Inf)

# lapply

# sapply
# See what simplify does

# vapply *
# Safer than sapply(), and a little bit faster
# because FUN.VALUE has to be specified that length and type should match
# Any idea why it can be a little bit faster? Recall...
# va <- vapply(Wr.Hnd.grp, summary, FUN.VALUE = c("Min." = numeric(1),
#                                                 "1st Qu." = numeric(1),
#                                                 "Median" = numeric(1),
#                                                 "lalalalala" = numeric(1),
#                                                 "3rd Qu." = numeric(1),
#                                                 "Max." = numeric(1)))
# va

# aggregate(Wr.Hnd~Smoke, data = data, FUN = ...)
# tapply(X = data$Wr.Hnd, INDEX = list(data$Smoke), FUN = ...)

sample.mean <- NULL
sample.sd <- NULL
n <- 10
t <- qt(p = 0.025, df = n - 1, lower.tail = FALSE)
lb <- sample.mean - t * sample.sd / sqrt(n)
ub <- sample.mean + t * sample.sd / sqrt(n)

# How many times did we aggregate according to the group? Can on aggregate only once?

# The structure
func_name <- function(argument){
    statement
}

# Build the function
times2 <- function(x) {
    fx = 2 * x
    return(fx)
}
# Use the function
times2(x = 5)
# or
times2(5)

# R has operators that do this
9 %/% 2
9 %% 2

int.div <- function(){
    
}

# class(result)
# Recall: how do we access the modulus?

# No need to worry about the details here.
# Just want to show that functions do not always have to return() something.
AIcanadian <- function(who, reply_to) {
    system(paste("say -v", who, "Sorry!"))
}
# AIcanadian("Alex", "Sorry I stepped on your foot.")

# Train my chatbot - AlphaGo style.
# I'll let Alex and Victoria talk to each other.
# MacOS has their voices recorded.
chat_log <- rep(NA, 8)
# for (i in 1:8) {
#     if (i == 1) {
#         chat_log[1] <- "Sorry I stepped on your foot."
#         system("say -v Victoria Sorry, I stepped on your foot.")
#     } else {
#         if (i %% 2 == 0)
#             chat_log[i] <- AIcanadian("Alex", chat_log[i - 1])
#         else
#             chat_log[i] <- AIcanadian("Victoria", chat_log[i - 1])
#     }
# }
# chat_log

data_summary <- function(func) {
    data <- read.csv("https://raw.githubusercontent.com/ly129/MiCM/master/sample.csv", header = TRUE)
    by(data = data$Wr.Hnd, INDICES = list(data$Smoke), FUN = func)
}
data_summary(quantile)

# sample.mean <- NULL
# sample.sd <- NULL
# n <- NULL
# t <- qt(p = 0.025, df = n - 1, lower.tail = FALSE)
# lb <- sample.mean - t * sample.sd / sqrt(n)
# ub <- sample.mean + t * sample.sd / sqrt(n)

sample_CI <- function(x) {
}

aggregate(Wr.Hnd~Smoke, data = data, FUN = sample_CI)

library(parallel)
detectCores()

mat.list <- sapply(c(1, 5, 200, 250, 1800, 2000), diag)
print(head(mat.list, 2)) # print() makes the output here look the same as in R/Rstudio

system.time(
    sc <- lapply(mat.list, solve)
)

system.time(
    mc <- mclapply(mat.list, solve, mc.preschedule = TRUE, mc.cores = 3)
)

system.time(
    mc <- mclapply(mat.list, solve, mc.preschedule = FALSE, mc.cores = 3)
)

t <- proc.time()
cl <- makeCluster(3) # Use 3 cores
pl <- parLapply(cl = cl, X = mat.list, fun = solve)
stopCluster(cl)
proc.time() - t

t <- proc.time()
cl <- makeCluster(3)
pl <- parLapplyLB(cl = cl, X = mat.list, fun = solve)
stopCluster(cl)
proc.time() - t

# Two parallel calls within one cluster.
t <- proc.time()
cl <- makeCluster(3)
pl_nb <- parLapply(cl = cl, X = mat.list, fun = solve)
pl_lb <- parLapplyLB(cl = cl, X = mat.list, fun = solve)
stopCluster(cl)
proc.time() - t
# This takes shorter than the sum of the previous two. Why?

t <- proc.time()
cl <- makeCluster(3)
stopCluster(cl)
proc.time() - t

library(Rcpp)
sourceCpp("sqrt_cpp.cpp")
square_root(1:4)
# We return a NumericVector in the .cpp file. So we get an R vector.

sourceCpp("mm_cpp.cpp")

# Now we can call the function using the name defined in the .cpp file
set.seed(20190813)
a <- matrix(rnorm(100000), ncol = 50000)  # 2 x 50000 matrix
b <- matrix(rnorm(200000), nrow = 50000)  # 50000 x 4 matrix

mat_mul(a, b)
# We return an Rcpp::List in the .cpp file. So we get an R list here.
# mat_mul(b, a)

bchmk <- microbenchmark(a %*% b,
                        mat_mul(a, b),
                        unit = "us", times = 100
                       )
summary(bchmk)

# Here we make an R function that calls the C++ function
mmc <- function(a, b) {
    result <- mat_mul(a, b)$MatrixMultiplication
    return(result)
}
mmc(a, b)

# Another way to do this. Here you do not need to have a separate .cpp file.
# A naive .cpp function is made here.
library(RcppArmadillo)
cppFunction(depends = "RcppArmadillo",
            code = 'arma::mat mm(arma::mat& A, arma::mat& B){
                        return A * B;
                    }'
)

mm(a, b)
# mm(b, a)

# We can wrap this naive function in an R function to manipulate input and output in R
mmc2 <- function(A, B) {
    if (ncol(A) == nrow(B)) {
        return(mm(A, B))
    } else {
        stop("non-conformable arguments")
    }
}
mmc2(a, b)
# mmc2(b, a)

set.seed(20190813)

ra <- 2
ca <- 4
rb <- 4
cb <- 3

A <- matrix(rnorm(ra*ca), nrow = ra)
B <- matrix(rnorm(rb*cb), nrow = rb)

A; B

# Load the executable .so file (MacOS) or .dll file (Windows)
dyn.load("mm_for.so")

# Check whether the "mat_mul_for" function is loaded into R
is.loaded("mat_mul_for")

result <- .Fortran("mat_mul_for",
                   A = as.double(A),
                   B = as.double(B),
                   AB = double(ra * cb),  # note the difference here
                   RowA = as.integer(ra),
                   ColA = as.integer(ca),
                   RowB = as.integer(rb),
                   ColB = as.integer(cb),
                   RowAB = as.integer(ra),
                   ColAB = as.integer(cb)
)
result
class(result)

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
ca <- 50000
rb <- 50000
cb <- 3

A <- matrix(rnorm(ra*ca), nrow = ra)
B <- matrix(rnorm(rb*cb), nrow = rb)

mmf(A, B)

A %*% B

# Something like this.
9 %/% 2; 9%%2

# Something like this.
c(15, 14, 13, 12) %/% c(6, 5, 4, 3)
c(15, 14, 13, 12) %% c(6, 5, 4, 3)

# If you enter the right X and Y in your function, you should get the following result
lm(Wr.Hnd~NW.Hnd+Age, data = data)

# Something like this, both inputs are R functions.
GD <- function(objective_function, gradient_function, initial_value) {
    statements
}


