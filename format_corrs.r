# Can send this function any rcorr() output and it will return a tibble 
# with an SPSS-style correlation matrix with r, p, and n lines alternating.
# #
#M the correlation output to be reformatted.
# returns a tibble containing the spss-style correlation matrix.


format_corrs <- function(M) {
        library(dplyr)
        irows <- tibble()
        cor_tbl <- tibble()
        i = 1
        for (i in 1:nrow(M$r)) {
                #create matrix of correlation output and format as tibble
                irows <- tbl_df(rbind(round(M$r[i, ], 2), # Pearson's r rounded
                                      round(M$P[i, ], 2),    # p-value rounded
                                      round(M$n[i, ], 0)))    # n rounded
                # add this correlation matrix to the overall one
                cor_tbl <- rbind(cor_tbl, irows)
        }
        
        #create the column for the variable names 
        rnms = NULL
        i = 1
        var_names <- names(cor_tbl)
        for (i in 1:length(var_names)) {
                rnms <- c(rnms, paste(var_names[i], "_r", sep = ""))
                rnms <- c(rnms, paste(var_names[i], "_P", sep = ""))
                rnms <- c(rnms, paste(var_names[i], "_n", sep = ""))
        }
        cor_tbl <- cbind(rnms, cor_tbl)
        as.tibble(cor_tbl)
}
