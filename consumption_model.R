# load the data
library(stargazer)
df <- read.csv("CONS9.csv")
reg1 <- lm(con ~ dpi + aaa, data = df)
summary(reg1)
res <- residuals(reg1)
plot(df$year, res, type="l", xlab='year', ylab='residual',main='residuals over time')

library(lmtest)
dwtest(reg1)

library(prais)
reg2<- prais_winsten(con ~ dpi + aaa, index = "year", data = df)
summary(reg2)
