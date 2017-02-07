
library(data.table)
setwd('/Users/Maggie Saavedra/Google Drive/USSC internal/')
trans <- as.data.frame(fread('explore/resultv3/tran_clust/payimt.csv'))
head(trans)
trans <- trans[,-1]

trans$TRAN_DATE <- as.Date(strptime(trans$TRAN_DATE, '%Y%m%d'))
trans$freq <- rep(1, nrow(trans))
datetxt <- trans$TRAN_DATE
df <- data.frame(date = datetxt,
                 year = as.numeric(format(datetxt, format = "%Y")),
                 month = as.numeric(format(datetxt, format = "%m")),
                 week = as.numeric(format(datetxt, format = "%U")),
                 day = as.numeric(format(datetxt, format = "%d")))
trans <- cbind(trans, month = df$month, week = df$week, day = df$day)

agg1 <- aggregate(freq~PANALOKARD_NO+month+cluster, data = trans, FUN = sum)
agg <- aggregate(AMOUNT~PANALOKARD_NO+week+cluster, data = trans, FUN = function(x)mean(x, trim = .10))

library(reshape2)
library(reshape)
tab <- cast(agg, PANALOKARD_NO+cluster~week)
#names(tab) <- c('PANALOKARD_NO', 'cluster', 'August', 'September', 'October', 'November')
head(tab)
tab[is.na(tab)] <- 0

res <- tab[complete.cases(tab),]
meltres <- melt(res, id.vars = c(1,2))

library(ggplot2)
c1 <- subset(meltres, cluster==1)
ggplot(data = c1, aes(x = week, y = value, colour = PANALOKARD_NO)) + geom_line() + ggtitle('Transactional Behaviour of International Payout Cluster 1') + theme(legend.position = 'none') + geom_point()

c2 <- subset(meltres, cluster==2)
ggplot(data = c2, aes(x = week, y = value, colour = PANALOKARD_NO)) + geom_line() + ggtitle('Transactional Behaviour of International Payout Cluster 2') + theme(legend.position = 'none') + geom_point()

c3 <- subset(meltres, cluster==3)
ggplot(data = c3, aes(x = week, y = value, colour = PANALOKARD_NO)) + geom_line() + ggtitle('Transactional Behaviour of International Payout Cluster 3') + theme(legend.position = 'none') + geom_point()

c4 <- subset(meltres, cluster==4)
ggplot(data = c4, aes(x = week, y = value, colour = PANALOKARD_NO)) + geom_line() + ggtitle('Transactional Behaviour of International Payout Cluster 4') + theme(legend.position = 'none') + geom_point()

c5 <- subset(meltres, cluster==5)
ggplot(data = c5, aes(x = week, y = value, colour = PANALOKARD_NO)) + geom_line() + ggtitle('Transactional Behaviour of International Payout Cluster 5') + theme(legend.position = 'none') + geom_point()


all <- aggregate(value~cluster+week, data = meltres, FUN = function(x)mean(x, trim = .10))
#all
ggplot(data = all, aes(x = week, y = value, colour = factor(cluster))) + geom_line() + ggtitle('Transactional Behaviour per Cluster for International Payout')  + geom_point()

# percentage difference
s1 <- subset(all, cluster==1)
d1 <- cbind(c(34:45), rep(1,1), Delt(s1$value)[2:13,])

s2 <- subset(all, cluster==2)
d2 <- cbind(c(34:45), rep(2,1), Delt(s2$value)[2:13,])

s3 <- subset(all, cluster==3)
d3 <- cbind(c(34:45), rep(3,1), Delt(s3$value)[2:13,])

s4 <- subset(all, cluster==4)
d4 <- cbind(c(34:45), rep(4,1), Delt(s4$value)[2:13,])

s5 <- subset(all, cluster==5)
d5 <- cbind(c(34:45), rep(5,1), Delt(s5$value)[2:13,])

d <- as.data.frame(rbind(d1,d2,d3,d4,d5))
names(d) <- c('week', 'cluster', 'percentage_diff')
ggplot(data = d, aes(x = week, y = percentage_diff, colour = factor(cluster))) + geom_line() + ggtitle('Weekly Percent Change per Cluster for International Payout')  + geom_point()

