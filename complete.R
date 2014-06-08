complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
		
		for (i in id) {
				pollutdata <- read.csv(directory + as.character(i) + ".csv", header=TRUE)
				
				nobs = count(pollutdata[!is.na(pollutdata$sulfate) && !is.na(pollutdata$nitrate)])
				
				resultdata <- resultdata.attach(id = i, nobs = nobs)				
		}
		
		resultdata
}