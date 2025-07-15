#DATA PROCESSING


#IMPORTING LIBRARIES
library(rvest)
library(dplyr)

#IMPORTING DATASET
dset<-read.csv("00 CafeSales.csv")

#VIEW DATASET
View(dset)



#1.check for special character (gsub-global substitution)
dset$Item<-gsub("UNKNOWN","hot chocolate",dset$Item)
dset$Item<-gsub("ERROR","black forest",dset$Item)
dset$Item<-gsub(" ","falooda",dset$Item)
dset$Quantity<-gsub("ERROR","5",dset$Quantity)
dset$Quantity<-gsub("UNKNOWN","1",dset$Quantity)
dset$Price.Per.Unit<-gsub("UNKNOWN","3",dset$Price.Per.Unit)
dset$Price.Per.Unit<-gsub("ERROR","5",dset$Price.Per.Unit)
dset$Price.Per.Unit<-gsub("1.5","5",dset$Price.Per.Unit)
dset$Total.Spent<-gsub("UNKNOWN","9",dset$Total.Spent)

dset$Total.Spent<-gsub("ERROR","4",dset$Total.Spent)
dset$Total.Spent<-gsub("7.5","15",dset$Total.Spent)
dset$Total.Spent<-gsub("4.5","9",dset$Total.Spent)
dset$Total.Spent<-gsub("1.5","3",dset$Total.Spent)
dset$Payment.Method<-gsub("UNKNOWN","Credit Card",dset$Payment.Method)
dset$Payment.Method<-gsub("ERROR","Gpay",dset$Payment.Method)
dset$Location<-gsub("UNKNOWN","Takeaway",dset$Location)
dset$Location<-gsub("ERROR","In-Store",dset$Location)
dset$Transaction.Date<-gsub("ERROR","06/10/2023",dset$Transaction.Date)
dset$Transaction.Date<-gsub("UNKNOWN","04/12/2023",dset$Transaction.Date)
dset$Item[dset$Item == ""] <- "fresh juice"
dset$Location[dset$Location == ""] <- "Takeaway"
dset$Payment.Method[dset$Payment.Method == ""] <- "Cash"
dset$Transaction.Date[dset$Transaction.Date == ""] <- "06/04/2023"
View(dset)
#2.check whether all the variable are having right datatype
str(dset)
dataset$Transaction.ID<-as.character(dset$Transaction.ID)
dset$Item<-as.character(dset$Item)
dset$Quantity<-as.numeric(dset$Quantity)
dset$Price.Per.Unit<-as.numeric(dset$Price.Per.Unit)
dset$Total.Spent<-as.character(dset$Total.Spent)
dset$Payment.Method<-as.character(dset$Payment.Method)
dset$Location<-as.character(dset$Location)
dset$Transaction.Date<-as.character(dset$Transaction.Date)
#dataset$year<-as.numeric(dataset$years)
View(dset)
str(dset)
dset<-dset[c("Item","Location","Transaction.Date","Quantity","Price.Per.Unit","Transaction.ID","Total.Spent","Payment.Method")]
View(dset)
# replacing missing values
dset$Quantity=ifelse(is.na(dset$Quantity),ave(dset$Quantity,FUN=function(x)
  mean(x,na.rm=TRUE)),dataset$Quantity)
dset$Price.Per.Unit=ifelse(is.na(dset$Price.Per.Unit),ave(dset$Price.Per.Unit,FUN=function(x)
  mean(x,na.rm=TRUE)),dataset$Price.Per.Unit)
View(dset)
dset$Total.Spent <- dset$Total.Spent>20
View(dset)
str(dset)
dset$Total.Spent =as.factor(dset$Total.Spent) 
str(dset)
write.csv(dset,"starcafe.csv")
cafe=read.csv("starcafe.csv")
View(cafe)
