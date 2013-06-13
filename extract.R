colClasses <- c("POSIXct", #date
                "NULL","NULL","NULL","NULL",
                "factor", #os
                "factor", #pkg
                "NULL",
                "factor", #country
                "NULL")
df <- read.csv("2012-11-25.csv.gz",colClasses=colClasses)
str(df)
head(df)
mine <- c("directlabels","inlinedocs","bams","neuroblastoma")
pkgs <- c("ggplot2","cghseg",mine)
subset(df, package%in%mine)
counts <- table(as.character(subset(df, package%in%pkgs)$package))

files <- Sys.glob("*.csv.gz")

details <- data.frame()
count.df <- data.frame()
for(i in seq_along(files)){
  f <- files[i]
  cat(sprintf("%4d / %4d %s\n",i,length(files),f))
  df <- read.csv(f,colClasses=colClasses)
  sub.df <- subset(df, package%in%pkgs)
  counts <- table(factor(sub.df$package, pkgs))
  these.counts <- data.frame(as.data.frame(counts),date=df[1,1])
  count.df <- rbind(count.df, these.counts)
  my.details <- subset(sub.df, package%in%mine)
  details <- rbind(details, my.details)
}

extract <- list(details=details, counts=count.df)

save(extract, file="extract.RData")
