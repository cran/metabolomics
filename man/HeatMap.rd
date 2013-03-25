\name{HeatMap}
\alias{HeatMap}
\title{Heat map}
\description{
    Produces a heat map of a metabolomics data matrix optionally clustered according to specified methods.
}

\usage{
HeatMap(inputdata, colramp = gradcol(75, "purple", "green"), 
    scale = c("row", "column", "none"), 
    dendrogram = c("column", "row", "both", "none"),
    distmethod = "euclidean", aggmethod = "complete", 
    margins = c(5, 5), key = TRUE, keysize = 1.5, 
    cexRow = 0.5, ColSideColors = NULL, ...)
}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{colramp}{Colours for the image.}
    
    \item{scale}{A character indicating if the values should be scaled metabolite-wise ("\code{row}") or group-wise ("\code{column}").}
    
    \item{dendrogram}{A character indicating whether to draw "\code{none}", "\code{row}", "\code{column}" or "\code{both}" dendrograms.}
    
    \item{distmethod}{The distance measure to be used. This must be one of "\code{euclidean}", "\code{maximum}", "\code{manhattan}", "\code{canberra}", "\code{binary}" or "\code{minkowski}".}
    
    \item{aggmethod}{The agglomeration method to be used. This should be one of "\code{ward}", "\code{single}", "\code{complete}", "\code{average}", "\code{mcquitty}", "\code{median}" or "\code{centroid}".}
    
    \item{margins}{A numeric vector of length 2 containing the margins for group and metabolite names, respectively.}
    
    \item{key}{A logical indicating whether a colour key must be drawn.}
    
    \item{keysize}{A numeric indicating the size of the key.}
    
    \item{cexRow}{A numeric indicating the size of the metabolite names.}
    
    \item{ColSideColors}{A character vector indicating the colours different groups.}

    \item{...}{Arguments to be passed on to other methods.}

}

\seealso{\code{\link[graphics]{par}}, \code{heatmap.2}.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output
    dev.new()
    HeatMap(treated.log, scale = "row", dendrogram = "col", colramp=gradcol(75, "red", "green"))
}
