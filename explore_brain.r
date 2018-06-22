#Code developed by Sheila Braun, June 2018.  
#These functions are for my personal use to load, print, and generally explore some brain images. They have not been 
#       properly generalized, but if I end up using them a lot I will make the necessary changes. 
# I have not broken the functions into separate files because I wanted to upload them here in a single file for easy reading.

# The data: DICOM image files. Detailed explanations of these data types are provided in the Section 6.2 (part 5) of the DICOM standard
#       (http://medical.nema.org). 
# If you want to try this code, download some .dcm image files from https://www.dicomlibrary.com/ and set "pname" to your data dir.
# You will need to make sure your naming conventions are the same as mine, because, as I said, this code is not generalized for
#       anybody's use but mine. 

#Packages and libraries

require("oro.dicom")
require("oro.nifti")
library(oro.nifti)
library(oro.dicom)

#pname = "your pname here" will be needed in most of these functions. 
#In my personal copy of this code I have set it to be where I keep the .dcm data files. 

##FUNCTIONS##

##############
             #
#Read in an image that represents a single slice of a brain.
#This function assumes a specific file naming convention common to .dcm files. 
#       For instance, my files have names like "IM-001-0011.dcm" or "IM-001-0009.dcm".
#This function also assumes that the file is of DICOM format.
# "pname" is the pathname to the .dcm files. 
# "n" is the number of the dcm file.  
#       If you pass n = 11 to this function, it will look for "IM-001-0011.dcm". 
#       If you pass it n = 9, it will look for "IM-001-0009.dcm".
#       "n" can be either numeric or string.
#               

get_dslice <- function(pname, n) {
        fname = paste("IM-0001-00", n, ".dcm", sep = "")
        pfname = (paste(pname, fname, sep = ""))
        myslice= readDICOM(pfname)
        return(myslice)
}
               #
################


#################
                #
# Now look at the image the data structure above represents.
#Steps used to see the image include transposing it (because it is a matrix) and using the image() function. 

#Parameters:    
#       - "1:d[1]" means take all the rows    
#       - "1:d[2]" means take all the columns    
#       - t() transposes the image. 
# Pass myslice, which is what is returned by the get_dslice() function above.

prt_dslice <- function(myslice) {
        d = dim(t(myslice$img[[1]]))
        image(1:d[1], 1:d[2], t(myslice$img[[1]]), col = gray(0:64/64))
}
               #
################


################
               #
# Now mess about looking for the most interesting image.

# This function reads multiple slice files from the input pathname.
# range beginning and end may be numbers or strings.
# This function assumes that file names follow the naming convention as shown in the function get_dslice() above.
# There are only 22 images in my directory, and that will commonly be the case for other people because
#       it is currently the convention to have 22 MRI DICOM images to show one brain. 

see_slices <- function(pname, range_beg, range_end) {
        try((0 < as.numeric(range_beg) &&  as.numeric(range_end) < 23), 
            TRUE)       #quit if num outside range
        for(i in as.numeric(range_beg):as.numeric(range_end)) {
                if(nchar(i) == 1){ #check each file in the range
                        p = paste("0", as.character(i), sep = "")
                }
                else {
                        p = as.character(i)
                }
                myslice <- get_dslice(pname, p)
                prt_dslice(myslice)
        } 
}
                  #
###################

##MAIN CODE##

#get a slice into memory
#first check if it is already in memory to save loading time if possible. 
if(!exists("myslice")) {
        myslice = get_dslice(pname, 11)
}

#look at the slice
class(myslice)
names(myslice)

# Look more deeply into the file structure:

str(myslice)
class(myslice$hdr[[1]])
class(myslice$img)
class(myslice$img[[1]])
dim(myslice$img[[1]])
names(myslice$hdr[[1]])
str(myslice$hdr[[1]])

# print the slice
prt_dslice(myslice)

# get and print multiple slices to see where the interesting imagery is. 
# for instance, my data has a brain lesion somewhere between images 9 and 12.
# I load and print them all so I can scroll through the images.

see_slices(9, 12)

## End of Program ##
