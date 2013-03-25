\name{RlaPlots}
\alias{RlaPlots}
\title{RLA plots}
\description{Produces within group and across group relative log abundance plots to visualise a metabolomics data matrix.}

\usage{
RlaPlots(inputdata, type = c("ag", "wg"), cols = NULL,
    cex.axis = 0.8, las = 2, ylim = c(-2, 2), oma = c(7, 4, 4, 2) + 0.1, ...)
}

\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}

    \item{type}{A character string indicating whether within group ("\code{wg}") or across group ("\code{ag}") RLA plots need to be plotted.}

    \item{cols}{A character string with colours to be used for the box plots.}

    \item{cex.axis}{The magnification to be used for \emph{x}- and \emph{y}-labels relative to the current setting of cex.}

    \item{las}{A numeric in {0, 1, 2, 3} denoting the style of axis labels.
    See \code{\link[graphics]{par}}.}

    \item{ylim}{A vector containing \emph{y}-axis limits.}

    \item{oma}{A vector giving the size of the outer margins.}

    \item{...}{Other graphical parameters. See \code{\link[graphics]{par}}.}
}

\details{
    Across group RLA plots is obtained by standardising the metabolites by removing the median from each metabolite across all groups. The boxplots of these scaled metabolites can be used to compare the behaviour of metabolites in the samples between groups.This gives a visual inspection of variation in the data across groups. 

    For within group RLA plots, each metabolite is scaled by removing the median within each group. Boxplots of these can be used to visualise the tightness of the replicates within groups, and should have a median close to zero and low variation around the median.

    See De Livera \emph{et al}. 2012a and 2012b for further details.
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\references{
    De Livera, A. M., Dias, D. A., De Souza, D., Rupasinghe, T., Pyke, J., 
    Tull, D., Roessner, U., McConville, M., Speed, T. P. (2012a) Normalising 
    and integrating metabolomics data. \emph{Analytical Chemistry} 84(24): 10768-10776.
    
    De Livera, A.M., Olshansky, M., Speed, T. P. (2012b) Statistical analysis 
    of metabolomics data. \emph{Methods in Molecular Biology} In press.
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output 
    
    #Across group RLA plot for comparing samples across groups
    RlaPlots(treated.log, ylim = c(-5, 5))
    
    #Within group RLA plot for comparing the replicates
    RlaPlots(treated.log, "wg", ylim = c(-3, 3), cols = c("green","purple"))
}
