\name{ContrastMatrix}
\alias{ContrastMatrix}
\title{Contrast matrix}
\description{Generates a contrast matrix with specified contrasts.}

\usage{ContrastMatrix(contrasts, levels)}

\arguments{
    \item{contrasts}{A character vector with specified contrasts.}
    
    \item{levels}{A character vector or a factor with levels in the design matrix.}
}

\value{A contrast matrix.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\seealso{\code{\link[limma]{makeContrasts}}.}

\examples{
    ContrastMatrix(contrasts = c("A-B", "B-C"), levels = c("A", "B", "C", "D"))
}
