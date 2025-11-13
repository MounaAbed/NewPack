n <- 10e4
pdfval <- mvpdf(x=matrix(1.96, nrow = 2, ncol = n), Log=FALSE)

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

