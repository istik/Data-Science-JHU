corr <- function(directory,threshold = 0){
        
        complete_table <- complete("specdata",1:332)
        
        nobs <- complete_table$nobs
        ids <- complete_table$id[nobs > threshold]
        id_len <- length(ids)
        corr_vector <- rep(0,id_len)
       
        a = list.files(directory)
        dir = paste("/Users/istiklinn/R/","specdata","/",a,sep="")  
        j <- 1
        for (i in ids) {
                monfile = read.csv(dir[i],header=T,sep=",")
                corr_vector[j] <- cor(monfile$sulfate,monfile$nitrate,use="complete.obs")
                j <- j+1
        }
        
        result <- corr_vector
        return(round(result,5))
        
}