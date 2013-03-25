\name{LogTransform}
\alias{LogTransform}
\title{Log transformation}
\description{Log transform a metabolomics data matrix.}

\usage{
LogTransform(inputdata, base = exp(1),
    saveoutput = FALSE, outputname = "log.results")
}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}

    \item{base}{The base with respect to which logarithms are computed. The default computes the natural logarithm.}

    \item{saveoutput}{A logical indicating whether the output should be saved as a .csv file.}

    \item{outputname}{The name of the output file if the output has to be saved.}
}

\value{
    The result is an object of class \code{\link[metabolomics:metabdata]{metabdata}}. This is a list containing the following elements:
        \item{output}{A normalised data matrix in the input data format.}
        \item{samples}{A character string containing the names of the samples.}
        \item{groups}{A character string containing the names of the groups.}
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    log.data <- LogTransform(treated)$output
    log.data
}


