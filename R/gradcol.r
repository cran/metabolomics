gradcol <- function(n, low.col="purple", high.col="green", 
    via=c("black", "white"))
{
    via <- match.arg(via)
    if (!is.element(via, c("black", "white"))) {
        via <- "black"
    }
    
    if (via == "black") {
        # Get scaling vector
        chlist <- seq(0,1,length.out=n/2)
        lv <- paste("#", 
            sprintf("%02x", as.hexmode(col2rgb(low.col)[1] * rev(chlist))),
            sprintf("%02x", as.hexmode(col2rgb(low.col)[2] * rev(chlist))),
            sprintf("%02x", as.hexmode(col2rgb(low.col)[3] * rev(chlist))), 
            sep=""
        )
        vh <- paste("#", 
            sprintf("%02x", as.hexmode(col2rgb(high.col)[1] * chlist)), 
            sprintf("%02x", as.hexmode(col2rgb(high.col)[2] * chlist)),
            sprintf("%02x", as.hexmode(col2rgb(high.col)[3] * chlist)), 
            sep=""
        )
    } else {
        chlist <- seq(0,1,length.out=n/2)
        lvls <- list()
        for (ii in 1:3) {
            cv <- col2rgb(low.col)[ii]
            cn <- rownames(col2rgb(low.col))[ii]
            if (cv == 0) {
                lvls[[cn]] <- c(chlist * 255)
            } else {
                lenval <- 255 - cv
                lvls[[cn]] <- c((chlist * lenval) + cv)
            }
        }
        hvls <- list()
        for (ii in 1:3) {
            cv <- col2rgb(high.col)[ii]
            cn <- rownames(col2rgb(high.col))[ii]
            if (cv == 0) {
                hvls[[cn]] <- c(chlist * 255)
            } else {
                lenval <- 255 - cv
                hvls[[cn]] <- c((chlist * lenval) + cv)
            }
        }
        
        lv <- paste("#", 
            sprintf("%02x", as.hexmode(lvls[["red"]])),
            sprintf("%02x", as.hexmode(lvls[["green"]])),
            sprintf("%02x", as.hexmode(lvls[["blue"]])), 
            sep=""
        )
        vh <- paste("#", 
            sprintf("%02x", as.hexmode(rev(hvls[["red"]]))), 
            sprintf("%02x", as.hexmode(rev(hvls[["green"]]))),
            sprintf("%02x", as.hexmode(rev(hvls[["blue"]]))), 
            sep=""
        )
    }
    
    col_gradient <- append(lv, vh)
    
    return(col_gradient)
}
