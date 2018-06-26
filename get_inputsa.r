########################################
#                                      
#       get_subset(tib, possible_vars)
#
# tib = a tibble or data.frame with 
# unwanted variables
# possible_vars = A vector of variables that
#   we want to keep if they're in the data.
# 
# NOTE: Currently we store the various variable lists 
# in the data section of the main file and
# make the same call for each subset we 
# want to build. NOTE TO SELF: Consider alternatives
# like storing the variable lists here or 
# reading them in automatically from the data 
# dictionary. 
# 
# That makes it easier for a non-programmer
# to make changes to those lists. They
# won't have to scroll through the code
# looking for the lists. 
#
#------------------------------------
#returns a tibble of the subset
# and a list of the names the function found.
########################################

library(dplyr)

#one_of() = Select columns names that are from a group of names (from dplyr)

#ignore warning about the variable "congressionalism." as it may be an artifact from someone's typo on a previous project. Other warnings, however, should be noted because they may flag a design change in the instrument used to collect these data. 


get_subset <- function(tib, possible_vars) {
        ss <- select(tib, one_of(possible_vars))
        tbl_df(c(ss, names(ss)))
}

# Example:
# possible_vars <- c("let", 
#                    "us",
#                    "gothen",
#                    "youandi",
#                    "whiletheevening",
#                    "isspread",
#                    "outagainst",
#                    "thesky",
#                    "likeapatient",
#                    "etherized",
#                    "upon",
#                    "a",
#                    "table")
# get_subset(tib, possible_vars)
