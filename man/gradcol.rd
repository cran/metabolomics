\name{gradcol}
\alias{gradcol}
\title{Colour gradient generator for plotting}
\description{Creates a vector of colours for use with plotting functions.}

\usage{
gradcol(n, low.col="purple", high.col="green", 
    via=c("black", "white"))
}

\arguments{
    \item{n}{The number of colours required.}
    
    \item{low.col}{The initial colour for the gradient. This can either be a colour name (as listed b \code{\link[grDevices]{colours}}()), a hexadecimal value of the form "\code{#rrggbb}", or an integer (see \code{\link[grDevices]{col2rgb}} for details).}
    
    \item{high.col}{The final colour for the gradient.}
    
    \item{via}{The central colour, either "\code{black}" or "\code{white}".}
}

\value{
    Returns a list of \code{n} hexadecimal strings of the form "\code{#rrggbb}".
}

\author{
    Alysha M De Livera, Jairus B Bowne
}

\seealso{\code{\link[grDevices]{col2rgb}}, \code{\link[grDevices]{colours}}, \code{\link[grDevices]{palette}}.}

\examples{
    # Colour gradient from purple to green by name
    cols <- gradcol(1000, low.col = "purple", high.col = "green")
    image(cbind(1:1000), col = cols, axes = FALSE)

    # Colour gradient from red to blue via white by hexadecimal value
    cols <- gradcol(25, low.col = "#ff0000", high.col = "#0000ff", 
        via = "white")
    pie(rep(1,25), toupper(cols), col=cols)
}
