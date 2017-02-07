library(data.table)
setwd('/Users/Maggie Saavedra/Google Drive/USSC internal/')

payimt <- as.data.frame(fread('explore/resultv2/vis2/Domestic Payout/paydmtTrans.csv'))
payimt$TRAN_DATE <- as.Date(strptime(paydmt$TRAN_DATE, '%Y%m%d'))
# write.csv(paydmt, 'explore/resultv2/vis2/Domestic Payout/paydmtTransNEW.csv')

paydmt <- as.data.frame(fread('explore/resultv2/vis2/Domestic Payout/paydmtTrans.csv'))
paydmt$TRAN_DATE <- as.Date(strptime(paydmt$TRAN_DATE, '%Y%m%d'))
# write.csv(paydmt, 'explore/resultv2/vis2/Domestic Payout/paydmtTransNEW.csv')


sendimt <- as.data.frame(fread('explore/resultv2/vis2/International Sendout/sendimtTrans.csv'))
sendimt$TRAN_DATE <- as.Date(strptime(sendimt$TRAN_DATE, '%Y%m%d'))
# write.csv(sendimt , 'explore/resultv2/vis2/International Sendout/sendimtTransNEW.csv')


senddmt <- as.data.frame(fread('explore/resultv2/vis2/Domestic Sendout/senddmtTrans.csv'))
senddmt$TRAN_DATE <- as.Date(strptime(senddmt$TRAN_DATE, '%Y%m%d'))
# write.csv(sendimt, 'explore/resultv2/vis2/Domestic Sendout/senddmtTransNEW.csv')

#############################
# Remember it is good coding technique to add additional packages to the top of
# your script 
library(lubridate) # for working with dates
library(ggplot2)  # for creating graphs
library(scales)   # to access breaks/formatting functions
library(gridExtra) # for arranging plots


dd <- aggregate(AMOUNT~TRAN_DATE+cluster, data = paydmt, sum)
qplot(x = TRAN_DATE, AMOUNT, data = dd, color = cluster, main = 'Daily Sum Amount per Cluster for Domestic Payout')
c1 <- subset(dd, cluster==1)
c2 <- subset(dd, cluster==2)
c3 <- subset(dd, cluster==3)
c4 <- subset(dd, cluster==4)
c5 <- subset(dd, cluster==5)
qplot(x = TRAN_DATE, AMOUNT, data = c1, color = 'blue', main = 'Daily Sum Amount for cluster 1 of Domestic Payout')
qplot(x = TRAN_DATE, AMOUNT, data = c2, color = 'red', main = 'Daily Sum Amount for cluster 2 of Domestic Payout')
qplot(x = TRAN_DATE, AMOUNT, data = c3, color = 'green', main = 'Daily Sum Amount for cluster 3 of Domestic Payout')
qplot(x = TRAN_DATE, AMOUNT, data = c4, color = 'purple', main = 'Daily Sum Amount for cluster 4 of Domestic Payout')
qplot(x = TRAN_DATE, AMOUNT, data = c5, color = 'black', main = 'Daily Sum Amount for cluster 5 of Domestic Payout')


dd <- aggregate(AMOUNT~TRAN_DATE+cluster, data = sendimt, sum)
qplot(x = TRAN_DATE, AMOUNT, data = dd, color = cluster, main = 'Daily Sum Amount per Cluster for International Sendout')
c1 <- subset(dd, cluster==1)
c2 <- subset(dd, cluster==2)
c3 <- subset(dd, cluster==3)
c4 <- subset(dd, cluster==4)
c5 <- subset(dd, cluster==5)
qplot(x = TRAN_DATE, AMOUNT, data = c1, color = 'blue', main = 'Daily Sum Amount for cluster 1 of International Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c2, color = 'red', main = 'Daily Sum Amount for cluster 2 of International Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c3, color = 'green', main = 'Daily Sum Amount for cluster 3 of International Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c4, color = 'purple', main = 'Daily Sum Amount for cluster 4 of International Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c5, color = 'black', main = 'Daily Sum Amount for cluster 5 of International Sendout')


dd <- aggregate(AMOUNT~TRAN_DATE+cluster, data = senddmt, sum)
qplot(x = TRAN_DATE, AMOUNT, data = dd, color = cluster, main = 'Daily Sum Amount per Cluster for Domestic Sendout')
c1 <- subset(dd, cluster==1)
c2 <- subset(dd, cluster==2)
c3 <- subset(dd, cluster==3)
c4 <- subset(dd, cluster==4)
c5 <- subset(dd, cluster==5)
qplot(x = TRAN_DATE, AMOUNT, data = c1, color = 'blue', main = 'Daily Sum Amount for cluster 1 of Domestic Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c2, color = 'red', main = 'Daily Sum Amount for cluster 2 of Domestic Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c3, color = 'green', main = 'Daily Sum Amount for cluster 3 of Domestic Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c4, color = 'purple', main = 'Daily Sum Amount for cluster 4 of Domestic Sendout')
qplot(x = TRAN_DATE, AMOUNT, data = c5, color = 'black', main = 'Daily Sum Amount for cluster 5 of Domestic Sendout')
