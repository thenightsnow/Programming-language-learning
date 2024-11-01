
library(export)
# 安装并加载ggplot2包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 设置随机数种子，以便结果可重现
set.seed(123)

# 生成模拟数据
n <- 100  # 数据点的数量
x <- runif(n, min = 0, max = 10)  # 生成自变量x，在0到10之间均匀分布
y <- 5*x + rnorm(n, mean = 0, sd = 3)  # 生成因变量y，斜率设置为5，并添加更多的随机噪声

# 创建数据框
data <- data.frame(x, y)

# 用lm()函数拟合线性回归模型
model <- lm(y ~ x)

# 使用ggplot2绘制散点图，并添加回归线
p <-ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = 0.6, size = 2, color = "black") +  # 添加散点图，调整透明度和大小
  geom_smooth(method = "lm", color = "black", se = FALSE) +  # 添加线性回归线，不显示置信区间
  labs(title = "线性回归", x = "自变量 X", y = "因变量 Y") +
  theme_minimal() +  # 使用简洁的主题
  theme(  # 自定义主题设置
    plot.title = element_text(hjust = 0.5, face = "bold"),  # 大标题居中并加粗
    axis.line = element_line(colour = "black", size = 1.5),  # 显示坐标轴线并加粗
    panel.grid = element_blank(),  # 隐藏背景网格线
    axis.ticks = element_blank(),  # 隐藏坐标轴上的刻度
    axis.text = element_blank(),  # 隐藏坐标轴上的刻度值
    axis.title.x = element_text(color = "black", size = 12, face = "bold"),  # 加粗x轴标题
    axis.title.y = element_text(color = "black", size = 12, face = "bold")   # 加粗y轴标题
  ) +
  scale_x_continuous(limits = c(0, max(x)), expand = expansion(mult = c(0, 0.1))) +  # 设置x轴限制并通过原点
  scale_y_continuous(limits = c(0, max(y)), expand = expansion(mult = c(0, 0.1)))   # 设置y轴限制并通过原点

graph2ppt(p, file = "my_presentation.pptx", width = 5, height = 5)