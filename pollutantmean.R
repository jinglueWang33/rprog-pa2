pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
		
		## string format????
		## read a lot of files at the same time????
		
		for (i in id) {
				pollutdata <- read.csv(directory + as.character(i) + ".csv", header=TRUE)
				pollutdata <- rbind(pollutdata, pollutdata)
		}
		
		if (pollutant == "sulfate") {				
				return mean(pollutant[!is.na(pollutant$sulfate)]$sulfate)
		}else if (pollutant == "nitrate") {
				return mean(pollutant[!is.na(pollutant$nitrate)]$nitrate)		
		}
		
}