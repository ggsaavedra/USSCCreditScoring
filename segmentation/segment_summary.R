library(data.table)
library(ggplot2)
setwd('/Users/Maggie Saavedra/Google Drive/USSC internal/')

# Domestic Payout
payimt <- as.data.frame(fread('explore/resultv3/whitelist/senddmt.csv'))
payimt <- payimt[,-1]
payimt$age <- floor(payimt$age)
head(payimt)

# frequency
ggplot(payimt, aes(cluster, fill=as.factor(frequency))) + 
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Frequency Distribution')

# payimt_ <- payimt[payimt$frequency %in% c(20:271),]
# ggplot(payimt_, aes(cluster, fill=as.factor(frequency))) + 
#   geom_bar(position="dodge") + 
#   ggtitle('Domestic Sendout Frequency excluding 4')


# Source of Fund
ggplot(payimt, aes(cluster, fill=source_fund)) + 
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Source of Fund Distribution')

payimt <- subset(payimt, source_fund!='NULL')
ggplot(payimt, aes(cluster, fill=source_fund)) + 
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Source of Fund Distribution excluding NULL and OTHERS')


# occupation
ggplot(payimt, aes(cluster, fill=occupation)) + 
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Occupation Distribution')

payimt <- subset(payimt, occupation!='NULL')
payimt <- subset(payimt, occupation!='OTHERS')
ggplot(payimt, aes(cluster, fill=occupation)) + 
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Occupation Distribution excluding NULL and OTHERS')

# age
payimt_ <- payimt[payimt$age %in% c(18:100),]
ggplot(payimt_, aes(cluster, fill=as.factor(age))) +
  geom_bar(position="dodge") + 
  ggtitle('Domestic Sendout Age Distribution')

