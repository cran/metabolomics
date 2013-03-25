\name{LinearModelFit}
\alias{LinearModelFit}
\title{Linear models}
\description{
    Fit a linear model to each metabolite in a metabolomics data matrix, optionally fitting ruv2 method to remove unwanted variation, 
    and compute t-statistics, F-statistic, and corresponding p-values. Either ordinary statistics or empirical Bayes statistics can be obtained.
}

\usage{
LinearModelFit(datamat, 
    factormat = NULL, covariatemat = NULL, contrastmat = NULL,
    ruv2 = TRUE, k = NULL, nc = NULL,
    moderated = FALSE, padjmethod = "BH", 
    saveoutput = FALSE, outputname = "results", ...)
}

\arguments{
    \item{datamat}{A numerical data matrix with samples in rows and metabolites in columns.}

    \item{factormat}{A matrix consisting of biological factors of interest.}
      
    \item{covariatemat}{A matrix consisting of optional covariates (or an intercept) to be included in the model.}

    \item{contrastmat}{An optional contrast matrix indicating which contrasts need to be tested to answer the biological question of interest.}

    \item{ruv2}{A logical indicating whether to use the \code{ruv2} method for removing unwanted variation.}
    
    \item{k}{If \code{ruv2=TRUE}, the number of unwanted variation factors to be included in the model.}
    
    \item{nc}{If \code{ruv2=TRUE}, a vector indicating which metabolites should be used as the non-changing metabolites in the model.}

    \item{moderated}{A logical indicating whether moderated statistics should be computed.}

    \item{padjmethod}{A character string specifying p value adjustment method for multiple comparisons. Must be one of "\code{bonferroni}", "\code{holm}" (Holm 1979), "\code{hochberg}" (Hochberg 1988), "\code{hommel}" (Hommel 1988), "\code{BH}" (Benjamini and Hochberg 1995), "\code{BY}" (Benjamini and Yekutieli 2001), or "\code{none}". The default method is set to "\code{BH}".}

    \item{saveoutput}{A logical indicating whether the normalised data matrix should be saved as a csv file.}

    \item{outputname}{The name of the output file if the output has to be saved.}

    \item{...}{further arguments to be passed to or from methods.}
}

\value{
    The result is an object of class \code{\link[limma:marraylm]{MArrayLM}}, containing t statistics, F statistics, corresponding adjusted and unadjusted p-values (De Livera \emph{et al}., 2012a, 2012b). 

    If \code{moderated=TRUE}, moderated statistics will be computed by empirical Bayes shrinkage of the standard errors towards a common value (Loennstedt \emph{et al}., 2002; Smyth 2004).
}

\seealso{\code{\link[limma]{eBayes}}, \code{\link{ContrastMatrix}}}

\author{Alysha M De Livera, Jairus B Bowne}

\references{
    Benjamini, Y.,  Hochberg, Y. (1995) Controlling the false discovery rate: a practical and powerful approach to multiple testing. \emph{Journal of the Royal Statistical Society. Series B (Methodological)} 57(1): 289-300.
    
    Benjamini, Y., Yekutieli, D. (2001) The Control of the False Discovery Rate in Multiple Testing under Dependency. \emph{The Annals of Statistics} 29(4): 1165-1188.
    
    De Livera, A. M., Dias, D. A., De Souza, D., Rupasinghe, T., Pyke, J., Tull, D., Roessner, U., McConville, M., Speed, T. P. (2012a) Normalising and integrating metabolomics data. \emph{Analytical Chemistry} 84(24): 10768-10776.
    
    De Livera, A.M., Olshansky, M., Speed, T. P. (2013) Statistical analysis of metabolomics data. \emph{Methods in Molecular Biology} In press.

    Gagnon-Bartsch, Johann A., Speed, T. P. (2012) Using control genes to correct for unwanted variation in microarray data. \emph{Biostatistics} 13(3): 539-552.
    
    Hochberg, Y. (1988) A sharper Bonferroni procedure for multiple tests of significance. \emph{Biometrika} 75(4): 800-802.
    
    Holm, S. (1979) A simple sequentially rejective multiple test procedure. \emph{Scandinavian Journal of Statistics} 6(2): 65-70.
    
    Hommel, G. (1988) A stagewise rejective multiple test procedure based on a modified Bonferroni test. \emph{Biometrika} 75(2): 383-386.
    
    Loennstedt, I., Speed, T. P. (2002) Replicated microarray data. \emph{Statistica Sinica} 12: 31-46.
    
    Smyth, G. K. (2004). Linear models and empirical Bayes methods for assessing differential expression in microarray experiments. \emph{Statistical Applications in Genetics and Molecular Biology} 3(1): 3.
}

\examples{
##A paired study

#Log transformed data
data(treated)
treated.log <- LogTransform(treated)$output 
#Separating by treatment group
treated.group<-factor(treated.log[,1],levels=unique(treated.log[,1]))
premat<-treated.log[which(treated.log[,1]=="pre"),-1]
postmat<-treated.log[which(treated.log[,1]=="post"),-1]

#Linear model fit with ordinary statistics 
ordFit<-LinearModelFit(datamat=data.matrix(postmat-premat),
                  ruv2=FALSE,
                  factormat=matrix(1,nrow=nrow(postmat)))
TwoGroupPlots(treated.log[,-1],
              tstats = ordFit$t[,1], 
              foldchanges =  ordFit$coef[,1], 
              pvalues =  ordFit$p.val[,1], 
              padjmethod = "BH",
              fcutoff = log(2), 
              pcutoff = 0.05)


#Compare with the TwoGroup function
TwoGrpComp<-TwoGroup(treated.log, paired = TRUE)
TwoGroupPlots(datamat=treated.log[,-1], 
              tstats = TwoGrpComp$output[, 1], 
              foldchanges = TwoGrpComp$output[, 4], 
              pvalues = TwoGrpComp$output[, 2],
              padjmethod = "BH",
              fcutoff = log(2),
              pcutoff = 0.05)

#Linear model fit with moderated statistics
modFit<-LinearModelFit(datamat=data.matrix(postmat-premat),
                       ruv2=FALSE,
                       moderated=TRUE,
                       factormat=matrix(1,nrow=nrow(postmat)))
TwoGroupPlots(treated.log[,-1],
              tstats = modFit$t[,1], 
              foldchanges =  modFit$coef[,1], 
              pvalues =  modFit$p.val[,1],
              padjmethod = "BH",
              fcutoff = log(2), 
              pcutoff = 0.05)
}
  
  