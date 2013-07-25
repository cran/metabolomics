\name{MmsPlot}
\alias{MmsPlot}
\title{Mean, Median, Standard deviation plot}
\description{
    Produces a plot showing the mean, median and standard deviation of samples or metabolites.}

\usage{
MmsPlot(inputdata, variables = c("samples", "metabolites"), refvec = NULL, 
    main = "Mean, Median and Standard Deviation", ...)
}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{variables}{A character string indicating whether the samples or the metabolites should be plotted.}
    
    \item{refvec}{A vector of reference values to be plotted, such as an internal standard or sample weights.}
    
    \item{main}{A title for the plot.}
    
    \item{...}{Other graphical parameters. See \code{\link[graphics]{par}}.}
}

\value{
    A plot showing the mean, median and standard deviation of samples or metabolites and an object of class \code{\link[metabolomics:results]{results}}.
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log<-LogTransform(treated)$output 
    MmsPlot(treated.log)
    MmsPlot(treated.log, refvec = treated.log[, 2])
}

