\name{PcaPlots}
\alias{PcaPlots}
\title{PCA plots}
\description{Produces PCA plots.}

\usage{
PcaPlots(inputdata, y.axis = 1, x.axis = 2, center=TRUE, scale = TRUE, main = NULL,
    varplot = FALSE, multiplot = FALSE, n = 5, cols = NULL, ...)
}

\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{y.axis}{The principal component to be plotted on the \emph{y}-axis.}
    
    \item{x.axis}{The principal component to be plotted on the \emph{x}-axis.}

    \item{center}{A logical indicating whether the variables should be
    scaled to have zero mean.}
    
    \item{scale}{A logical indicating whether the variables should be
    scaled to have unit variance before the analysis takes place.}
    
    \item{main}{Plot title.}
    
    \item{varplot}{A logical indicating whether explained variance should be
    plotted.}
    
    \item{multiplot}{If \code{TRUE}, pairs plots of the first \emph{n} principal 
    components will be plotted.}
    
    \item{n}{The number of principal components to be plotted if 
    \code{multiplot=TRUE}. The default value is set to 5.}

    \item{cols}{A character string with colours to be used.}
        
    \item{...}{Arguments to be passed on to other methods.}
}

\seealso{\code{\link[stats]{prcomp}}.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output
    PcaPlots(treated.log, scale=FALSE, center=TRUE, multiplot = TRUE, varplot = TRUE)
}

