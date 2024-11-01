# 安装并加载ggplot2包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 设置随机数种子，以便结果可重现
set.seed(123)

# 生成模拟数据
x_levels <- factor(rep(c("低", "中", "高"), each = 30))  # 生成自变量x的因子水平
x_numeric <- as.numeric(x_levels)  # 将因子水平转换为数值
n <- length(x_levels)
y <- c(2 * rep(1, 30),  6* rep(1, 30), 4 * rep(1, 30)) + rnorm(n, mean = 0, sd = 1)  # 生成因变量y，分别对应x的三个水平，并添加一些随机噪声

# 创建数据框
data <- data.frame(x = x_numeric, y)

# 使用ggplot2绘制散点图，并为每个水平添加线性回归线
p <-ggplot(data, aes(x = x, y = y)) +
  geom_point(aes(), size = 3, alpha = 0.6) +  # 添加散点图
  geom_smooth(method = "lm", se = FALSE, color = "black", fullrange = TRUE) +  # 添加线性回归线，不显示置信区间
  labs(title = "显著性检验（低中高）", x = "自变量 X", y = "因变量 Y") +
  theme_minimal() +  # 使用简洁的主题
  theme(  # 自定义主题设置
    plot.title = element_text(hjust = 0.5, face = "bold"),  # 大标题居中并加粗
    axis.line = element_line(colour = "black", size = 2),  # 显示坐标轴线并加粗
    panel.grid = element_blank(),  # 隐藏背景网格线
    axis.ticks = element_blank(),  # 隐藏坐标轴上的刻度
    axis.text.x = element_blank(),  # 隐藏x轴上的刻度值
    axis.text.y = element_blank(),  # 隐藏y轴上的刻度值
    axis.title.x = element_text(color = "black", size = 12, face = "bold"),  # 加粗x轴标题
    axis.title.y = element_text(color = "black", size = 12, face = "bold")   # 加粗y轴标题
  ) +
  scale_x_continuous(breaks = c(1, 2, 3), labels = c("低", "中", "高"))  # 设置x轴的水平

library(export)
graph2ppt(p, file = "my_presentation.pptx", width = 5, height = 5)