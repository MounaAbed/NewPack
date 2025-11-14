n <- 10e4
pdfval <- mvpdf(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE)

# utiliser usethis::use_git_ignore("nomduscript.R") pour ne pas inclure dans le packae
# pour créer un package de manière automatique : usethis::create_from_github(repo)

# @rdname mvnpdf => permet de ne pas réécrire la partie roxygen de la fonction mvnpdf
library(microbenchmark)

n <- 1000
mb <- microbenchmark(mvpdf(x = matrix(1.96, nrow = 2, ncol = n), Log = FALSE),
                     mvpdfsmart(x = matrix(1.96, nrow = 2, ncol = n),
                                 Log = FALSE),
                     times=100L)
mb

n <- 1000
mb <- microbenchmark(mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)),
                     mvpdf(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
                     mvpdfsmart(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
                     times=100L)
mb

n <- 10e4
profvis::profvis(mvnpdfoptim(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE))


n <- 1000
mb <- microbenchmark(mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)),
                     mvpdf(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
                     mvpdfsmart(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
                     mvnpdfoptim(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
                     times=100L)
mb
plot(mb)

n <- 10e6
profvis::profvis(mvtnorm::dmvnorm(matrix(1.96, nrow = n, ncol = 2)))

#### Derniere partie : parallélisation

library(microbenchmark)
library(future.apply)

log_seq <- function(x) {
  # try this yourself (spoiler alert: it is quite long...):
  # res <- numeric(length(x))
  # for(i in 1:length(x)){
  #   res[i] <- log(x[i])
  # }
  # return(res)
  return(log(x))
}

log_par <- function(x) {
  res <- future_sapply(1:length(x), FUN = function(i) {
    log(x[i])
  })
  return(res)
}

plan(multisession(workers = 3))
mb <- microbenchmark(log_par(1:100), log_seq(1:100), times = 50)
plot(mb,log="y")

### Efficient parallelisation

x <- matrix(rnorm(1e6),nrow=10)
dim(x)

colmedian_apply <- function(x){
  return(apply(X = x, MARGIN = 2, FUN = median))
}
system.time(colmedian_apply(x))

colmedian_for <- function(x){
  p <- ncol(x)
  ans <- numeric(p)
  for (i in 1:p) {
    ans[i] <- median(x[, i])
  }
  return(ans)
}
system.time(colmedian_for(x))

colmedian_par <- function(x){
  res <- future_sapply(1:ncol(x), FUN = function(i) {
    median(x[,i])
  })
}

plan(multisession(workers = 3))
system.time(colmedian_par(x))

mb <- microbenchmark(colmedian_for(x),colmedian_apply(x),colmedian_par(x), times = 50)
plot(mb,log="y")



plan(multisession(workers = 3))
n <- 10000
mb <- microbenchmark::microbenchmark(
  mypkgr::mvnpdfsmart(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  mypkgr::mvnpdfsmart_par(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE),
  times=20)
mb



