rankhospital <- function(state,outcome,num = "best"){
        
                ## Read outcome data
                Readdata <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
                mydata_origin <- subset(Readdata,State==state)
                if(nrow(mydata_origin)==0){
                        stop(print("invalid state"))
                }
                
                if (outcome == "heart attack"){
                        mydata_origin[,11] <- as.numeric(mydata_origin[,11])
                        NAs <- is.na(mydata_origin[,11])
                        mydata_origin_witoutNA <- mydata_origin[!NAs,]
                        dataordered <- mydata_origin_witoutNA[order(mydata_origin_witoutNA[,11],mydata_origin_witoutNA[,2]),]
                }
                
                else if (outcome == "heart failure"){
                        mydata_origin[,17] <- as.numeric(mydata_origin[,17])
                        NAs <- is.na(mydata_origin[,17])
                        mydata_origin_witoutNA <- mydata_origin[!NAs,]
                        dataordered <- mydata_origin_witoutNA[order(mydata_origin_witoutNA[,17],mydata_origin_witoutNA[,2]),]
                }
                
                else if (outcome == "pneumonia"){
                        mydata_origin[,23] <- as.numeric(mydata_origin[,23])
                        NAs <- is.na(mydata_origin[,23])
                        mydata_origin_witoutNA <- mydata_origin[!NAs,]
                        dataordered <- mydata_origin_witoutNA[order(mydata_origin_witoutNA[,23],mydata_origin_witoutNA[,2]),]
                }
                else {
                        stop(print("invalid outcome"))
                }
                
               
                
                if (num == "best"){
                        name <- dataordered[1,2]
                        return(name)
                } else if (num == "worst"){
                        name <- dataordered[nrow(dataordered),2]
                        return(name)
                }else if (num > nrow(dataordered)){
                        return(NA)
                }
                else
                {
                        name <- dataordered[num,2]
                        return(name)
                }
                
                

                }
