\name{MissingValues}
\alias{MissingValues}
\title{Missing value replacement}
\description{Replaces missing values for large metabolomics data matrices.}

\usage{
MissingValues(inputdata, column.cutoff=NULL, group.cutoff = NULL,
    complete.matrix = FALSE, seed = 100, 
    saveoutput = FALSE, outputname = "missing.values.rep")
}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{column.cutoff}{A value between zero and one. If the proportion of missing values is equal to or more than the column.cutoff in all groups, that whole column will be deleted.}
    
    \item{group.cutoff}{A value between zero and one. If the proportion of missing values in a group is equal to or more than the group.cutoff, those missing values will be replaced by a random number between zero and the minimum of the entire matrix.}
    
    \item{complete.matrix}{A logical indicating whether a complete matrix is required. If \code{TRUE}, the remaining missing values (preferably only a very few) will be replaced by the average of the abundances in the rest of the group.}
    
    \item{seed}{An integer, denoting state for random number generation in R.}
    
    \item{saveoutput}{A logical indicating whether the output should be saved. If \code{TRUE}, the results will be saved as a csv file.}
    
    \item{outputname}{The name of the output file if the output has to be saved.}
}

\value{The output is an object of class \code{\link[metabolomics:metabdata]{metabdata}}.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    mat <- matrix(rnorm(50),
        nr = 5,
        dimnames = list(paste("s", 1:5, sep = ""), paste("m", 1:10, sep = "")))
    mat[, 5] <- NA
    mat[5, 7] <- NA
    inputdata <- data.frame(Group = rep("A", 5), mat)
    MissingValues(inputdata, group.cutoff = 0.7, column.cutoff = 0.8)$output
}
