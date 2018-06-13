# functions for my personal use to load, print, and generally explore some brain images.
# not broken into separate files so it's easier to upload the set.

require("oro.dicom")
require("oro.nifti")
library(oro.nifti)
library(oro.dicom)


#Read in an image that represents a single slice of a brain.
#It assumes a specific file naming convention and it assumes that the file is of DICOM format.

get_dslice <- function(pname, string_num) {
        fname = paste("IM-0001-00", string_num, ".dcm", sep = "")
        pfname = (paste(pname, fname, sep = ""))
        myslice= readDICOM(pfname)
        return(myslice)
}

pname = "your pname here"
#get a slice into memory
if(!exists("myslice")) {
        myslice = get_dslice(pname, 11)
}

#look at it
class(myslice)
names(myslice)

# Looking more deeply into the file structure:

str(myslice)
class(myslice$hdr[[1]])
class(myslice$img)
class(myslice$img[[1]])
dim(myslice$img[[1]])
names(myslice$hdr[[1]])
str(myslice$hdr[[1]])

# Now look at the image the data structure above represents.
#Steps used to see the image include transposing it (because it is a matrix) and using the image() function. 

#Parameters:    
#        - "1:d[1]" means take all the rows    
#       - "1:d[2]" means take ll the columns    
#       - t() transposes the image. 

prt_dslice <- function(myslice) {
        d = dim(t(myslice$img[[1]]))
        image(1:d[1], 1:d[2], t(myslice$img[[1]]), col = gray(0:64/64))
}
prt_dslice(myslice)

# Now mess about looking for the most interesting image.

# This function reads multiple slice files from the default directory.
# range beginning and end may be numbers or strings.
# Assumes files are in a the working directory and that file names follow a specific naming convenstion, as shown in the function.

see_slices <- function(pname, range_beg, range_end) {
        try((0 < as.numeric(range_beg) &&  as.numeric(range_end) < 23), 
            TRUE)       #quit if num outside range
        for(i in as.numeric(range_beg):as.numeric(range_end)) {
                if(nchar(i) == 1){ #check each file in the range
                        p = paste("0", as.character(i), 
                                  sep = "")
                }
                else {
                        p = as.character(i)
                }
                myslice <- get_dslice(pname, p)
                prt_dslice(myslice)
        } 
}
see_slices(9, 12)