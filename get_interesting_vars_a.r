#########################################
#                                       
#       get_interesting_vars()          
#                                       
# tib = this project's tibble or data frame 
# irrelevant_v = vector of vars we don't need 
#
#-------------------------------------- 
# Add items to the irrelevant_v on a   
#   project-to-project basis. No need   
#   to delete any names.       
#########################################

get_interesting_vars <- function(tib, irrelevant_v) {

        #get a list of names excluding any member of the irrelevant set,
        #then subset tib by all except those names
        
        names.use <- names(tib)[!(names(tib) %in% irrelevant_v)]
        tib <- b[, names.use]
        
        # Now exclude any variable that begins with "x".
        # In this dataset, any such variable is an empty column
        # usually passed in from upstream at the end of the Excel csv.
        #
        # Using "-starts_with" returns all that don't start with x.
        #       None of our relevant vars begins with x. If that changes,
        #       this way of deleting the Xs will cause problems.
        #       However, it is still the best way because we don't know
        #       what the x's end with. They end with numbers, but we won't
        #       know what they are unless we look. This method is therefore
        #       the best (despite being imperfect) way to keep the code 
        #       generalizable.
        
        tib %>% dplyr:: select(-starts_with("x"))
}

#Example:
# irrelevant_v <- c("startdate", 
#                    "enddate", 
#                    "status", 
#                    "ipaddress",
#                    "progress", 
#                    "duration (in seconds)",
#                    "duration..in.seconds.",
#                    "finished",
#                    "recordeddate",
#                    "responseid", 
#                    "recipientlastname",
#                    "recipientfirstname", 
#                    "recipientemail",
#                    "externalreference", 
#                    "locationlatitude",
#                    "locationlongitude", 
#                    "distributionchannel",
#                    "userlanguage",
#                    "name")

#get_interesting_vars(tib, irrelevant_v)
