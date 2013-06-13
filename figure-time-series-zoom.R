works_with_R("3.0.1",ggplot2="0.9.3.1",directlabels="2.10")

load("extract.RData")

counts <- extract$counts

names(counts) <- c("package","count","date")

library(grid)
p <- ggplot(counts, aes(date, count))+
  geom_line()+
  facet_grid(package~.,scales="free")+
  theme_bw()+
  theme(panel.margin=unit(0,"cm"))

pdf("figure-time-series-zoom.pdf",h=6)
print(p)
dev.off()
