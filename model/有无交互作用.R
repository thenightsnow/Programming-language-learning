install.packages("bruceR",dep=TRUE)
library(bruceR)

data = import('C:\\Users\\Jack Ye\\Desktop\\工作簿1.xlsx', sheet='无交互作用')
# 将字符型变量转换为因子
data$因子A <- factor(data$因子A)
data$因子B <- factor(data$因子B)

# 将因子转换为数值型
data$因子A <- as.numeric(data$因子A)
data$因子B <- as.numeric(data$因子B)data$`Y值（因变量）`

model <- lm(`Y值（因变量）` ~ 因子A, data = data)
summary(model)
model1 <- lm(`Y值（因变量）`~ 因子B, data = data)
summary(model1)
model2 <- lm(`Y值（因变量）`~ 因子B + 因子A, data = data)
summary(model2)

data1 = import('C:\\Users\\Jack Ye\\Desktop\\工作簿1.xlsx', sheet='有交互作用')
data1$因子A <- factor(data1$因子A)
data1$因子B <- factor(data1$因子B)

# 将因子转换为数值型
data1$因子A <- as.numeric(data1$因子A)
data1$因子B <- as.numeric(data1$因子B)

model <- lm(`Y值（因变量）`~ 因子A, data = data1)
summary(model)
model1 <- lm(`Y值（因变量）`~ 因子B, data = data1)
summary(model1)
model2 <- lm(`Y值（因变量）`~ 因子B + 因子A, data = data1)
summary(model2)
model2 <- lm(`Y值（因变量）`~ 因子B * 因子A, data = data1)
summary(model2)
