library(ggplot2)
library(carData)
library(effects)

d <- subset(diamonds,carat<2.5 & 
              rbinom(nrow(diamonds),1,0.2)==1)
d$lcarat <- log10(d$carat)
d$lprice <- log10(d$price)

detrend <- lm(lprice ~ lcarat,data=d)
d$lprice2 <- resid(detrend)

mod <- lm(lprice2 ~ lcarat*color,data = d)

effectdf <- function(...){
  suppressWarnings(as.data.frame(effect(...)))
}

color <- effectdf("color", mod)
both1 <- effectdf("lcarat:color",mod)
carat <- effectdf("lcarat",mod,default.levels = 50)
both2 <- effectdf("lcarat:color",mod,default.levels = 3)

qplot(lcarat,lprice,data=d,color=color)
qplot(lcarat,lprice2,data=d,color=color)

f <- ggplot(mapping = aes(y=fit,ymin=lower,ymax=upper))+
  ylim(range(both2$lower,both2$upper))
f %+% color +aes(x=color) +geom_point()+geom_errorbar()
f %+% both2 +
  aes(x=color,color=as.factor(lcarat),group=interaction(color,lcarat)) +
  geom_errorbar() + geom_line(aes(group=factor(lcarat)))+
  scale_color_brewer()
