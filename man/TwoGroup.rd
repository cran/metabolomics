\name{TwoGroup}
\alias{TwoGroup}
\title{Comparing two biological conditions in a metabolomics data matrix}
\description{This function computes fold changes, t statistics, p-values, and 
adjusted p-values for each metabolite given a series of replicates and two biological conditions. }

\usage{
TwoGroup(inputdata, alternative = "two.sided", paired = FALSE, 
    padjmethod = "BH", saveoutput = FALSE, outputname = "results", ...)
}

\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{alternative}{ A character string specifying the alternative hypothesis for the t tests. This should be one of "\code{two.sided}", "\code{greater}" or "\code{less}". The default is set to "\code{two.sided}".}
    
    \item{paired}{A logical indicating whether the t-test should be paired 
    or not. The default is set to "\code{FALSE}".}
    
    \item{padjmethod}{A character string specifying p-value adjustment method for multiple comparisons. Must be one of "\code{bonferroni}", "\code{holm}" (Holm 1979), "\code{hochberg}" (Hochberg 1988), "\code{hommel}" (Hommel 1988), "\code{BH}" (Benjamini and Hochberg 1995), "\code{BY}" (Benjamini and Yekutieli 2001), or "\code{none}". The default method is set to "\code{BH}".}
    
    \item{saveoutput}{A logical indicating whether the output should be saved. 
    If TRUE the output will be saved as a .csv file.}
    
    \item{outputname}{The name of the output file if the output has to be 
    saved.}
    
    \item{...}{Further arguments to be passed to or from methods.}
}

\value{
    The result is an object of class "\code{\link[metabolomics:results]{results}}".
        \item{output}{A matrix with t statistics, p-values, adjusted p-values,  fold changes, and standard errors.}
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\references{
    Benjamini, Y., Hochberg, Y. (1995) Controlling the false discovery rate: a practical and powerful approach to multiple testing. \emph{Journal of the Royal Statistical Society. Series B (Methodological)} 57(1): 289-300.
    
    Benjamini, Y., Yekutieli, D. (2001) The Control of the False Discovery Rate in Multiple Testing under Dependency. \emph{The Annals of Statistics} 29(4): 1165-1188.
    
    Hochberg, Y. (1988) A sharper Bonferroni procedure for multiple tests of significance. \emph{Biometrika} 75(4): 800-802.
    
    Holm, S. (1979) A simple sequentially rejective multiple test procedure. \emph{Scandinavian Journal of Statistics} 6(2): 65-70.
    
    Hommel, G. (1988) A stagewise rejective multiple test procedure based on a modified Bonferroni test. \emph{Biometrika} 75(2): 383-386.
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output 
    TwoGroup(treated.log, paired = TRUE,
        saveoutput = TRUE, outputname = "results")
}
