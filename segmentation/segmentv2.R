setwd("/Users/Maggie Saavedra/Google Drive/USSC/")

library(data.table)
library(bit64)
m <- as.data.frame(fread("explore/resultv3/merge/mergesenddmt.csv"))
head(m)
m <- m[,-1]

m$OCCUPATION <- as.character(m$OCCUPATION)
m$OCCUPATION[m$OCCUPATION == 'ACCOUNTANT'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'ARCHITECT'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'ATHLETE'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'BANKER'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'BUSINESS/ENTERPRENEUR'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'CONTRACTOR'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'DENTIST'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'DOCTOR'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'EMPLOYEE GOVERNMENT SECTOR'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'EMPLOYEE PRIVATE SECTOR'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'ENGINEER'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'FARMER'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'FISHERMAN'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'LAWYER'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'NURSE/MIDWIFE'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'REAL ESTATE BROKER'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'SALESMAN'] <- 'EMPLOYED'
# m$OCCUPATION[m$OCCUPATION == 'SELF-EMPLOYED'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'SELF EMPLOYED'] <- 'SELF-EMPLOYED'
m$OCCUPATION[m$OCCUPATION == 'ACCOUNTANT'] <- 'EMPLOYED'
m$OCCUPATION[m$OCCUPATION == ''] <- 'OTHERS'
m$OCCUPATION[m$OCCUPATION == 'NA'] <- 'OTHERS'
m$OCCUPATION[m$OCCUPATION == 'HOUSEWIFE'] <- 'HOME DUTIES'

m$PROVINCE[m$PROVINCE == 'QUEZON CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASAY CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASIG CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASOG CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'QUEZON  CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'QUEZONCITY '] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'QUEJZON CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'QUEZON CITY '] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PARANAQUE CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASAY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASIG '] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'PASAY  CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == ',ETRO MANILA '] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CALOOCAN'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CALOOCAN CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CALOOCAN CITY '] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CALOOCANC ITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CALOOCNA CITY'] <- 'METRO MANILA'
m$PROVINCE[m$PROVINCE == 'CAM SUR'] <- 'CAMARINES SUR'
m$PROVINCE[m$PROVINCE == 'CAMARINES SUR '] <- 'CAMARINES SUR'
m$PROVINCE[m$PROVINCE == 'CAM NORTE '] <- 'CAMARINES NORTE'
m$PROVINCE[m$PROVINCE == 'CAPIZ '] <- 'CAPIZ'
m$PROVINCE[m$PROVINCE == 'CAVITE  '] <- 'CAVITE'
m$PROVINCE[m$PROVINCE == 'CAVITE '] <- 'CAVITE'
m$PROVINCE[m$PROVINCE == 'PMAPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PMPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PPAMPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMAPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMOANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMOPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMP'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPAGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPAN'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPANAG'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPANG'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPANGA '] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPANGA  '] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPANNGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PAMPNGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == ' PAMPANGA'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'ANGELES CITY PAMP'] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'ANGELES CITY '] <- 'PAMPANGA'
m$PROVINCE[m$PROVINCE == 'PANAGSINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGAISNAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGANSINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASIANN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGANSINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASIANN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASINA'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASINAN '] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASINANN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASINN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGASNAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGFASINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANGSINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'PANNGASINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == 'BOLINAO PANGASINAN'] <- 'PANGASINAN'
m$PROVINCE[m$PROVINCE == '0'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '\\t'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '0000'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '102,932.76'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '1116'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '182 LOT21 JASMIN ST MAKATI'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '2006'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == '2009'] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == ''] <- 'OTHERS'
m$PROVINCE[m$PROVINCE == 'ABRA '] <- 'ABRA'
m$PROVINCE[m$PROVINCE == 'AGUSAN DEL NRTE'] <- 'AGUSAN DEL NORTE'
m$PROVINCE[m$PROVINCE == 'ALBAY '] <- 'ALBAY'
m$PROVINCE[m$PROVINCE == 'ANGAT BULACAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BBULACAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BUACAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BUALCAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BUALCAN  '] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BUILACAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BUL'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACAM'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACAN '] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACAN  '] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACAN PROVINCE'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACAN, BULACAN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACN'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULACNA'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'BULANCA'] <- 'BULACAN'
m$PROVINCE[m$PROVINCE == 'CABAGAN ISABELA'] <- 'ISABELA'
m$PROVINCE[m$PROVINCE == 'BUKIDNON '] <- 'BUKIDNON'
m$PROVINCE[m$PROVINCE == 'BUTUAN CITY'] <- 'BUTUAN'
m$PROVINCE[m$PROVINCE == 'AP'] <- 'APAYAO'
m$PROVINCE[m$PROVINCE == 'AUROAR '] <- 'AURORA'
m$PROVINCE[m$PROVINCE == 'AURORA '] <- 'AURORA'
m$PROVINCE[m$PROVINCE == 'BALINGASAG MISAMIS ORIENTAL'] <- 'MISAMIS ORIENTAL'
m$PROVINCE[m$PROVINCE == 'BATAAM'] <- 'BATAAN'
m$PROVINCE[m$PROVINCE == 'BATAAN '] <- 'BATAAN'
m$PROVINCE[m$PROVINCE == 'BE'] <- 'BENGUET'
m$PROVINCE[m$PROVINCE == 'BENGEUT'] <- 'BENGUET'
m$PROVINCE[m$PROVINCE == 'BENGUET '] <- 'BENGUET'
m$PROVINCE[m$PROVINCE == 'BENGUT'] <- 'BENGUET'
m$PROVINCE[m$PROVINCE == 'BNEGUET'] <- 'BENGUET'
m$PROVINCE[m$PROVINCE == 'BNUEVA ECIJA'] <- 'NUEVA ECIJA'
m$PROVINCE[m$PROVINCE == 'ILOILO'] <- 'CABATUAN ILOILO'

head(m)

m <- subset(m, BIRTHDAY!=0)
m <- subset(m, BIRTHDAY!=1950304)
m <- subset(m, BIRTHDAY!=1980521)
m <- subset(m, BIRTHDAY!=1981027)
m <- subset(m, BIRTHDAY!=1990421)
m <- subset(m, BIRTHDAY!=9571002)
m <- subset(m, BIRTHDAY!=9741209)
m <- subset(m, BIRTHDAY!=9770909)
m <- subset(m, BIRTHDAY!=9840225)
m <- subset(m, BIRTHDAY!=9850805)
m <- subset(m, BIRTHDAY!=9971006)

# include only the active card user
m <- subset(m, Status==0)

mfactors <- data.frame(m$PANALOKARD_NO, 
                       m$TRAN_CODE,
                       m$FREQUENCY, 
                       m$MEAN_AMOUNT,
                       m$MINIMUM,
                       m$MAXIMUM,
                       m$STANDARD_DEVIATION,
                       m$GENDER, 
                       m$CIVIL_STATUS, 
                       m$PROVINCE, 
                       m$SOURCE_OF_FUND, 
                       m$OCCUPATION,
                       m$LessPoints,
                       m$PlusPoints,
                       m$BIRTHDAY)
# mfactors <- mfactors[complete.cases(mfactors),]

birth <- data.table(birth = as.Date(strptime(mfactors$m.BIRTHDAY, '%Y%m%d')))

library(lubridate)
yr = duration(num = 1, units = "years")
b <- birth[, age := interval(birth, Sys.Date())/yr][]


org <- data.frame(mfactors[,1:14], b$age)
org <- subset(org, b.age>18)
org <- subset(org, b.age<=60)

names(org) <- c('panalokard', 
                'trans_code', 
                'frequency', 
                'mean_amount',
                'minimum',
                'maximum',
                'standard_deviation',
                'gender', 
                'civil_status', 
                'province', 
                'source_fund', 
                'occupation',
                'less_points',
                'plus_points',
                'age')
org$frequency <- as.numeric(as.character(org$frequency))
org$mean_amount <- as.numeric(as.character(org$mean_amount))
org$minimum <- as.numeric(as.character(org$minimum))
org$maximum <- as.numeric(as.character(org$maximum))
org$standard_deviation <- as.numeric(as.character(org$standard_deviation))
org$gender <- as.factor(org$gender)
org$civil_status <- as.factor(org$civil_status)
org$province <- as.factor(org$province)
org$source_fund <- as.factor(org$source_fund)
org$occupation <- as.factor(org$occupation)
org$less_points <- as.numeric(org$less_points)
org$plus_points <- as.numeric(org$plus_points)
org$age <- as.numeric(org$age)

final <- org[,-c(1,2)]
head(final)
org <- subset(org, frequency > 3)
final <- subset(final, frequency > 3)
## Separation of numeric and categorical
numer <- final[,c(1,2,3,4,5,11,12,13)]
categ <- final[,c(6,7,8,9,10)]

numer.scaled <- numer

# # sampling
library(dplyr)
samp <- sample_n(as.data.frame(numer.scaled), 10000)
head(samp)

library(factoextra)
library(cluster)
library(NbClust)
library(biganalytics)
# wss score
# set.seed(123)
# # Compute and plot wss for k = 2 to k = 15
# k.max <- 30 # Maximal number of clusters
# data <- numer.scaled
# wss <- sapply(1:k.max, 
#               function(k){kmeans(data, k, nstart=10 )$tot.withinss})
# plot(1:k.max, wss,
#      type="b", pch = 19, frame = FALSE, 
#      xlab="Number of clusters K",
#      ylab="Total within-clusters sum of squares",
#      main = "Elbow Method for Domestic Send-out")
# # abline(v = 8, lty =2)

# sillouette score
library(cluster)
k.max <- 15
data <- samp
sil <- rep(0, k.max)
# Compute the average silhouette width for 
# k = 2 to k = 15
for(i in 2:k.max){
  km.res <- kmeans(data, centers = i, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(data))
  sil[i] <- mean(ss[, 3])
}
# Plot the  average silhouette width
plot(1:k.max, sil, type = "b", pch = 19, 
     frame = FALSE, xlab = "Number of clusters k",
     main = "Domestic Sendout Silhouette Score",
     sub = '(October 01, 2016 - January 31, 2016)')
abline(v = 4, lty = 2)

# 
# # gap statistic
# library(cluster)
# set.seed(123)
# gap_stat <- clusGap(numer.scaled, FUN = kmeans, nstart = 25,
#                     K.max = 30, B = 50)
# # Print the result
# print(gap_stat, method = "firstmax")
# # Plot the gap statistic
# plot(gap_stat, frame = FALSE, xlab = "Number of clusters k")
# abline(v = 3, lty = 2)
# 
# 
# # NBclust
# library("NbClust")
# set.seed(123)
# nb <- NbClust(numer.scaled, distance = "euclidean", min.nc = 2,
#               max.nc = 10, method = "complete", index ="all")
# nb
# fviz_nbclust(nb) + theme_minimal()
# 

set.seed(123)
km.res <- kmeans(numer.scaled, 4)
# k-means group number of each observation
km.res$cluster
fviz_cluster(km.res, data = numer.scaled, geom = "point",
             stand = FALSE, ellipse = T, ellipse.type = "norm",
             main = 'Domestic Sendout Distribution for 4 segments',
             sub = '(October 01, 2016 - January 31, 2016)')

#########
library(biganalytics)
bigfinal <- as.big.matrix(numer.scaled)
seg <- bigkmeans(bigfinal, 2, iter.max = 100)

seg <- km.res

org$cluster <- seg$cluster
write.csv(org, 'explore/resultv3/whitelist/senddmt.csv')


c1  <- subset(org, cluster==1)
c2  <- subset(org, cluster==2)
c3  <- subset(org, cluster==3)
c4  <- subset(org, cluster==4)
c5  <- subset(org, cluster==5)
c6  <- subset(org, cluster==6)
c7  <- subset(org, cluster==7)
c8  <- subset(org, cluster==8)
c9  <- subset(org, cluster==9)
c10  <- subset(org, cluster==10)


res.amount <- rbind(
  c(seg$size[1], mean(c1$frequency), mean(c1$mean_amount), (mean(c1$standard_deviation)/mean(c1$mean_amount))*100, mean(c1$minimum), mean(c1$maximum), mean(c1$less_points), mean(c1$plus_points), mean(c1$age)),
  c(seg$size[2], mean(c2$frequency), mean(c2$mean_amount), (mean(c2$standard_deviation)/mean(c2$mean_amount))*100, mean(c2$minimum), mean(c2$maximum), mean(c2$less_points), mean(c2$plus_points), mean(c2$age)),
  c(seg$size[3], mean(c3$frequency), mean(c3$mean_amount), (mean(c3$standard_deviation)/mean(c3$mean_amount))*100, mean(c3$minimum), mean(c3$maximum), mean(c3$less_points), mean(c3$plus_points), mean(c3$age)),
  c(seg$size[4], mean(c4$frequency), mean(c4$mean_amount), (mean(c4$standard_deviation)/mean(c4$mean_amount))*100, mean(c4$minimum), mean(c4$maximum), mean(c4$less_points), mean(c4$plus_points), mean(c4$age))
  # c(seg$size[5], mean(c5$mean_amount), sd(c5$mean_amount), min(c5$mean_amount), max(c5$mean_amount)),
  # c(seg$size[6], mean(c6$mean_amount), sd(c6$mean_amount), min(c6$mean_amount), max(c6$mean_amount)),
  # c(seg$size[7], mean(c7$mean_amount), sd(c7$mean_amount), min(c7$mean_amount), max(c7$mean_amount)),
  # c(seg$size[8], mean(c8$mean_amount), sd(c8$mean_amount), min(c8$mean_amount), max(c8$mean_amount)),
  # c(seg$size[9], mean(c9$mean_amount), sd(c9$mean_amount), min(c9$mean_amount), max(c9$mean_amount)),
  # c(seg$size[10], mean(c10$mean_amount), sd(c10$mean_amount), min(c10$mean_amount), max(c10$mean_amount))
)
res.amount <- as.data.frame(res.amount)
names(res.amount) <- c('Size', 'Mean.Freq', 'Mean.Mean', 'Coeff.of.Var(%)', 'Mean.Min', 'Mean.Max', 'MeanLess.Points', 'Mean.Plus.Points', 'Age')
res <- round(as.data.frame(t(res.amount)))




prov <- as.data.frame(table(c1$province))
prov$percent <- round((prov$Freq/sum(prov$Freq))*100)
provc1 <- (prov[order(prov$Freq, decreasing = TRUE),])[1:4,]

prov <- as.data.frame(table(c2$province))
prov$percent <- round((prov$Freq/sum(prov$Freq))*100)
provc2 <- (prov[order(prov$Freq, decreasing = TRUE),])[1:4,]

prov <- as.data.frame(table(c3$province))
prov$percent <- round((prov$Freq/sum(prov$Freq))*100)
provc3 <- (prov[order(prov$Freq, decreasing = TRUE),])[1:4,]

prov <- as.data.frame(table(c4$province))
prov$percent <- round((prov$Freq/sum(prov$Freq))*100)
provc4 <- (prov[order(prov$Freq, decreasing = TRUE),])[1:4,]

pr <- as.data.frame(cbind(paste0(provc1$Var1 , ' (', provc1$percent, '%)'),
                          paste0(provc2$Var1 , ' (', provc2$percent, '%)'),
                          paste0(provc3$Var1 , ' (', provc3$percent, '%)'),
                          paste0(provc4$Var1 , ' (', provc4$percent, '%)')))
rownames(pr) <- c('Province 1', 'Province 2', 'Province 3', 'Province 4')
res <- rbind(res, pr)
names(res) <- c('A', 'B', 'C', 'D')
# summ <- round(t(aggregate(.~cluster, data = org, FUN = mean)))
write.csv(res, 'explore/resultv3/summary/senddmt.csv')



# res.lesspoints <- rbind(
#   c(seg$size[1], mean(c1$less_points), sd(c1$less_points), min(c1$less_points), max(c1$less_points)),
#   c(seg$size[2], mean(c2$less_points), sd(c2$less_points), min(c2$less_points), max(c2$less_points)),
#   c(seg$size[3], mean(c3$less_points), sd(c3$less_points), min(c3$less_points), max(c3$less_points)),
#   c(seg$size[4], mean(c4$less_points), sd(c4$less_points), min(c4$less_points), max(c4$less_points)),
#   c(seg$size[5], mean(c5$less_points), sd(c5$less_points), min(c5$less_points), max(c5$less_points)),
#   c(seg$size[6], mean(c6$less_points), sd(c6$less_points), min(c6$less_points), max(c6$less_points)),
#   c(seg$size[7], mean(c7$less_points), sd(c7$less_points), min(c7$less_points), max(c7$less_points)),
#   c(seg$size[8], mean(c8$less_points), sd(c8$less_points), min(c8$less_points), max(c8$less_points)),
#   c(seg$size[9], mean(c9$less_points), sd(c9$less_points), min(c9$less_points), max(c9$less_points)),
#   c(seg$size[10], mean(c10$less_points), sd(c10$less_points), min(c10$less_points), max(c10$less_points))
# )
# res.lesspoints <- as.data.frame(res.lesspoints)
# names(res.lesspoints) <- c('size', 'mean', 'sd', 'min', 'max')
# res.lesspoints
# 
# 
# 
# c(mean(c1$frequency), min(c1$frequency), max(c1$frequency))
# c(mean(c2$frequency), min(c2$frequency), max(c2$frequency))
# c(mean(c3$frequency), min(c3$frequency), max(c3$frequency))
# c(mean(c4$frequency), min(c4$frequency), max(c4$frequency))
# c(mean(c5$frequency), min(c5$frequency), max(c5$frequency))
# c(mean(c6$frequency), min(c6$frequency), max(c6$frequency))
# c(mean(c7$frequency), min(c7$frequency), max(c7$frequency))
# c(mean(c8$frequency), min(c8$frequency), max(c8$frequency))
# c(mean(c9$frequency), min(c9$frequency), max(c9$frequency))
# c(mean(c10$frequency), min(c10$frequency), max(c10$frequency))
# 
# c(mean(c1$age), min(c1$age), max(c1$age))
# c(mean(c2$age), min(c2$age), max(c2$age))
# c(mean(c3$age), min(c3$age), max(c3$age))
# c(mean(c4$age), min(c4$age), max(c4$age))
# c(mean(c5$age), min(c5$age), max(c5$age))
# c(mean(c6$age), min(c6$age), max(c6$age))
# c(mean(c7$age), min(c7$age), max(c7$age))
# c(mean(c8$age), min(c8$age), max(c8$age))
# c(mean(c9$age), min(c9$age), max(c9$age))
# c(mean(c10$age), min(c10$age), max(c10$age))
# 

barplot(table(c1$frequency), col = 'maroon', main = "Frequency Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$frequency), col = 'maroon', main = "Frequency Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$frequency), col = 'maroon', main = "Frequency Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$frequency), col = 'maroon', main = "Frequency Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$frequency), col = 'maroon', main = "Frequency Distribution of Cluster 5 for Domestic Sendout")


barplot(table(c1$age), col = 'maroon', main = "Age Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$age), col = 'maroon', main = "Age Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$age), col = 'maroon', main = "Age Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$age), col = 'maroon', main = "Age Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$age), col = 'maroon', main = "Age Distribution of Cluster 5 for Domestic Sendout")


barplot(table(c1$gender), col = 'maroon', main = "Gender Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$gender), col = 'maroon', main = "Gender Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$gender), col = 'maroon', main = "Gender Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$gender), col = 'maroon', main = "Gender Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$gender), col = 'maroon', main = "Gender Distribution of Cluster 5 for Domestic Sendout")

barplot(table(c1$civil_status), col = 'maroon', main = "Civil Status Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$civil_status), col = 'maroon', main = "Civil Status Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$civil_status), col = 'maroon', main = "Civil Status Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$civil_status), col = 'maroon', main = "Civil Status Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$civil_status), col = 'maroon', main = "Civil Status Distribution of Cluster 5 for Domestic Sendout")


barplot(table(c1$source_fund), col = 'maroon', main = "Source of Fund Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$source_fund), col = 'maroon', main = "Source of Fund Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$source_fund), col = 'maroon', main = "Source of Fund Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$source_fund), col = 'maroon', main = "Source of Fund Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$source_fund), col = 'maroon', main = "Source of Fund Distribution of Cluster 5 for Domestic Sendout")


barplot(table(c1$occupation), col = 'maroon', main = "Occupation Distribution of Cluster 1 for Domestic Sendout")
barplot(table(c2$occupation), col = 'maroon', main = "Occupation Distribution of Cluster 2 for Domestic Sendout")
barplot(table(c3$occupation), col = 'maroon', main = "Occupation Distribution of Cluster 3 for Domestic Sendout")
barplot(table(c4$occupation), col = 'maroon', main = "Occupation Distribution of Cluster 4 for Domestic Sendout")
barplot(table(c5$occupation), col = 'maroon', main = "Occupation Distribution of Cluster 5 for Domestic Sendout")
        


#################

library(PCAmixdata)
pc <- PCAmix(X.quanti = numer, X.quali = categ, rename.level = TRUE)
library(rgl)
plot3d(pc$scores[,1:3], col = km.res$cluster)
browseURL(paste("file://", writeWebGL(dir=file.path("explore/resultv2/vis2/", "DomesticSendout 3D"), width=700), sep=""))
