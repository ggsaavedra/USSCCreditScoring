

setwd("/Users/maggie/Dropbox/MD's Data Science Team/USSC")
library(data.table)
library(bit64)

usscBranch <- as.data.frame(fread('Data/BRHBRACOD.csv'))
nrow(usscBranch)
View(usscBranch[1:100,])
length(unique(usscBranch$BRANCH_CODE))
summary(usscBranch)

usscTransaction <- as.data.frame(fread('Data/BRHTRANSH.csv')) # Read 4320685 rows and 19 (of 19) columns from 0.515 GB file in 00:00:24
nrow(usscTransaction)
View(usscTransaction[1:100,])
tail(usscTransaction)
length(unique(usscTransaction$PANALOKARD_NO))
summary(usscTransaction)

usscLYCM <- as.data.frame(fread('Data/LYCM.csv'))
nrow(usscLYCM)
View(usscLYCM)
length(unique(usscLYCM$PanaloKardNo))
summary(usscLYCM)

usscPARTRANCD <- as.data.frame(fread('Data/PARTRANCD.csv'))
nrow(usscPARTRANCD)
View(usscPARTRANCD)
summary(usscPARTRANCD)

usscPARUSERSP <- as.data.frame(fread('Data/PARUSERSP.csv'))
nrow(usscPARUSERSP)
View(usscPARUSERSP)
summary(usscPARUSERSP)


### Time Series
library(xts)
dates <- as.Date(strptime(usscTransaction$TRAN_DATE, '%Y%m%d'))
amount <- usscTransaction$AMOUNT
df <- as.data.frame(cbind(Date = as.character(dates), Amount = amount))
df.order <- df[order(df$Date),]


df.agg <- aggregate(as.numeric(df$Amount), by = list(df$Date), FUN = sum)

usscTS <- xts(x = df.agg$x, order.by = as.Date(df.agg$Group.1))
ts.zoo <- as.zoo(usscTS)
tsRainbow <- rainbow(ncol(ts.zoo))
plot(x = ts.zoo, ylab = "Daily Cumulative Returns", main = "Daily Cumulative Returns",
     col = tsRainbow, screens = 1)

usscTS.sub <- usscTS['20160801/20161130']
ts.zoo <- as.zoo(usscTS.sub)
tsRainbow <- rainbow(ncol(ts.zoo))
plot(x = ts.zoo, ylab = "Daily Cumulative Returns", main = "Daily Cumulative Returns",
     col = tsRainbow, screens = 1)

library(dygraphs)
dygraph(usscTS.sub, main = 'Daily Cumulative Returns', xlab = 'Date') %>%
  dyHighlight(highlightCircleSize = 10)


## tables
table(usscTransaction$CURRENCY_CODE)
table(usscTransaction$CHANNEL_TYPE)
