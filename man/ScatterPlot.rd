\name{ScatterPlot}
\alias{ScatterPlot}
\title{Scatter plot}
\description{Produces a scatter plot.}

\usage{
ScatterPlot(inputdata, y.axis, x.axis, ylab = y.axis, xlab = x.axis, ...)
}

\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{y.axis}{A character with the name of the metabolite to be plotted 
    on the \emph{y}-axis.}
    
    \item{x.axis}{A character with the name of the metabolite to be plotted 
    on the \emph{x}-axis.}
    
    \item{ylab}{\emph{y}-axis label.}
    
    \item{xlab}{\emph{x}-axis label.}
    
    \item{...}{Other graphical parameters. See \code{\link[graphics]{par}}.}
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    ScatterPlot(treated, "Suberate", "Succinate")
}
