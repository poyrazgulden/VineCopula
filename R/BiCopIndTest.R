#' Independence Test for Bivariate Copula Data
#'
#' This function returns the p-value of a bivariate asymptotic independence
#' test based on Kendall's \eqn{\tau}.
#'
#' The test exploits the asymptotic normality of the test statistic
#' \deqn{\texttt{statistic} := T =
#' \sqrt{\frac{9N(N - 1)}{2(2N + 5)}} \times |\hat{\tau}|, }{
#' statistic := T = ( (9N(N-1)) / (2(2N+5)) )^0.5 * |\tau|, }
#' where \eqn{N} is the number of observations (length of `u1`) and
#' \eqn{\hat{\tau}} the empirical Kendall's tau of the data vectors `u1`
#' and `u2`. The p-value of the null hypothesis of bivariate independence
#' hence is asymptotically
#' \deqn{\texttt{p.value} = 2 \times \left(1 - \Phi\left(T\right)\right), }{
#' p.value = 2*(1-\Phi(T)), }
#' where \eqn{\Phi} is the standard normal distribution function.
#'
#' @param u1,u2 Data vectors of equal length with values in \eqn{[0,1]}.
#' @return \item{statistic}{Test statistic of the independence test.}
#' \item{p.value}{P-value of the independence test.}
#' @author Jeffrey Dissmann
#' @seealso [BiCopGofTest()], [BiCopPar2Tau()],
#' [BiCopTau2Par()], [BiCopSelect()],\cr
#' [RVineCopSelect()], [RVineStructureSelect()]
#' @references Genest, C. and A. C. Favre (2007). Everything you always wanted
#' to know about copula modeling but were afraid to ask. Journal of Hydrologic
#' Engineering, 12 (4), 347-368.
#' @examples
#' \dontshow{set.seed(123)}
#' ## Example 1: Gaussian copula with large dependence parameter
#' cop <- BiCop(1, 0.7)
#' dat <- BiCopSim(500, cop)
#'
#' # perform the asymptotic independence test
#' BiCopIndTest(dat[, 1], dat[, 2])
#'
#' ## Example 2: Gaussian copula with small dependence parameter
#' cop <- BiCop(1, 0.01)
#' dat <- BiCopSim(500, cop)
#'
#' # perform the asymptotic independence test
#' BiCopIndTest(dat[, 1], dat[, 2])
#'
BiCopIndTest <- function(u1, u2) {
    ## preprocessing of arguments
    args <- preproc(c(as.list(environment()), call = match.call()),
                    check_u,
                    remove_nas,
                    check_if_01,
                    na.txt = " Only complete observations are used.")
    list2env(args, environment())

    tau <- fasttau(u1, u2)

    N <- length(u1)
    f <- sqrt((9 * N * (N - 1))/(2 * (2 * N + 5))) * abs(tau)

    return(list(statistic = f, p.value = 2 * (1 - pnorm(f))))
}
