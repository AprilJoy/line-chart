setwd("~/dataviz-summer-2015//line-chart")
strikeout <- read.csv("strikeouts.csv")
strikeout$kpg <- strikeout$so/strikeout$g
subset(strikeout,kpg == max(strikeout$kpg))

oakland <- subset(strikeout,franchise == 'OAK')
oakland <- oakland[order(oakland$kpg,decreasing=T),]

plot(oakland$year,oakland$kpg)

plot(oakland$year,oakland$kpg,pch=16,col="red",main="Strike per game",xlab="Year",ylab="Ks per game",ylim=c(0,max(oakland$kpg)))

min <- subset(strikeout,franchise == 'MIN')
plot(min$year, min$kpg, pch=16, col="blue", main="Strikeouts per game: Minnesota",xlab="Year", ylab="Ks per game", ylim=c(0, max(min$kpg)))
points(oakland$year,oakland$kpg,pch=16,col="red")
lines(min$year,min$kpg,col = "blue",lwd=2)
lines(oakland$year,oakland$kpg,col = "red",lwd=2)


leaguage_average <- aggregate(strikeout$kpg,list(strikeout$year),mean)
names(leaguage_average) <- c("year","meankpg")
plot(leaguage_average$year, leaguage_average$meankpg, col="orange", main="MLB mean strikeouts per game",xlab="Year", ylab="Ks per game", type="l", lwd=2)
lines(oakland$year,oakland$kpg,col="red",lwd=2)
