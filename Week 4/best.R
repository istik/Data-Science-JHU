best <- function(state,outcome){
        ## Read outcome data
        Readdata <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        mydata_origin <- subset(Readdata,State==state)
        if(nrow(mydata_origin)==0){
                stop(print("invalid state"))
        }
        
        if (outcome == "heart attack"){
                mydata_origin[,11] <- as.numeric(mydata_origin[,11])
                location <- which(mydata_origin[,11] == min(mydata_origin[,11], na.rm=TRUE))
        }
                
        else if (outcome == "heart failure"){
                mydata_origin[,17] <- as.numeric(mydata_origin[,17])
                location <- which(mydata_origin[,17] == min(mydata_origin[,17], na.rm=TRUE))
        }
        
        else if (outcome == "pneumonia"){
                mydata_origin[,23] <- as.numeric(mydata_origin[,23])
                location <- which(mydata_origin[,23] == min(mydata_origin[,23], na.rm=TRUE))
        }
        else {
                stop(print("invalid outcome"))
                
        }
        
        
        name <- mydata_origin[location,2]
        return(name)
}