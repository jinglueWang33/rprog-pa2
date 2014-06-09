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
		
    pollutdata <- NULL
    resultdata <- NULL
    
		for (i in id) {
      
  		  if (nchar(as.character(i)) == 1) {
  		    filename <- paste(directory, "/00", i, ".csv", sep="")
  		  }else if (nchar(as.character(i)) == 2){
  		    filename <- paste(directory, "/0", i, ".csv", sep="")
  		  }else if (nchar(as.character(i)) == 3){
  		    filename <- paste(directory, "/", i, ".csv", sep="")
  		  }    
      
				pollutdata <- read.csv(filename, header=TRUE)
				
				validcnt = sum(!is.na(pollutdata$sulfate) & !is.na(pollutdata$nitrate))
        
        if (is.null(resultdata)){
            resultdata <- data.frame(id = i, nobs = validcnt)  
        }else {
					  resultdata <- rbind(resultdata, c(id = i, nobs = validcnt))
        }
		}
		
		resultdata
}