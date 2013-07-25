\name{MetBoxPlots}
\alias{MetBoxPlots}
\title{Box plots of a specified metabolite across groups}
\description{Produces box plots of a specified metabolite across groups.}

\usage{
MetBoxPlots(inputdata, metname, cols = NULL, 
    main = NULL, cex.main = NULL, ...)
}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{metname}{A character string with the name of the metabolite.}
    
    \item{cols}{A character string indicating colours for the groups.}
    
    \item{main}{A title for the plot.}
    
    \item{cex.main}{Magnification of title relative to \code{par()$cex}.}
    
    \item{...}{Other graphical parameters. See \code{\link[graphics]{par}}.}
}

\value{Returns box plots of a specified metabolite across groups.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log<-LogTransform(treated)$output
    dev.new()
    MetBoxPlots(treated.log, "Suberate", col = c("blue", "red"),
        main = "Suberate")
}


