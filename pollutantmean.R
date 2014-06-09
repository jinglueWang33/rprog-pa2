pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)f
		
		## string format????
		## read a lot of files at the same time????
		
    pollutdata <- NULL
    
		for (i in id) {
      
        if (nchar(as.character(i)) == 1) {
            filename <- paste(directory, "/00", i, ".csv", sep="")
        }else if (nchar(as.character(i)) == 2){
            filename <- paste(directory, "/0", i, ".csv", sep="")
        }else if (nchar(as.character(i)) == 3){
            filename <- paste(directory, "/", i, ".csv", sep="")
        }       
        
        
				newpollutdata <- read.csv(filename, header=TRUE)
        head(newpollutdata)
				pollutdata <- rbind(pollutdata, newpollutdata)
		}
		
    m <- 0
    
		if (pollutant == "sulfate") {				
				m <- mean(pollutdata$sulfate[!is.na(pollutdata$sulfate)])
		}else if (pollutant == "nitrate") {
				m <- mean(pollutdata$nitrate[!is.na(pollutdata$nitrate)])		
		}
    
    m
		
}