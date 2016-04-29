#Week4 Quiz - notes!

#Q1
#Q2


#Q3
#merge注意需要merge的两个数据set的某一栏名字需要一样，才能用by=c("column_name")


# Q4
fiscal <- grepl("Fiscal year end",dt$Special.Notes)
june <- grepl("June",dt$Special.Notes)
table(fiscal,june)


#Q5
#index()  求数据的index
sum(sampleTimes>="2012-01-01" & sampleTimes<="2012-12-31")
sum(sampleTimes>="2012-01-01" & sampleTimes<="2012-12-31" & weekdays(sampleTimes)=="Lundi")