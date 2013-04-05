\name{metabolomics-package}
\alias{metabolomics-package}
\alias{metabolomics}
\docType{package}
\title{metabolomics package}

\description{
    The metabolomics package is a collection of functions for the analysis of metabolomics data.
    
    Unless otherwise stated, the standard data input format is a data frame with sample names in the first column to be read as row names, group names in the second column, and the variables in the remaining columns (see below). These variables can be metabolites, masses, retention times, bins, areas or any other metabolomics variables of interest.
    
    \tabular{rrrrrrr}{
        Sample \tab Group \tab met1 \tab met2 \tab met3 \tab \ldots \tab metN \cr
        S1 \tab A \tab 0.6358 \tab 0.0851 \tab 0.3665 \tab \ldots \tab 1.0024 \cr
        S2 \tab A \tab 0.5871 \tab 0.0935 \tab 0.3421 \tab \ldots \tab 1.0329 \cr
        S3 \tab B \tab 0.6650 \tab 1.0705 \tab 0.6710 \tab \ldots \tab 0.7319 \cr
        S4 \tab B \tab 0.6907 \tab 1.0341 \tab 0.6858 \tab \ldots \tab 0.7376 \cr
    }
}

\details{
    \tabular{ll}{
        Package: \tab metabolomics \cr
        Type: \tab Package \cr
        Version: \tab 0.1.1 \cr
        Date: \tab 2013-04-05 \cr
        License: \tab GPL-3 \cr
        LazyLoad: \tab yes \cr
    }
}

\author{
    Alysha M De Livera, Jairus B Bowne
    
    Maintainer: Alysha M De Livera <alyshad@unimelb.edu.au>
}


