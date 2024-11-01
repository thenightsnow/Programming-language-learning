# 安装并加载ggplot2包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 设置随机数种子，以便结果可重现
set.seed(123)

# 生成模拟数据
x <- runif(100, min = 0, max = 10)  # 生成自变量x，在0到10之间均匀分布
y <- -1.5* (x-4)^2 + 3 * x + 10 + rnorm(100, mean = 0, sd = 5)  # 生成因变量y，倒U型二次关系加上一些随机噪声

# 创建数据框
data <- data.frame(x, y)

# 使用ggplot2绘制散点图，并添加二次函数拟合线
p <-ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = 0.6, size = 2, color = "black") +  # 添加散点图
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "black", se = FALSE) +  # 添加二次函数拟合线，不显示置信区间
  labs(title = "非线性拟合1", x = "自变量 X", y = "因变量 Y") +
  theme_minimal() +  # 使用简洁的主题
  theme(  # 自定义主题设置
    plot.title = element_text(hjust = 0.5, face = "bold"),  # 大标题居中并加粗
    axis.line = element_line(colour = "black", size = 2),  # 显示坐标轴线并加粗
    panel.grid = element_blank(),  # 隐藏背景网格线
    
    axis.ticks = element_blank(),  # 隐藏坐标轴上的刻度
    axis.text = element_blank(),  # 隐藏坐标轴上的刻度值
    axis.title = element_text(color = "black", size = 12, face = "bold")  # 加粗坐标轴标题
  ) +
  scale_x_continuous(limits = c(0, 10), expand = c(0, 0)) +  # 设置x轴限制
  scale_y_continuous(limits = c(0, 20), expand = c(0, 0))  # 设置y轴限制

library(export)
graph2ppt(p, file = "my_presentation.pptx", width = 5, height = 5)