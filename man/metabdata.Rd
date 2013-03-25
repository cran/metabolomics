\name{metabdata-class}
\docType{class}
\alias{metabdata-class}
\title{Metabolomic data - class}
\description{Container for output produced by the \code{\link{LogTransform}}, \code{\link{MissingValues}} and \code{\link{Normalise}} functions in the \code{\link{metabolomics}} package.}

\section{Slots/Components}{
    This object class is a list structure that has:
    \describe{
        \item{\code{output}}{The data matrix that is produced by the function.}
        \item{\code{samples}}{The names of the samples (the row names of the input data).}
        \item{\code{groups}}{The groups in the input data.}
    }
    The input data format is specified in \code{\link{metabolomics}}.
}

\author{Alysha M De Livera, Jairus B Bowne}

\examples{
    data(treated)
    log.treated <- LogTransform(treated)
    names(log.treated)
}
