setwd("/Users/Maggie Saavedra/Google Drive/USSC Big Data/")
library(data.table)
library(bit64)
trans <- as.data.frame(fread('BRHTRANSH_20161001_to_20170131.csv'))
branch <- as.data.frame(fread('BRHBRACOD_as_of_20170131.csv'))
points <- as.data.frame(fread('LYCM_as_of_20170131.csv'))


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


trans.pk <- subset(trans, PANALOKARD_NO!='0')
trans.pk <- subset(trans.pk, PANALOKARD_NO!=' ')
head(trans.pk)
trans.pk$AMOUNT <- as.numeric(trans.pk$AMOUNT)
trans.payimt <- subset(trans.pk, TRAN_CODE == 'WU11300')
trans.paydmt <- subset(trans.pk, TRAN_CODE == 'WU11301')
trans.sendimt <- subset(trans.pk, TRAN_CODE == 'WU11100')
trans.senddmt <- subset(trans.pk, TRAN_CODE == 'WU11101')

usd <- subset(trans.payimt, CURRENCY_CODE=='USD')
usd$AMOUNT <- usd$AMOUNT*49
trans.payimt <- rbind(subset(trans.payimt, CURRENCY_CODE=='PHP'), usd)

usd2 <- subset(trans.paydmt, CURRENCY_CODE=='USD')
usd2$AMOUNT <- usd2$AMOUNT*49
trans.paydmt <- rbind(subset(trans.paydmt, CURRENCY_CODE=='PHP'), usd2)

## for payout international money transfer
getstat <- function(panalokard, datasource){
  s <- subset(datasource, PANALOKARD_NO==panalokard)
  
  freq <- nrow(s)
  mean <- mean(s$AMOUNT)
  total <- sum(s$AMOUNT)
  minimum <- min(s$AMOUNT)
  maximum <- max(s$AMOUNT)
  standev <- sd(s$AMOUNT)
  
  
  return(c(TRAN_CODE = unique(s$TRAN_CODE),
           PANALOKARD_NO = panalokard,
           FREQUENCY = freq,
           TOTAL_AMOUNT = total,
           MEAN_AMOUNT = mean,
           MINIMUM = minimum,
           MAXIMUM= maximum,
           STANDARD_DEVIATION = standev))
}
uq.payimt <- unique(trans.payimt$PANALOKARD_NO)

res.payimt <- NULL
i=1
j=1000
repeat({
  uq.payimt_ <- uq.payimt[i:j]
  res.payimt_ <- as.data.frame(do.call(rbind, lapply(X = uq.payimt_, FUN = function(X) getstat(X, trans.payimt))))
  res.payimt <- rbind(res.payimt, res.payimt_)
  
  print(paste("Done with the first", i, "to", j, "entries out of", length(uq.payimt)))
  
  i = i + 1000
  j = j + 1000
  
  write.csv(res.payimt, '/Users/Maggie Saavedra/Google Drive/USSC internal/explore/resultv3/resultPayoutIMT.csv')
})



## for payout domestic money transfer
getstat <- function(panalokard){
  s <- subset(trans.paydmt, PANALOKARD_NO==panalokard)
  
  freq <- nrow(s)
  mean <- mean(s$AMOUNT)
  total <- sum(s$AMOUNT)
  minimum <- min(s$AMOUNT)
  maximum <- max(s$AMOUNT)
  standev <- sd(s$AMOUNT)
  
  
  return(c(TRAN_CODE = unique(s$TRAN_CODE),
           PANALOKARD_NO = panalokard,
           FREQUENCY = freq,
           TOTAL_AMOUNT = total,
           MEAN_AMOUNT <- mean,
           MINIMUM = minimum,
           MAXIMUM= maximum,
           STANDARD_DEVIATION = standev))
}
uq.paydmt <- unique(trans.paydmt$PANALOKARD_NO)

res.paydmt <- do.call(rbind, lapply(X = uq.paydmt, FUN = getstat))
write.csv(res.paydmt, '/Users/Maggie Saavedra/Google Drive/USSC internal/explore/resultv3/resultPayoutDMT.csv')

## for sendout international money transfer
getstat <- function(panalokard){
  s <- subset(trans.sendimt, PANALOKARD_NO==panalokard)
  
  freq <- nrow(s)
  mean <- mean(s$AMOUNT)
  total <- sum(s$AMOUNT)
  minimum <- min(s$AMOUNT)
  maximum <- max(s$AMOUNT)
  standev <- sd(s$AMOUNT)
  
  
  return(c(TRAN_CODE = unique(s$TRAN_CODE),
           PANALOKARD_NO = panalokard,
           FREQUENCY = freq,
           TOTAL_AMOUNT = total,
           MEAN_AMOUNT <- mean,
           MINIMUM = minimum,
           MAXIMUM= maximum,
           STANDARD_DEVIATION = standev))
}


uq.sendimt <- unique(trans.sendimt$PANALOKARD_NO)

res.sendimt <- do.call(rbind, lapply(X = uq.sendimt, FUN = getstat))
write.csv(res.sendimt, '/Users/Maggie Saavedra/Google Drive/USSC internal/explore/resultv3/resultSendoutIMT.csv')
## for sendout domestic money transfer
getstat <- function(panalokard){
  s <- subset(trans.senddmt, PANALOKARD_NO==panalokard)
  
  freq <- nrow(s)
  mean <- mean(s$AMOUNT)
  total <- sum(s$AMOUNT)
  minimum <- min(s$AMOUNT)
  maximum <- max(s$AMOUNT)
  standev <- sd(s$AMOUNT)
  
  
  return(c(TRAN_CODE = unique(s$TRAN_CODE),
           PANALOKARD_NO = panalokard,
           FREQUENCY = freq,
           TOTAL_AMOUNT = total,
           MEAN_AMOUNT <- mean,
           MINIMUM = minimum,
           MAXIMUM= maximum,
           STANDARD_DEVIATION = standev))
}


uq.senddmt <- unique(trans.senddmt$PANALOKARD_NO)

res.senddmt <- do.call(rbind, lapply(X = uq.senddmt, FUN = getstat))
write.csv(res.senddmt, '/Users/Maggie Saavedra/Google Drive/USSC internals/explore/resultv3/resultSendoutDMT.csv')

