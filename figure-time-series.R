works_with_R("3.0.1",ggplot2="0.9.3.1",directlabels="2.10",quadprog="1.5.5")

load("extract.RData")

names(extract$counts) <- c("package","count","date")

p <- ggplot(extract$counts, aes(date, count))+
  geom_line(aes(group=package, colour=package))

one.hour <- 60*60
one.day <- one.hour * 24
one.week <- one.day * 7
dl <- direct.label(p)+
  xlim(min(extract$counts$date),max(extract$counts$date)+one.week*4)

pdf("figure-time-series.pdf",h=2)
print(dl)
dev.off()
