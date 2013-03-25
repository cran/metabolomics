\name{GroupSummary}
\alias{GroupSummary}
\title{Summary of the groups}
\description{
    Computes the mean, standard deviation, and coefficient of variation for each group in a data matrix.
}

\usage{GroupSummary(inputdata)}

\arguments{
    \item{inputdata}{A data frame in the input data format. See \code{\link{metabolomics}} for details.}
}

\value{A list containing:
    \item{means}{A matrix of means for each group.}
    
    \item{std}{A matrix of standard deviation for each group.}
    
    \item{cv}{A matrix of coefficient of variation for each group.}
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\examples{
    data(treated)
    treated.log <- LogTransform(treated)$output

    #Means of each metabolite in each group
    GroupSummary(treated.log)$means

    #Standard deviation of each metabolite in each group    
    GroupSummary(treated.log)$std
    
    #Coefficient of variation of each metabolite in each group
    GroupSummary(treated.log)$cv
}
