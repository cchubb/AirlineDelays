########################################################################
# Prepare the flight data set
# Plot just for delays associated with certain airports in Florida using certain carriers

setwd("C:/Users/cchubb/Coursera/DataScience/9DevelopingDataProducts/Project/AirlineDelays")

library(dplyr)
require(ggplot2)

#Original flight data downloaded from http://stat-computing.org/dataexpo/2009/the-data.html

if (! file.exists("data/2008.csv.bz2")) {
  download.file("http://stat-computing.org/dataexpo/2009/2008.csv.bz2", "data/2008.csv.bz2")
}

if (! file.exists("data/carriers.csv")) {
  download.file("http://stat-computing.org/dataexpo/2009/carriers.csv", "data/carriers.csv")
}

raw_2008 <- read.csv("data/2008.csv.bz2")
raw_2008$UniqueCarrier <- as.factor(raw_2008$UniqueCarrier)
carriers <- read.csv("data/carriers.csv")


delays <- inner_join(
  raw_2008[raw_2008$Month == 1 &
             raw_2008$Cancelled == 0 &
             raw_2008$Diverted == 0 &
             raw_2008$Origin %in% c("JAX","MCO","MIA","FLL","TPA") &
             raw_2008$DepDelay <= 60,
           c("UniqueCarrier", "Origin", "DepDelay", "DayOfWeek")],
  carriers,
  by=c("UniqueCarrier" = "Code")
)
delays$Name <- sub("([A-Za-z]+).*", "\\1", delays$Description) #Short airline name

saveRDS(delays, "delays.rds")

rm(raw_2008, carriers) #Clean up

#A test plot
p <- ggplot(delays, aes(x=Origin, y=DepDelay)) +
  geom_boxplot() +
  geom_jitter(shape=16, size=2, position=position_jitter(0.2), alpha=0.6, aes(color=Name))

print(p)


#Try a data table
delays %>% group_by(Origin, Name) %>% summarise(MeanDelay = round(mean(DepDelay), 1))





