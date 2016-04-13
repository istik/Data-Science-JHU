pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        a = list.files(directory)
        
        dir = paste("/Users/istiklinn/R/","specdata","/",a[id],sep="")       
        
        mondata <- c()
        
        for(i in 1:length(dir)){

                monfile = read.csv(dir[i],header=T,sep=",")
                
                na_removed <- monfile[!is.na(monfile[, pollutant]), pollutant]
                
                mondata <- c(mondata,na_removed)
        }
        
        result <- mean(mondata)
        return(round(result, 3)) 
}

# tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281