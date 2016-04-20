##Week 3
##Q1

myurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dir.create("./data")
download.file(myurl,destfile = "./data/myfileweek3.csv",method = "curl")
mydata <- read.csv("./data/myfileweek3.csv")
mydf <- tbl_df(mydata)
myseletectedata <- select(mydf,ACR,AGS)
agricultureLogical <- myseletectedata$ACR==3 & myseletectedata$AGS==6
##or agricultureLogical <- with(myseletectedata, ACR == 3 & AGS ==6)

which(agricultureLogical)
##Ans:125,238,262

##Q2
library(jpeg)
myurl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(myurl2,"./data/week3pic.jpg",method = "curl")
mypic <- readJPEG("./data/week3pic.jpg",native = TRUE)
quantile(mypic,probs = c(0.3,0.8))
#Ans:-15259150 -10575416 

##Q3 and Q4
myurl31 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(myurl2,"./data/week3GDP.csv",method = "curl")
mydata31<- read.csv("./data/week3GDP.csv")
        
myurl32 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(myurl2,"./data/week3EDU.csv",method = "curl")
mydata32<- read.csv("./data/week3EDU.csv")

dtGDP <- data.table(mydata31)
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
dtEDU <- data.table(mydata32)
sum(!is.na(unique(dt$rankingGDP)))
dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, gdp)][13]

#Ans Q3:

dt[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]
##or
##mean(subset(dt, Income.Group %in% "High income: OECD", )$rankingGDP)
##mean(subset(dt, Income.Group %in% "High income: nonOECD",)$rankingGDP,na.rm=T)

#Ans Q4:

##Q5

library(Hmisc)
## Cut Ranks into 5 groups and store as factor variable
dt$Rank.Groups = cut2(dt$rankingGDP, g = 5)
## Build a table of Income Groups across Rank Groups
table(dt$Income.Group, dt$Rank.Groups)

