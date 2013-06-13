## Here's an easy way to get all the URLs in R
start <- as.Date('2012-10-01')
today <- as.Date('2013-06-11')

all_days <- seq(start, today, by = 'day')

year <- as.POSIXlt(all_days)$year + 1900
urls <- paste0('http://cran-logs.rstudio.com/', year, '/', all_days, '.csv.gz')
## You can then use download.file to download into a directory.

for(u in urls){
  f <- basename(u)
  if(!file.exists(f)){
    download.file(u, f)
  }
}

## If you only want to download the files you don't have, try:
missing_days <- setdiff(all_days, tools::file_path_sans_ext(dir(), TRUE))
