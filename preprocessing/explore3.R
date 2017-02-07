setwd("Dropbox/MD's Data Science Team/USSC")
library(data.table)
trans <- as.data.frame(fread('Data/BRHTRANSH.csv'))
branch <- as.data.frame(fread('Data/BRHBRACOD.csv'))
points <- as.data.frame(fread('Data/LYCM.csv'))

head(trans)
trans$freq <- rep(1, nrow(trans))
trans1 <- as.data.frame(cbind(trans$PANALOKARD_NO, trans$AMOUNT, trans$freq))
names(trans1) <- c('PANALOKARD_NO', 'AMOUNT', 'FREQUENCY')
transwith <- subset(trans1, PANALOKARD_NO != '9999999995')
meanagg <- aggregate(AMOUNT~PANALOKARD_NO, data = transwith, FUN = mean)
rangeagg <- aggregate(AMOUNT~PANALOKARD_NO, data = transwith, FUN = range)
sdagg <- aggregate(AMOUNT~PANALOKARD_NO, data = transwith, FUN = sd)
freqagg <- aggregate(FREQUENCY~PANALOKARD_NO, data = transwith, FUN = sum)


location <- strsplit(branch$NAME, ' - ')
loc <- do.call(rbind, location)
names(loc) <- c('Province', 'City', 'loc')
newdf <- as.data.frame(cbind(branch$PANALOKARD_NO, loc$Province))


trans.pk <- subset(trans, PANALOKARD_NO!='9999999995')
trans.mt <- subset(trans.pk, TRAN_CODE == 'WU11300')
nrow(trans.pk)
nrow(trans.mt)
length(unique(trans.mt))

getstat <- function(panalokard, datasource){
  s <- subset(datasource, PANALOKARD_NO==panalokard)
  
  freq <- nrow(s)
  mean <- s$AMOUNT
  total <- sum(s$AMOUNT)
  minimum <- min(s$AMOUNT)
  maximum <- max(s$AMOUNT)
  standev <- sd(s$AMOUNT)
  
  return(c(PANALOKARD_NO = panalokard,
           FREQUENCY = freq,
           TOTAL_AMOUNT = total,
           MEAN_AMOUNT <- mean,
           MINIMUM = minimum,
           MAXIMUM= maximum,
           STANDARD_DEVIATION = standev))
}

