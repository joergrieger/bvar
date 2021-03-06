% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bvar.r
\name{bvar}
\alias{bvar}
\title{Estimate a bayesian vector autoregressive model.}
\usage{
bvar(mydata, priorObj, stabletest = FALSE, nreps = 15000,
  burnin = 5000, nthin = 1)
}
\arguments{
\item{mydata}{the time series used for estimating the VAR model}

\item{priorObj}{a S3-object containing information about the prior}

\item{stabletest}{logical, flag to test whether a draw is stable or not}

\item{nreps}{number of draws for the mcmc sampler}

\item{burnin}{number of burnin-draws}

\item{nthin}{thinning parameter}
}
\value{
returns an S3 object of the class "bvar" with the following fields

`general_info` list with general information about the model

`intercept` whether the model has an intercept or not

 `nolags` number of lags in the model

  `nreps` total number of draws

  `burnin` number of burn-in draws

  `nthin` the thinning parameter

  `data_info` information about the data

  `type` type of the data object (can be ts, xts or matrix)

  `var_names` variable names

  `mydata` the data itself

  `mcmc_draws` the draws from the mcmc algortithm

  `Alpha` an (K * p + Intercept) x K x (nreps - burnin) / nthin matrix with the draws for the VAR-coefficients. With K being the number of variables, p the number of lags and Intercept is 1 if the model has an intercept and 0 otherwise.

  `Sigma` an K x K x (nreps - burnin) / nthin - matrix with the draws of the Variance-Covariance matrix

  `additional_info` an array of length (nreps - burnin) / nthin of lists with any additional information returned by the posterior.
}
\description{
Estimate a bayesian vector autoregressive model.
}
\details{
This function is the main function to estimate a bayesian VAR model for the TxK series mydata. To estimate a bayesian VAR model to user first has to initialize a prior and select the parmameters for it and submit it to the bvar-function. Internally, bvar first initializes the mcmc-algorithm by calling the function initialize_mcmc then at every subsequent iteration calls the function draw_posterior using the results from the previous posterior draw and the variables Alpha and Sigma return posterior draws of the coefficients and the variance-covariance matrix respectively. All other results are stored in a list named addInfo.

It should be noted that the data submitted to the bvar function and the prior have to be the same. The logical parameter stabletest tells the function whether to check if a draw of coefficients is stable, i.e. if the largest eigenvalue of the companion matrix smaller than 1. Furthermore, the parameters nreps, burnin and nthin determine the number of mcmc-draws and the how many of the draws are retained. The number of retained draws is (nreps - burnin)/nthin.
}
\seealso{
\code{\link{msvar}} for regime switching models, \code{\link{tvar}} for threshold models and \code{\link{favar}} for factoraugmented models.
}
