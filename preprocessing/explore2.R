setwd("Dropbox/MD's Data Science Team/USSC")
library(data.table)
trans <- as.data.frame(fread('Data/BRHTRANSH.csv'))
branch <- as.data.frame(fread('Data/BRHBRACOD.csv'))
points <- as.data.frame(fread('Data/LYCM.csv'))

newdf <- merge(x = trans, y = branch, by = 'BRANCH_CODE', all = TRUE)
newdf <- newdf[complete.cases(newdf),]
location <- strsplit(newdf$NAME, ' - ')
loc <- do.call(rbind, location)
names(loc) <- c('Province', 'City', 'loc')
newdf <- as.data.frame(cbind(newdf, loc))
newdf$freq <- rep(1, nrow(newdf))

Date  <- as.Date(strptime(newdf$TRAN_DATE, '%Y%m%d'))
Currency <- newdf$CURRENCY_CODE
frequency <- rep(1, nrow(newdf))
Amount <- newdf$AMOUNT
Channel <- newdf$CHANNEL_TYPE

subdf <- cbind(Date = as.character(Date), Currency, Amount = as.numeric(frequency))
subdf <-  as.data.frame(subdf)
subdf$Amount <- as.numeric(subdf$Amount)
aggdf <- aggregate(Amount~Date+Currency, data = subdf, FUN = sum, na.rm = TRUE)

library(reshape2)
library(reshape)
library(ggplot2)
aggdf1 <- subset(aggdf, Currency == 'PHP')
aggdf2 <- subset(aggdf, Currency == 'SGD')
aggdf3 <- subset(aggdf, Currency == 'MYR')
aggdf4 <- subset(aggdf, Currency == 'HKD')


aggdfsub <- rbind( aggdf2, aggdf3, aggdf4)
castdf <- cast(aggdfsub, Date ~ Currency)
castdf <- castdf[-(1:18),]
head(castdf)
melted <- melt(castdf,id.var="Date")
ggplot(melted,aes(x=Date,y=value,group=Currency,colour=Currency))+geom_line()+geom_point()+ggtitle("Daily Commulative Returns by Currency")


# withoutphp
subdf <- subset(aggdf, Currency != 'PHP' & Currency != 'USD')
castsubdf <- cast(subdf, Date ~ Currency)
castsubdf <- castsubdf[-(1:18),]
melted1<- melt(castsubdf,id.var="Date")
ggplot(melted1,aes(x=Date,y=value,group=Currency,colour=Currency))+geom_line()+geom_point()+ggtitle("Daily Commulative Returns by Currency excluding PHP")

library(dygraphs)
xtsdf <- xts(x = as.data.frame(castsubdf[,-1]), order.by = as.POSIXct(castsubdf$Date))
dygraph(xtsdf)


## Transaction frequency

subdf <- cbind(Date = as.character(Date), Currency, Freq = as.numeric(frequency))
aggdf <- aggregate(Freq~Date+Currency, data = subdf, FUN = sum, na.rm = TRUE)

library(reshape2)
library(ggplot2)
castdf <- cast(aggdf, Date ~ Currency)
castdf <- castdf[-(1:18),]
head(castdf)
melted <- melt(castdf,id.var="Date")
ggplot(melted,aes(x=Date,y=value,group=Currency,colour=Currency))+geom_line()+geom_point()+ggtitle("Daily Commulative Number of Transactions by Currency")


xtsdf <- xts(x = as.data.frame(castdf[,-1]), order.by = as.POSIXct(castdf$Date))
dygraph(xtsdf)


# withoutphp
subdf <- subset(aggdf, Currency != 'PHP')
castsubdf <- cast(subdf, Date ~ Currency)
castsubdf <- castsubdf[-(1:18),]
melted1<- melt(castsubdf,id.var="Date")
ggplot(melted1,aes(x=Date,y=value,group=Currency,colour=Currency))+geom_line()+geom_point()+ggtitle("Daily Commulative Returns by Currency excluding PHP")



### Panalo Card Holder
dfwopk <- subset(trans, PANALOKARD_NO == '9999999995')
dfwpk <- subset(trans, PANALOKARD_NO != '9999999995')
nrow(dfwopk)
nrow(dfwpk)

dfwpk$freq <- rep(1, nrow(dfwpk))
pkf <- aggregate(freq ~ PANALOKARD_NO, data = dfwpk, FUN = sum, na.rm = TRUE)
nrow(subset(pkf, freq > 10))

subdf <- cbind(Date = as.character(Date), Currency, Freq = as.numeric(frequency))
aggdf <- aggregate(Freq~Date+Currency, data = subdf, FUN = sum, na.rm = TRUE)

### 
segdf <- as.data.frame(cbind(newdf$AMOUNT, newdf$CURRENCY_CODE, newdf$STATUS.y, newdf$CHANNEL_TYPE, Province = newdf$`1`, City = newdf$`2`, newdf$freq))
names(segdf) <- c('Amount', 'Currency', 'Status.Y', 'Channel', 'Province', 'City', 'Freq')
segdf$Amount <- as.numeric(segdf$Amount)
segdf$Currency <- as.factor(segdf$Currency)
segdf$Status.Y <- as.factor(segdf$Status.Y)
segdf$Channel <- as.factor(segdf$Channel)
segdf$Province <- as.factor(segdf$Province)
segdf$City <- as.factor(segdf$City)
segdf$Freq <- as.numeric(segdf$Freq)

segdf <- segdf[,c(1,5,7)]

diss <- cluster::daisy(segdf, metric='gower')
result <- kmeans(diss, 10)

segres <- fastcluster::hclust(segdf)


###

p <- plot_ly(seg1, x = ~Amount, y = ~Freq, text = ~, type = 'scatter', mode = 'markers',
             marker = list(size = ~gap, opacity = 0.5)) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))


#### BIG data
setwd("/Users/maggie/Dropbox/MD's Data Science Team/USSC")
library(data.table)
bigres<- as.data.frame(fread('results/bigresult.csv'))
bigres <- bigres[,-1]
bigres$frequency <- rep(1, nrow(bigres))
library(bubbles)
clustable <- as.data.frame(table(bigres$cluster))
bubbles(clustable$Freq, clustable$Var1, color = rainbow(10, alpha = NULL))

library(ggplot2)
ggplot(data=php, aes(x=cluster, y=frequency, fill=cluster), colors(rainbow(10, alpha = NULL))) +
  geom_bar(stat="identity")


##

newdf <- subset(newdf, PANALOKARD_NO != '9999999995')
newdf <- subset(newdf, Currency == 'PHP')

c1 <- subset(newdf, cluster==1)
c2 <- subset(newdf, cluster==2)
c3 <- subset(newdf, cluster==3)
c4 <- subset(newdf, cluster==4)
c5 <- subset(newdf, cluster==5)
c6 <- subset(newdf, cluster==6)
c7 <- subset(newdf, cluster==7)
c8 <- subset(newdf, cluster==8)
c9 <- subset(newdf, cluster==9)
c10 <- subset(newdf, cluster==10)
c1 <- c1[order(c1$Amount, decreasing=TRUE),]
c2 <- c2[order(c2$Amount, decreasing=TRUE),]
c3 <- c3[order(c3$Amount, decreasing=TRUE),]
c4 <- c4[order(c4$Amount, decreasing=TRUE),]
c5 <- c5[order(c5$Amount, decreasing=TRUE),]
c6 <- c6[order(c6$Amount, decreasing=TRUE),]
c7 <- c7[order(c7$Amount, decreasing=TRUE),]
c8 <- c8[order(c8$Amount, decreasing=TRUE),]
c9 <- c9[order(c9$Amount, decreasing=TRUE),]
c10 <- c10[order(c10$Amount, decreasing=TRUE),]

loc1 <- as.data.frame(table(c1$`2`))
loc1[order(loc1$Freq), ]
subset(loc1, Freq == max(loc1$Freq))

loc2 <- as.data.frame(table(c2$`2`))
subset(loc2, Freq == max(loc2$Freq))

loc3 <- as.data.frame(table(c3$`2`))
subset(loc3, Freq == max(loc3$Freq))

loc4 <- as.data.frame(table(c4$`2`))
subset(loc4, Freq == max(loc4$Freq))

loc5 <- as.data.frame(table(c5$`2`))
subset(loc5, Freq == max(loc5$Freq))

loc6 <- as.data.frame(table(c6$`2`))
subset(loc6, Freq == max(loc6$Freq))

loc7 <- as.data.frame(table(c7$`2`))
subset(loc7, Freq == max(loc7$Freq))

loc8 <- as.data.frame(table(c8$`2`))
subset(loc8, Freq == max(loc8$Freq))

loc9 <- as.data.frame(table(c9$`2`))
subset(loc9, Freq == max(loc9$Freq))

loc10 <- as.data.frame(table(c10$`2`))
subset(loc10, Freq == max(loc10$Freq))



table(c1$STATUS.y)
table(c2$STATUS.y)
table(c3$STATUS.y)
table(c4$STATUS.y)
table(c5$STATUS.y)
table(c6$STATUS.y)
table(c7$STATUS.y)
table(c8$STATUS.y)
table(c9$STATUS.y)
table(c10$STATUS.y)

mean(c1$Balance)
mean(c2$Balance)
mean(c3$Balance)
mean(c4$Balance)
mean(c5$Balance)
mean(c6$Balance)
mean(c7$Balance)
mean(c8$Balance)
mean(c9$Balance)
mean(c10$Balance)


#### gettigntransactional details of the min max of each cluster
trans <- as.data.frame(fread('BRHTRANSH.csv'))
trans <- unif
php <- subset(trans, CURRENCY_CODE=='PHP')

c1min <- subset(php, AMOUNT==86828.22)
c1min$label <- 'c1min'
c1max <- subset(php, AMOUNT==174039.0)
c1max$label <- 'c1max'

c2min <- subset(php, AMOUNT==2688.32)
c2min$label <- 'c2min'
c2max <- subset(php, AMOUNT==8233.29)
c2max$label <- 'c2max'

c3min <- subset(php, AMOUNT==29042.61)
c3min$label <- 'c3min'
c3max <- subset(php, AMOUNT==48524.23)
c3max$label <- 'c3max'

c4min <- subset(php, AMOUNT==8233.51)
c4min$label <- 'c4min'
c4max <- subset(php, AMOUNT==16529.11)
c4max$label <- 'c4max'

c5min <- (subset(php, AMOUNT<=383882.2 & AMOUNT>=383882))
c5min$label <- 'c5min'
c5max <- subset(php, AMOUNT==701100)
c5max$label <- 'c5max'

c6min <- subset(php, AMOUNT==8006808419)
c6min$label <- 'c6min'
c6max <- subset(php, AMOUNT==8006842951)
c6max$label <- 'c6max'

c7min <- subset(php, AMOUNT==16529.24)
c7min$label <- 'c7min'
c7max <- subset(php, AMOUNT==29041.19)
c7max$label <- 'c7max'

c8min <- subset(php, AMOUNT==1.00)
c8min$label <- 'c8min'
c8max <- subset(php, AMOUNT==2689.34)
c8max$label <- 'c8max'

c9min <- subset(php, AMOUNT==174141)
c9min$label <- 'c9min'
c9max <- subset(php, AMOUNT==382858.20)
c9max$label <- 'c9max'

c10min <- subset(php, AMOUNT==48530.48)
c10min$label <- 'c10min'
c10max <- subset(php, AMOUNT==86818.04)
c10max$label <- 'c10max'


res <- rbind(c1min, c1max, c2min, c2max, c3min, c3max, c4min, c4max, c5min, c5max, c6min, c6max, c7min, c7max, c8min, c8max, c9min, c9max, c10min, c10max)
