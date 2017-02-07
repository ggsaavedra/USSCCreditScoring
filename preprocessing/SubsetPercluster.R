library(data.table)
library(bit64)
setwd('/Users/Maggie Saavedra/Google Drive/')
md<- as.data.frame(fread('USSC Big Data/BRHTRANSH_20161001_to_20170131.csv', fill = TRUE))


md <- md[md$TRAN_CODE %in% c('WU11300', 'WU11301', 'WU11101', 'WU11100'),]
cd <- as.data.frame(fread('USSC internal/explore/resultv3/whitelist/senddmt.csv'))
nrow(cd) == length(unique(cd$panalokard))

# df <- NULL
# 
# for (i in 22895:nrow(cd)){
#   s_ <- subset(md, PANALOKARD_NO==unique(cd$panalokard)[i])
#   s_$cluster <- rep(cd[i,'cluster'], nrow(s_))
#   df <- rbind(df, s_)
#   
#   write.csv(df, 'explore/resultv2/vis2/International Payout/payimtTrans.csv')
#   print(paste0('Progress: ', i, 'out of', nrow(cd), 'finished'))
# }

test <- cd$panalokard[1:length(cd$panalokard)]
fun <- function(x){
  s_ <- subset(md, PANALOKARD_NO==x)
  i <- subset(cd, panalokard==x)$cluster
  s_$cluster <- rep(i, nrow(s_))
  return(s_)
}
res <- do.call(rbind, lapply(test, FUN=fun))
write.csv(res, 'USSC internal/explore/resultv3/tran_clust/senddmt.csv')
