\name{results-class}
\docType{class}
\alias{results-class}
\title{Metabolomic data results - class}
\description{The container for output from the \code{\link{MmsPlot}} and \code{\link{TwoGroup}} functions in the \code{\link{metabolomics}} package.}

\details{
    This object class is a list structure containing the output that is produced by the function.
}

\author{Alysha M De Livera, Jairus B Bowne}

\examples{
    data(treated)
    treated.twogroup <- TwoGroup(treated)
    names(treated.twogroup)
}