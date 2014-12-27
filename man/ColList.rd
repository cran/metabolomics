\name{ColList}
\alias{ColList}
\title{A list of colours for plots}
\description{
    Generates a list of colours for plots. This includes up to 15 colourblind-safe colours }
    

\usage{ColList(n)}

\arguments{
    \item{n}{The number of colours required.}
}

\value{A vector of characters with the names of the colours.}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\seealso{\code{RColorBrewer}.}

\examples{
    # Colour palette with colourblind-safe colours
    cols <- ColList(15)
    plot(1:15, 1:15, pch = 16, col = cols, cex = 2)

}
