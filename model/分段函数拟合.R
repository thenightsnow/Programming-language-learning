# 安装并加载ggplot2包
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 设置随机数种子，以便结果可重现
set.seed(123)

# 生成模拟数据
x <- runif(100, min = 0, max = 10)  # 生成自变量x，在0到10之间均匀分布
y <- ifelse(x < 5, -2 * (x - 5) + 5, 2 * (x - 5)+5) + rnorm(100, mean = 0, sd = 1)  # 生成因变量y，分段函数关系加上一些随机噪声

# 创建数据框
data <- data.frame(x, y)

# 使用ggplot2绘制散点图
p <- ggplot(data, aes(x = x, y = y)) +
  geom_point(alpha = 0.6, size = 2, color = "black") +  # 添加散点图
  labs(title = "非线性拟合2", x = "自变量 X", y = "因变量 Y") +
  theme_minimal()  # 使用简洁的主题

# 添加分段函数线
p <- p + geom_segment(aes(x = 0, y = 15, xend = 5, yend = 5), color = "black",size=1.5)  # 从x=0到x=5的直线（向下）
p <- p + geom_segment(aes(x = 5, y = 5, xend = 10, yend = 15), color = "black",size=1.5)  # 从x=5到x=10的直线（向上）

# 自定义主题设置
p <- p + theme(
  plot.title = element_text(hjust = 0.5, face = "bold"),  # 大标题居中并加粗
  axis.line = element_line(colour = "black", size = 2),  # 显示坐标轴线并加粗
  panel.grid = element_blank(),  # 隐藏背景网格线
  axis.ticks = element_blank(),  # 隐藏坐标轴上的刻度
  axis.text = element_blank(),  # 隐藏坐标轴上的刻度值
  axis.title = element_text(color = "black", size = 12, face = "bold")  # 加粗坐标轴标题
) +
  scale_x_continuous(limits = c(0, 10), expand = c(0, 0)) +  # 设置x轴限制
  scale_y_continuous(limits = c(0, 20), expand = c(0, 0))  # 设置y轴限制

# 打印图形
library(export)
graph2ppt(p, file = "my_presentation.pptx", width = 5, height = 5)