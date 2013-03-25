\name{FoldChange}
\alias{FoldChange}
\title{Fold change}
\description{Computes fold change for each metabolite.}

\usage{
FoldChange(inputdata, paired = FALSE, plot.hist = TRUE, 
    saveoutput = FALSE, outputname = "fc.results")
}

\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{paired}{A logical indicating whether the data is paired.}
    
    \item{plot.hist}{A logical indicating whether a histogram of the fold changes should be plotted.}
    
    \item{saveoutput}{A logical indicating whether the output should be saved as a .csv file.}
    
    \item{outputname}{The name of the output file if the output has to be saved.}
}

\value{
    The output is a matrix with fold changes for each metabolite, and a histogram of the log2 fold changes.
}

\author{
    Alysha M De Livera, Jairus B Bowne
}
