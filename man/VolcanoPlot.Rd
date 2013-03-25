\name{VolcanoPlot}
\alias{VolcanoPlot}
\title{Volcano plot}
\description{Produces a volcano plot given fold changes and p-values.}
\usage{  
    VolcanoPlot(folds, pvals, cexcutoff = 0.7, cexlab = 0.5, plimit = 0.05, 
    fclimit = 2, xlab = 'log2 Fold Change', ylab = '-log10 t-Test P-value',
    main = "Volcano Plot", ...) 
}

\arguments{
    \item{folds}{A vector of fold changes with metabolite names.}
    
    \item{pvals}{ A vector of corresponding p-values with metabolite names.}
    
    \item{cexcutoff}{Font size of the cut-off labels.}
    
    \item{cexlab}{Font size of the variable labels.}
    
    \item{plimit}{A numeric indicating the p value cutoff. The default is set 
    to 0.05.}
    
    \item{fclimit}{A numeric indicating the lower fold cutoff. The default is 
    set to 2.}
    
    \item{xlab}{\emph{x}-axis label.}
    
    \item{ylab}{\emph{y}-axis label}
    
    \item{main}{Plot title.}
    
    \item{...}{Other graphical parameters. See \code{\link[graphics]{par}}.}
}

\seealso{\code{\link{TwoGroup}}, \code{\link{TwoGroupPlots}}.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated, base = 2)$output
    results <- TwoGroup(treated.log)$output
    pval <- results[, 2]
    fc <- results[, 4]
    VolcanoPlot(fc, pval, cexlab = 0.8)
}
