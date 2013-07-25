\name{Normalise}
\alias{Normalise}
\title{Normalisation}
\description{
    Normalise a metabolomic data matrix according to a specified method.
}

\usage{
Normalise(inputdata, 
    method = c("median","mean","sum","ref", "is", "nomis","ccmn", "ruv2"),
    refvec = NULL, ncomp = NULL, k = NULL, nc = NULL, 
    saveoutput = FALSE, outputname = NULL)
}
    
\arguments{
    \item{inputdata}{A log transformed data frame in the input data format. See \code{\link{metabolomics}} for details.}
    
    \item{method}{A character string indicating the required normalization method. Must be one of "\code{median}", "\code{mean}", "\code{sum}", "\code{ref}", "\code{is}", "\code{nomis}", "\code{ccmn}" or "\code{ruv2}". See Details for information.}
    
    \item{refvec}{A vector of internal standards to be used with the method "\code{is}", or a reference vector to be used with the method "\code{ref}".}
    
    \item{ncomp}{Number of PCA components to be used for the "\code{ccmn}" method. If \code{NULL}, this will be determined by cross validation as described by Redestig (2012).}
    
    \item{k}{Number of factors of unwanted variation to be included in the 
    "\code{ruv2}" model.}
    
    \item{nc}{A vector indicating which metabolites should be used as the 
    non-changing metabolites in the "\code{ruv2}" model, or as multiple internal
    standards in the "\code{ccmn}", "\code{nomis}" and "\code{ruv2}" methods.}
    
    \item{saveoutput}{A logical indicating whether the normalised data matrix should be saved as a .csv file.}
    
    \item{outputname}{The name of the output file if the output has to be saved.}
}

\details{
    The normalisation methods based on scaling include normalisation to a total sum, or by the median or mean of each sample, and are denoted by "\code{sum}", "\code{median}", and "\code{mean}" respectively. The method "\code{ref}" normalises the metabolite abundances to a specified reference vector.
    
    The normalisation methods based on internal or external standards include "\code{is}" which uses a single standard, Cross-contribution Compensating Multiple internal standard Normalisation, "\code{ccmn}" (Redestig \emph{et al}., 2009); normalization using optimal selection of multiple internal standards, "\code{nomis}" (Sysi-aho \emph{et al}. 2007); and "\code{ruv2}" (De Livera \emph{et al}.  2012a). 
    
    The Remove Unwanted Varitation "\code{ruv2}" method generates a matrix of unwanted variation using non-changing metabolites including any internal or external standards. This matrix of unwanted variation can then be used for identifying differentiallly abundant metabolites in the \code{\link{LinearModelFit}} function. The RUV2 method attempts to capture both observed and unobserved technical and biological variation (De Livera \emph{et al}. 2012a, Gagnon-Bartsch \emph{et al}. 2012). 
    
    An overview of these normalisation methods are given by De Livera \emph{et al}. (2012a, 2012b). Both the "\code{ruv2}" and "\code{ccmn}" methods use the factors of interest (groups), and therefore should not be used for those unsupervised methods where the groups must be treated as unknown.
}

\value{The result is an object of class \code{\link[metabolomics:metabdata]{metabdata}}. }

\seealso{\code{\link[crmn]{normFit}}.}

\author{Alysha M De Livera, Jairus B Bowne}

\references{
    De Livera, A. M., Dias, D. A., De Souza, D., Rupasinghe, T., Pyke, J., 
    Tull, D., Roessner, U., McConville, M., Speed, T. P. (2012a) Normalising 
    and integrating metabolomics data. \emph{Analytical Chemistry} 84(24): 1076-10776.
    
    De Livera, A.M., Olshansky, M., Speed, T. P. (2013) Statistical analysis 
    of metabolomics data. \emph{Methods in Molecular Biology} In press.
    
    Gagnon-Bartsch, Johann A., Speed, T. P. (2012) Using control genes to 
    correct for unwanted variation in microarray data. \emph{Biostatistics} 13(3):
    539-552.
    
    Redestig, H., Fukushima, A., Stenlund, H., Moritz, T., Arita, M., 
    Saito, K., Kusano, M. (2009) Compensation for systematic 
    cross-contribution improves normalization of mass spectrometry based
    metabolomics data. \emph{Analytical Chemistry} 81(19): 7974-7980.
    
    Sysi-Aho, M., Katajamaa, M., Yetukuri, L., Oresic, M. (2007) Normalization
    method for metabolomics data using optimal selection of multiple internal
    standards. \emph{BMC Bioinformatics} 8(1): 93.
}

\examples{
    ## Reading the data
    data(mix)
    Y <- log(exprs(mix))
    inputdata <- data.frame(pData(mix)$type, t(Y))
    batch <- pData(mix)$runorder
    nc <- which(with(fData(mix), tag == "IS")==TRUE)
    
    ## Normalise by the median
    norm_med <- Normalise(inputdata, method = "median")
    
    ## Normalise by an internal standard
    norm_is <- Normalise(inputdata, method = "is", 
        refvec=inputdata[, nc[1]])
    
    ## Normalise by a reference vector, in this case an internal standard
    norm_ref <- Normalise(inputdata, method = "ref", 
        refvec = inputdata[, nc[1]])
    
    ## Normalise by the sum
    norm_sum <- Normalise(inputdata, method = "sum")
    
    ## Normalise by the NOMIS method
    norm_nomis <- Normalise(inputdata, method = "nomis", nc = nc)
    
    ## Normalise by the CCMN method
    norm_ccmn <- Normalise(inputdata, method = "ccmn", nc = nc, ncomp = 2)

    ## Normalise using RUV2 method
    norm_ruv2 <- Normalise(inputdata, method = "ruv2", nc = nc, k = 9)

    ## Pca Plots of unwanted variation
    PcaPlots(data.frame(batch, norm_ruv2$output[, -1]), 
        main = "Unwanted batch variation")
}
