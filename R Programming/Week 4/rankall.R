rankall <- function(outcome,num = "best"){
       
        Readdata <- read.csv("outcome-of-care-measures.csv",colClasses = "character")

        state <- levels(factor(Readdata[,7]))
        hospital <- vector(mode="character")
        
        for (i in seq(state)){
                hospital[i] <- rankhospital(state[i],outcome,num)
        }
        
        data.frame(hospital,state)
        
}