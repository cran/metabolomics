\name{TwoGroupPlots}
\alias{TwoGroupPlots}
\title{Plots of differential metabolites}
\description{Produces plots for visualising differential metabolites.}

\usage{
    TwoGroupPlots(datamat, tstats, foldchanges, pvalues, 
    padjmethod = "BH", fcutoff = log(2), pcutoff = 0.05, cexval = 0.7)
}

\arguments{
    \item{datamat}{A numerical data matrix with samples in rows and metabolites in columns}
    
    \item{tstats}{A vector of t statistics.}
    
    \item{foldchanges}{A vector of fold changes.}
    
    \item{pvalues}{A vector of corresponding p-values.}
    
    \item{padjmethod}{A character string specifying p-value adjustment method for multiple comparisons. Must be one of "\code{bonferroni}", "\code{holm}" (Holm 1979), "\code{hochberg}" (Hochberg 1988), "\code{hommel}" (Hommel 1988), "\code{BH}" (Benjamini and Hochberg 1995), "\code{BY}" (Benjamini and Yekutieli 2001), or "\code{none}". The default method is set to "\code{BH}".}
    
    \item{fcutoff}{A numeric indicating the fold change cut off. The default 
    is set to 2.}
    
    \item{pcutoff}{A numeric indicating the adjusted p-value cut off. The 
    default is set to 0.05.}
    
    \item{cexval}{The font size of the text labels.}
}

\value{A list containing:
    \item{IncreasedMets}{Names of increased metabolites.}
    \item{DecreasedMets}{Names of decreased metabolites.}
    \item{DifferentialMets}{Names of all differential metabolites.}
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
    results <- TwoGroup(treated.log, paired = TRUE)$output
    TwoGroupPlots(treated.log[,-1], tstats = results[, 1], 
        foldchanges = results[, 4], pvalues = results[, 2], padjmethod = "BH",
        fcutoff = log(2), pcutoff = 0.05)
}
