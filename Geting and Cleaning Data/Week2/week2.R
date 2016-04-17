
##Q1
answer <- c()
for (i in 1:length(repo_list)){
        repo <- repo_list[[i]]
        if (repo$name == "datasharing"){
                answer <- repo
                break()       
        }
}


##Q4
myurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- readLines(myurl)
nchar(html[c(10,20,30,100)])


##Q5
myurl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(myurl5,destfile = "./q5.for",method = "curl")
mydata5 <- read.fwf(file = "./q5.for", widths = c(15, 4, 1, 3, 5, 4), header = FALSE, sep = "\t",skip = 4)
##fwf是定长数据文件，widths参数根据其格式而设定
head(mydata5)
sum(mydata5$V6)
