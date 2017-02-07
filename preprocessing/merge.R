setwd("/Users/Maggie Saavedra/Google Drive/")
library(data.table)
library(bit64)
trans <- as.data.frame(fread('USSC Big Data/BRHTRANSH_20161001_to_20170131.csv'))
branch <- as.data.frame(fread('USSC Big Data/BRHBRACOD_as_of_20170131.csv'))
points <- as.data.frame(fread('USSC Big Data/LYCM_as_of_20170131.csv'))
cif <- as.data.frame(fread('USSC Big Data/CIF_as_of_20170131.csv/CIF_as_of_20170131.csv'))
partrans <- as.data.frame(fread('USSC Big Data/PARTRANCD_as_of_20170131.csv'))
paruser <- as.data.frame(fread('USSC Big Data/PARUSERSP_20170131.csv'))
wutrans <- as.data.frame(fread('USSC Big Data/WUNTRANSH_20161001_to_20170131.csv/WUNTRANSH_20161001_to_20170131.csv'))


n <- c("TRAN_CODE", 
       "PANALOKARD_NO", 
       "FREQUENCY", 
       "TOTAL_AMOUNT", 
       "MEAN_AMOUNT", 
       "MINIMUM", 
       "MAXIMUM",
       "STANDARD_DEVIATION")
cif$PANALOKARD_NO <- as.character(cif$PANALOKARD_NO)
points$PanaloKardNo <- as.character(points$PanaloKardNo)

# merging international sendout
sendimt <- as.data.frame(fread('USSC internal/explore/resultv3/getstat/resultSendoutIMT.csv'))
sendimt <- sendimt[,-1]
names(sendimt) <- n
merge.sendimt <- merge(x = sendimt, y = cif, 
                                   by = 'PANALOKARD_NO', 
                                   all.x = TRUE, all.y = FALSE)
merge.sendimt <- merge(x = merge.sendimt, y = points, 
                                   by.x = 'PANALOKARD_NO', by.y = 'PanaloKardNo',
                                   all.x = TRUE, all.y = FALSE)
write.csv(merge.sendimt, 'USSC internal/explore/resultv3/merge/mergesendimt.csv')

# merging domestic sendout
senddmt <- as.data.frame(fread('USSC internal/explore/resultv3/getstat/resultSendoutDMT.csv'))
senddmt <- senddmt[,-1]
names(senddmt) <- n
merge.senddmt <- merge(x = senddmt, y = cif, 
                       by = 'PANALOKARD_NO', 
                       all.x = TRUE, all.y = FALSE)
merge.senddmt <- merge(x = merge.senddmt, y = points, 
                       by.x = 'PANALOKARD_NO', by.y = 'PanaloKardNo',
                       all.x = TRUE, all.y = FALSE)
write.csv(merge.senddmt, 'USSC internal/explore/resultv3/merge/mergesenddmt.csv')

# merging domestic payout
paydmt <- as.data.frame(fread('USSC internal/explore/resultv3/getstat/resultPayoutDMT.csv'))
paydmt <- paydmt[,-1]
names(paydmt) <- n
merge.paydmt <- merge(x = paydmt, y = cif, 
                       by = 'PANALOKARD_NO', 
                       all.x = TRUE, all.y = FALSE)
merge.paydmt <- merge(x = merge.paydmt, y = points, 
                       by.x = 'PANALOKARD_NO', by.y = 'PanaloKardNo',
                       all.x = TRUE, all.y = FALSE)
write.csv(merge.paydmt, 'USSC internal/explore/resultv3/merge/mergepaydmt.csv')

# merging international payout
payimt <- as.data.frame(fread('USSC internal/explore/resultv3/getstat/resultPayoutIMT.csv'))
payimt <- payimt[,-1]
names(payimt) <- n
merge.payimt <- merge(x = payimt, y = cif, 
                      by = 'PANALOKARD_NO', 
                      all.x = TRUE, all.y = FALSE)
merge.payimt <- merge(x = merge.payimt, y = points, 
                      by.x = 'PANALOKARD_NO', by.y = 'PanaloKardNo',
                      all.x = TRUE, all.y = FALSE)
write.csv(merge.payimt, 'USSC internal/explore/resultv3/merge/mergepayimt.csv')

