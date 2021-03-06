#' Scoring Goodness-of-Fit Test based on Vuong And Clarke Tests for Bivariate
#' Copula Data
#'
#' Based on the Vuong and Clarke tests this function computes a goodness-of-fit
#' score for each bivariate copula family under consideration. For each
#' possible pair of copula families the Vuong and the Clarke tests decides
#' which of the two families fits the given data best and assigns a score---pro
#' or contra a copula family---according to this decision.
#'
#' The Vuong as well as the Clarke test compare two models against each other
#' and based on their null hypothesis, allow for a statistically significant
#' decision among the two models (see the documentations of
#' [RVineVuongTest()] and [RVineClarkeTest()] for
#' descriptions of the two tests). In the goodness-of-fit test proposed by
#' Belgorodski (2010) this is used for bivariate copula selection. It compares
#' a model 0 to all other possible models under consideration. If model 0 is
#' favored over another model, a score of "+1" is assigned and similarly a
#' score of "-1" if the other model is determined to be superior. No score is
#' assigned, if the respective test cannot discriminate between two models.
#' Both tests can be corrected for the numbers of parameters used in the
#' copulas. Either no correction (`correction = FALSE`), the Akaike
#' correction (`correction = "Akaike"`) or the parsimonious Schwarz
#' correction (`correction = "Schwarz"`) can be used.
#'
#' The models compared here are bivariate parametric copulas and we would like
#' to determine which family fits the data better than the other families.
#' E.g., if we would like to test the hypothesis that the bivariate Gaussian
#' copula fits the data best, then we compare the Gaussian copula against all
#' other copulas under consideration. In doing so, we investigate the null
#' hypothesis "The Gaussian copula fits the data better than all other copulas
#' under consideration", which corresponds to \eqn{k-1} times the hypothesis
#' "The Gaussian copula \eqn{C_j} fits the data better than copula \eqn{C_i}"
#' for all \eqn{i=1,...,k, i\neq j}{i=1,...,k, i!=j}, where \eqn{k} is the
#' number of bivariate copula families under consideration (length of
#' `familyset`). This procedure is done not only for one family but for
#' all families under consideration, i.e., two scores, one based on the Vuong
#' and one based on the Clarke test, are returned for each bivariate copula
#' family. If used as a goodness-of-fit procedure, the family with the highest
#' score should be selected.
#'
#' For more and detailed information about the goodness-of-fit test see
#' Belgorodski (2010).
#'
#' @param u1,u2 Data vectors of equal length with values in \eqn{[0,1]}.
#' @param familyset An integer vector of bivariate copula families under
#' consideration, i.e., which are compared in the goodness-of-fit test.  If
#' `familyset = NA` (default), all possible families are compared.
#' Possible families are: \cr
#' `0` = independence copula \cr
#' `1` = Gaussian copula \cr
#' `2` = Student t copula (t-copula) \cr
#' `3` = Clayton copula \cr
#' `4` = Gumbel copula \cr
#' `5` = Frank copula \cr
#' `6` = Joe copula \cr
#' `7` = BB1 copula \cr
#' `8` = BB6 copula \cr
#' `9` = BB7 copula \cr
#' `10` = BB8 copula \cr
#' `13` = rotated Clayton copula (180 degrees; ``survival Clayton'') \cr
#' `14` = rotated Gumbel copula (180 degrees; ``survival Gumbel'') \cr
#' `16` = rotated Joe copula (180 degrees; ``survival Joe'') \cr
#' `17` = rotated BB1 copula (180 degrees; ``survival BB1'')\cr
#' `18` = rotated BB6 copula (180 degrees; ``survival BB6'')\cr
#' `19` = rotated BB7 copula (180 degrees; ``survival BB7'')\cr
#' `20` = rotated BB8 copula (180 degrees; ``survival BB8'')\cr
#' `23` = rotated Clayton copula (90 degrees) \cr
#' `24` = rotated Gumbel copula (90 degrees) \cr
#' `26` = rotated Joe copula (90 degrees) \cr
#' `27` = rotated BB1 copula (90 degrees) \cr
#' `28` = rotated BB6 copula (90 degrees) \cr
#' `29` = rotated BB7 copula (90 degrees) \cr
#' `30` = rotated BB8 copula (90 degrees) \cr
#' `33` = rotated Clayton copula (270 degrees) \cr
#' `34` = rotated Gumbel copula (270 degrees) \cr
#' `36` = rotated Joe copula (270 degrees) \cr
#' `37` = rotated BB1 copula (270 degrees) \cr
#' `38` = rotated BB6 copula (270 degrees) \cr
#' `39` = rotated BB7 copula (270 degrees) \cr
#' `40` = rotated BB8 copula (270 degrees) \cr
#' `104` = Tawn type 1 copula \cr
#' `114` = rotated Tawn type 1 copula (180 degrees) \cr
#' `124` = rotated Tawn type 1 copula (90 degrees) \cr
#' `134` = rotated Tawn type 1 copula (270 degrees) \cr
#' `204` = Tawn type 2 copula \cr
#' `214` = rotated Tawn type 2 copula (180 degrees) \cr
#' `224` = rotated Tawn type 2 copula (90 degrees) \cr
#' `234` = rotated Tawn type 2 copula (270 degrees) \cr
#' @param correction Correction for the number of parameters.  Possible
#' choices: `correction = FALSE` (no correction; default), `"Akaike"`
#' and `"Schwarz"`.
#' @param level Numerical; significance level of the tests (default:
#' `level = 0.05`).
#' @param rotations If `TRUE`, all rotations of the families in
#' `familyset` are included (or subtracted).
#'
#' @return A matrix with Vuong test scores in the first and Clarke test scores
#' in the second row. Column names correspond to bivariate copula families (see
#' above).
#' @author Ulf Schepsmeier, Eike Brechmann, Natalia Belgorodski
#'
#' @seealso [BiCopGofTest()], [RVineVuongTest()],
#' [RVineClarkeTest()], [BiCopSelect()]
#'
#' @references Belgorodski, N. (2010) Selecting pair-copula families for
#' regular vines with application to the multivariate analysis of European
#' stock market indices Diploma thesis, Technische Universitaet Muenchen.
#' <https://mediatum.ub.tum.de/?id=1079284>.
#'
#' Clarke, K. A. (2007). A Simple Distribution-Free Test for Nonnested Model
#' Selection. Political Analysis, 15, 347-363.
#'
#' Vuong, Q. H. (1989). Ratio tests for model selection and non-nested
#' hypotheses. Econometrica 57 (2), 307-333.
#'
#' @examples
#' \dontshow{set.seed(123)}
#' # simulate from a t-copula
#' dat <- BiCopSim(500, 2, 0.7, 5)
#' \dontshow{dat <- dat[1:100, ]}
#'
#' # apply the test for families 1-6
#' BiCopVuongClarke(dat[,1], dat[,2], familyset = 1:6)
#'
BiCopVuongClarke <- function(u1, u2, familyset = NA, correction = FALSE, level = 0.05, rotations = TRUE) {

    ## preprocessing of arguments
    args <- preproc(c(as.list(environment()), call = match.call()),
                    check_u,
                    remove_nas,
                    check_nobs,
                    check_if_01,
                    prep_familyset,
                    check_fam_tau,
                    todo_fams,
                    na.txt = " Only complete observations are used.")
    list2env(args, environment())

    xy <- cbind(u1, u2)
    score.gof <- matrix(rep(NA, 2 * length(familyset)), nrow = 2)
    dimnames(score.gof) <- list(c("Vuong", "Clarke"), familyset)

    for (i in 1:length(familyset)) {
        temp <- vuong.clarke.sim(xy, familyset[i], familyset, correction, level)
        temp.vuong <- c()
        temp.clarke <- c()
        for (j in 1:length(temp$vuong)) {
            temp.vuong <- cbind(temp.vuong, t(temp$vuong[[j]]))
            dimnames(temp.vuong)[[2]][j] <- names(temp$vuong)[j]
            temp.clarke <- cbind(temp.clarke, t(temp$clarke[[j]]))
            dimnames(temp.clarke)[[2]][j] <- names(temp$clarke)[j]
        }
        score.temp <- rbind(score(temp.vuong[1, ]), score(temp.clarke[1, ]))
        score.gof[, i] <- score.temp
    }

    return(score.gof)
}


#########################################################################
# Functions of Natalia Djunushalieva for Vuong and Clarke test    	#
# (copula selection - goodness-of-fit)					#
# vuong.clarke.sim							#
# vuong.test								#
# clarke.test								#
# score									#
# gofVC			goodness-of-fit on the basis of Vuong and Clarke#
#########################################################################


#################################################################
# vuong.clarke.sim						#
#								#
# Input:							#
# xy		2-dim matrix of data				#
# cop.model1	character, copula on the left side		#
# cop.model2	vector of character, copula on the righ side	#
# Output:							#
# sim.result	Simulation of the models			#
#################################################################

vuong.clarke.sim <- function(xy, cop.model1, cop.model2, correction, level) {
    n <- dim(xy)[1]

    loglik.model1 <- my.loglik(xy, cop.model1)
    loglik.model2 <- data.frame(sapply(cop.model2, function(x) {
        my.loglik(fam = x, data = xy)
    }, USE.NAMES = TRUE))
    vuong.result.temp <- list()
    clarke.result.temp <- list()

    for (i in 1:length(cop.model2)) {
        p1 <- 1
        p2 <- 1


        if (cop.model1 == cop.model2[i]) {
            test.result <- data.frame(NA, NA, NA, NA)
            names(test.result) <- c("model", "nu", "p.value", "kurtosis")
            vuong.result.temp[[i]] <- test.result
            names(vuong.result.temp)[i] <- cop.model2[i]
            clarke.result.temp[[i]] <- test.result
            names(clarke.result.temp)[i] <- cop.model2[i]
        } else if (cop.model1 != cop.model2[i]) {
            if (cop.model1 %in% c(2, 7:10, 17:20, 27:30, 37:40,
                                  104, 114, 124, 134, 204, 214, 224, 234)) {
                p1 <- 2
            }
            if (cop.model2[i] %in% c(2, 7:10, 17:20, 27:30, 37:40,
                                     104, 114, 124, 134, 204, 214, 224, 234)) {
                p2 <- 2
            }

            vuong.result.temp[[i]] <- vuong.test(loglik.model1,
                                                 loglik.model2[, i],
                                                 alpha = level,
                                                 p1 = p1,
                                                 p2 = p2,
                                                 print.result = FALSE,
                                                 correction)
            names(vuong.result.temp)[i] <- cop.model2[i]
            clarke.result.temp[[i]] <- clarke.test(loglik.model1,
                                                   loglik.model2[, i],
                                                   alpha = level,
                                                   p1 = p1,
                                                   p2 = p2,
                                                   print.result = FALSE,
                                                   correction)
            names(clarke.result.temp)[i] <- cop.model2[i]
        }
    }
    sim.result <- list(vuong.result.temp, clarke.result.temp)
    names(sim.result) <- c("vuong", "clarke")
    return(sim.result)
}


#########################################
# my.loglik				#
#					#
# Input:				#
# data		2-dim matrix		#
# fam		copula family		#
# Output:				#
# loglik.temp	Log likelihood		#
#########################################

my.loglik <- function(data, fam) {
    T <- dim(data)[1]

    # Parameter sch?tzen
    par <- BiCopEst(data[, 1], data[, 2], fam)
    if (fam %in% c(2, 7:10, 17:20, 27:30, 37:40, 104, 114, 124, 134, 204, 214, 224, 234)) {
        theta <- par$par
        nu <- par$par2
    } else {
        theta <- par$par
        nu <- 0
    }

    loglik.temp <- rep(0, T)
    for (i in 1:T) {
        out <- .C("LL_mod2",
                  as.integer(fam),
                  as.integer(1),
                  as.double(data[i, 1]),
                  as.double(data[i, 2]),
                  as.double(theta),
                  as.double(nu),
                  as.double(0),
                  PACKAGE = "VineCopula")
        loglik.temp[i] <- out[[7]]
        if (loglik.temp[i] %in% c(NA, NaN, Inf))  loglik.temp[i] <- 1e+10
    }

    return(loglik.temp)
}




#################################################################
# vuong.test							#
#								#
# Input:							#
# loglik.model1	vector of log likelihood of the first model	#
# loglik.model1	vector of log likelihood of the second model	#
# alpha		alpha-level for p-value				#
# p1		number of parameters (model 1)			#
# p2		number of parameters (model 2)			#
# Output:							#
# Vuong test							#
#################################################################

vuong.test <- function(loglik.model1, loglik.model2, alpha = 0.05, p1 = 0, p2 = 0, print.result = TRUE, correction) {
    # cat('H0: model (1) is eqivalent to model (2)', '\n')

    # Calculate test statistic
    n <- length(loglik.model1)
    if (correction == FALSE) {
        m.i <- loglik.model1 - loglik.model2
    } else if (correction == "Akaike") {
        m.i <- loglik.model1 - loglik.model2 - (p1 - p2)/n
    } else if (correction == "Schwarz") {
        m.i <- loglik.model1 - loglik.model2 - (p1 - p2) * log(n)/(2 * n)
    }
    kurt.ratios <- kurtosis(loglik.model1 - loglik.model2)
    nu <- (sqrt(n) * mean(m.i))/(sqrt((n - 1)/n * var(m.i)))

    if (abs(nu) < qnorm(1 - alpha/2)) {
        decision <- "Decision: none of the models is favored."
        result <- 0
    }
    if (nu >= qnorm(1 - alpha/2)) {
        decision <- "Decision: favor model 1."
        result <- 1
    }
    if (nu <= -qnorm(1 - alpha/2)) {
        decision <- "Decision: favor model 2."
        result <- 2
    }
    # cat(decision,'\n')

    pvalue <- 2 * pnorm(-abs(nu))
    result <- data.frame(result,
                         round(nu, digits = 3),
                         round(pvalue, digits = 3),
                         round(kurt.ratios, digits = 3))
    names(result) <- c("model", "nu", "p.value", "kurtosis")

    if (print.result) print(result)

    return(result)
    rm(n, m.i, kurt.ratios, nu, pvalue, result, decision)
}

#################################################################
# clarke.test							#
#								#
# Input:							#
# loglik.model1	vector of log likelihood of the first model	#
# loglik.model1	vector of log likelihood of the second model	#
# alpha		alpha-level for p-value				#
# p1		number of parameters (model 1)			#
# p2		number of parameters (model 2)			#
# Output:							#
# Clarke test							#
#################################################################


clarke.test <- function(loglik.model1, loglik.model2, alpha = 0.05, p1 = 0, p2 = 0, print.result = TRUE, correction) {
    # cat('H0: model (1) is eqivalent to model (2)', '\n')

    # Calculate test statistic
    n <- length(loglik.model1)
    if (correction == FALSE) {
        m.i <- loglik.model1 - loglik.model2
    } else if (correction == "Akaike") {
        m.i <- loglik.model1 - loglik.model2 - (p1 - p2)/n
    } else if (correction == "Schwarz") {
        m.i <- loglik.model1 - loglik.model2 - (p1 - p2) * log(n)/(2 * n)
    }
    kurt.ratios <- kurtosis(loglik.model1 - loglik.model2)
    B <- sum(m.i > 0)

    # Calculate critical value
    decision <- "Decision: non of the models is favoured"
    result <- 0
    if (B >= n/2) {
        pvalue <- 2 * (1 - pbinom(B - 1, n, 0.5))
        if (pvalue <= alpha) {
            decision <- "Decision: favour model 1"
            result <- 1
        }
    }
    if (B < n/2) {
        pvalue <- 2 * (pbinom(B, n, 0.5))
        if (pvalue <= alpha) {
            decision <- "Decision: favour model 2"
            result <- 2
        }
    }
    # cat(decision,'\n')

    result <- data.frame(result,
                         round(B, digits = 3),
                         round(pvalue, digits = 3),
                         round(kurt.ratios, digits = 3))
    names(result) <- c("model", "B", "p.value", "kurtosis")

    if (print.result) print(result)

    return(result)
    rm(n, m.i, kurt.ratios, B, result, decision, pvalue)
}


#################################
# Score Funktion		#
#				#
# Input:			#
# dat		data matrix	#
# Output:			#
# score				#
#################################

score <- function(dat) {
    if (sum(is.na(dat)) != length(dat)) {
        yes <- sum(dat == 1, na.rm = TRUE)  # zaehle wieviel mal kommt yes vor
        no <- sum(dat == 2, na.rm = TRUE) * (-1)  # zaehle wieviel mal kommt no vor
        score.out <- yes + no
    }
    if (sum(is.na(dat)) == length(dat)) {
        score.out <- NA
    }
    return(score.out)
}



#########################
# kurtosis		#
#########################

kurtosis <- function(x) {
    x <- x[!is.na(x)]
    kurtosis <- sum((x - mean(x))^4/as.numeric(var(x))^2)/length(x)
    return(kurtosis)
}
