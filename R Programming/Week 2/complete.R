complete <- function(directory,id=1:332){

                a = list.files(directory)
                
                dir = paste("/Users/istiklinn/R/","specdata","/",a[id],sep="")       
                
                complete_data <- c()
                
                for(i in 1:length(dir)){
                        
                        monfile = read.csv(dir[i],header=T,sep=",")
                        
                       complete_data[i] <- sum(complete.cases(monfile))
                }
                result <- data.frame(id=id,nobs=complete_data)
                return(result)
}