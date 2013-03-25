\name{Dendrogram}
\alias{Dendrogram}
\title{Hierarchical Cluster Analysis Dendrograms}
\description{Produces a dendrogram.}

\usage{
Dendrogram(inputdata, distmethod = "manhattan", aggmethod = "ward", 
    main = "Dendrogram", cex = 1, ...)
}

\arguments{
    \item{inputdata}{A data frame in the input data format. This should have sample names in the first column to be read as row names, group names in the second column, and the variables in the remaining columns. These variables can be metabolites, masses, retention times, bins, areas or any other metabolomics variables of interest.}
    
    \item{distmethod}{The distance measure to be used. This must be one of "\code{euclidean}", "\code{maximum}", "\code{manhattan}", "\code{canberra}", "\code{binary}" or "\code{minkowski}".}
    
    \item{aggmethod}{The agglomeration method to be used. This should be one of "\code{ward}", "\code{single}", "\code{complete}", "\code{average}", "\code{mcquitty}",  "\code{median}" or "\code{centroid}".}
    
    \item{main}{Plot title.}
    
    \item{cex}{A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default.}
    
    \item{...}{Arguments to be passed on to other methods.}
}

\value{A dendrogram plot.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\seealso{\code{\link[stats]{dist}}, \code{\link[stats]{hclust}}.}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output
    Dendrogram(treated.log)
}
