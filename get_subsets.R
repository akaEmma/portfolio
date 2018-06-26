########################################
#                                      #
#       get_inputs()                   #
#       get_dems()                     #
#       get_atts()                     #
#       get_crysts()                   #
#                                      #
# b = this project's data frame        #
#--------------------------------------#
# Return a subset of the data file that#
#   contains all the variables used to #
#   calculate scale variables. They are#
#   likert data.                       #
# Returns tibbles                      #
#--------------------------------------#
# assumes all var names are lowercase  #
########################################

library(dplyr)

#one_of() = Select columns names that are from a group of names (from dplyr)

#ignore warning about "professionalism." as it may be an artifact from someone's typo on a previous project. Other warnings, however, should be noted because they may flag a design change in the instrument used to collect these data. 
get_inputs <- function(b) {
        possible_inputs <- c("innovate", 
                             "opportun",
                             "experim",
                             "risktak",
                             "stable",
                             "predict",
                             "security",
                             "respect",
                             "fairness",
                             "toleranc",
                             "custvalue",
                             "custservice",
                             "custatcore",
                             "custfirst",
                             "custfocus",
                             "custorient",
                             "respectpeople", 
                             "freqcomm",
                             "valuedivpeop",
                             "valuedivthought",
                             "celebrate",
                             "dignity",
                             "commtoemp",
                             "empgrowth",
                             "ach_or",
                             "act_or",
                             "perform",
                             "results",
                             "precise",
                             "detail",
                             "analytic",
                             "team_or",
                             "collabor",
                             "aggress",
                             "compete",
                             "people",
                             "honesty",
                             "doingright",
                             "trustworthy",
                             "transp",
                             "opencomm",
                             "moral",
                             "ethical",
                             "integrity",
                             "collabwithin",
                             "collabacross",
                             "trustamong",
                             "teamworkwell",
                             "mutualtrust",
                             "teamspirit",
                             "coopwithin",
                             "coopacross",
                             "teamwork",
                             "resultfocus",
                             "cando",
                             "delivtop",
                             "professionalism",
                             "perfocus",
                             "getitdone",
                             "highachiev",
                             "highstandards",
                             "excelperf",
                             "professionalism.",
                             "urgency",
                             "workpassion",
                             "competitiveness",
                             "passionwin",
                             "ambitious",
                             "willtowin",
                             "playtowin",
                             "conceivedrisk",
                             "creativity",
                             "newwaytothink",
                             "newideas",
                             "movequickly",
                             "entrepspirit",
                             "innovativeness",
                             "practical",
                             "pragmatic",
                             "downtoearth",
                             "disciplined",
                             "frugal",
                             "thrifty",
                             "cheerful",
                             "enthus",
                             "irritate",
                             "frustrat",
                             "anger",
                             "envy",
                             "affectio",
                             "fear",
                             "anxiety",
                             "caring",
                             "warmth",
                             "kindness",
                             "empathy",
                             "beingcritical",
                             "indifference",
                             "annoy",
                             "jealous",
                             "nervous",
                             "tender",
                             "happy",
                             "grumpy",
                             "scared",
                             "compass",
                             "joy",
                             "excite",
                             "optimism",
                             "energetic",
                             "loneliness",
                             "alienation",
                             "alertness",
                             "friendliness")
        select(b, one_of(possible_inputs))
}

get_crysts <- function(b) {
        possible_crysts <- c("tmt1",
                             "valcryst2",
                             "valint1",
                             "tmt2",
                             "valcryst1",
                             "valint2",
                             "tmt",
                             "crystal")
        select(b, one_of(possible_crysts))
}


#ignore warnings as they are simply demographic variables that were not
# included in this dataset.

get_dems <- function(b) {
        possible_dems <- c("sex", 
                           "participan",
                           "tenurco",
                           "noemployee",
                           "industry",
                           "orgtype", 
                           "othercomp",
                           "country",
                           "banktype",
                           "geography",
                           "unitstaff",
                           "agerange",
                           "age",
                           "corphq",
                           "copmany",
                           "tenure",
                           "ind",
                           "region",
                           "industrytype",
                           "tenurdr",
                           "unosregion",
                           "functional",
                           "leadership",
                           "headquarterslocation",
                           "banktypeold",
                           "partname",
                           "orglevel",
                           "companyname",
                           "company2",
                           "survbefore",
                           "survbe4",
                           "tenurfunc",
                           "surveyprior",
                           "busunit",
                           "name",
                           "yrsexper",
                           "bunit",
                           "coname",
                           "prevco",
                           "orglevel",
                           "thisindustry",
                           "location_old",
                           "function_old",
                           "function",
                           "bunit_old",
                           "banktype_text",
                           "race",
                           "fulltime",
                           "state",
                           "usa",
                           "military",
                           "tenurerole",
                           "pharmacomp",
                           "openenroll",
                           "ethnicity",
                           "tenurdivbu",
                           "reports",
                           "location")
        select(b, one_of(possible_dems))
}

get_atts <- function(b) {
        possible_atts <- c("satorgcult",
                           "satjob",
                           "accountability",
                           "commitorg",
                           "satbufunc",
                           "satbufunc")
        select(b, one_of(possible_atts))
}
