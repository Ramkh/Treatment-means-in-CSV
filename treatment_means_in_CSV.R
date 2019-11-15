temp<-read.table(file="clipboard", sep ="\t", header = T)
temp
names(temp)
str(temp)

calculate mean for each treatments

ranjana<- aggregate(X15.ºC ~ treat,data=temp,FUN=mean, na.rm = T)
ranjana1<- aggregate(X25.ºC ~ treat,data=temp,FUN=mean, na.rm = T)
ranjana2<- aggregate(X35.ºC ~ treat,data=temp,FUN=mean, na.rm = T)
ranjana3<- aggregate(X3.5_pH ~ treat,data=temp,FUN=mean, na.rm = T)
ranjana4<- aggregate(X8.5_ph ~ treat,data=temp,FUN=mean, na.rm = T)
#create list of dataframes
list.df <- list(ranjana, ranjana1, ranjana2, ranjana3, ranjana4)

#merge dfs on column "Name" and "Color"
combo.df <- Reduce(function(x,y) merge(x,y, by = c("treat"), all = TRUE, accumulate=FALSE, suffixes = c(".ranjana",".ranjana1", ".ranjana2", ".ranjana3", ".ranjana4")), list.df)
combo.df
write.csv(combo.df,'C:/Users/vijay/Documents\\MyData2.csv', row.names = FALSE)




merge(merge(merge(ranjana, ranjana2, by='id', all=T), ranjana3, by='treat', all=T)

DataX = merge(ranjana,ranjana1, fix.by = "treat")

Datay=merge(DataX, ranjana2, fix.by = "treat")
Dataz=merge(Datay, ranjana3, fix.by = "treat")
Dataa=merge(Dataz, ranjana4, fix.by = "treat")
write.csv(Dataa,'C:/Users/vijay/Documents\\MyData1.csv', row.names = FALSE)

