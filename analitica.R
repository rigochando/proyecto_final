GG <- read.csv("GOOG.csv", header=T, dec=".", sep=",")
GG.ts<-ts(GG$Close,start=c(2005,07),freq=12)
plot(GG.ts,type="l",lwd=2, col="red", 
     xlab="Tiempo", ylab="Precio",main="Precio al cierre")

plot(stl(GG.ts,s.window="periodic"))

GG.hw <- HoltWinters(GG.ts)
plot(GG.hw, col = "blue", col.predicted = "red")

GG.hw$SSE
GG.hw$alpha
GG.hw$beta
GG.hw$gamma

head(GG.hw$fitted)

install.packages("forecast")
library(forecast)

infy.fore <- forecast(GG.hw, h=24)
plot(infy.fore)

infy.fore$lower
infy.fore$upper
