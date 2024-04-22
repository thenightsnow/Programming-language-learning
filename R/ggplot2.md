# ggplot2
## ggplot函数
1. 基础语法
   1. 数据：
   2. 美学映射：
   3. 图层:

2. 构图要素
   1. 图层（layer）：包括几何形状和统计变化，一般用geom_或者stat_开头的函数
      1. geom:
         1. geom_point():需要x轴和y轴，点图
         2. geom_line():需要x轴和y轴，线图
         3. geom_density():只需要y轴，密度图
         4. geom_boxpolt():需要x轴和y轴，箱型图
         5. geom_violin():x,y;小提琴图
         6. geom_histogram():x;直方图
         7. geom_bar():x;条形图
         8. geom_smooth(method = "lm"):拟合一条直线，会有标准差阴影。里面的参数可以不加，lm就是直线
      2. stat:
   2. 标度（scales）：数据空间到美学空间的映射，如colour，shape，size等
      1. colour:
         1. 在aes中添加颜色:aes(displ,hwy,color=class)，可以根据给定的数据集中的参数的类别进行自动分配颜色
         2. 在geom中添加颜色：geom_point(color='blue')，让所有点变色
   3. 坐标系（coord）：coordinate system，数据以什么样的坐标系映射到图形窗口
      1. 极坐标系：coord_polar()，可以用折线的形式连接，也可以用柱状图或其他方式连接（需要在图层中加载函数）
   4. 分面（facet）：按不同的数据类别分别绘图，并放在一张图形中
      1. 根据类别将图放在不同位置：facet_wrap(~class)
   5. 主题（theme）：图形外观的其他设置，包括图例、背景、坐标轴等（theme()）
      1. 坐标轴：axis.text.x = element_text(angle = -30,size = 20,colour = 'red')，调了x轴的倾斜角度、字体大小和颜色
      2. 图例：legend.text = element_text(size = 15)，调整图例基本内容字体大小;legend.position = 'bottom'，位置默认在右边，调到下面；legend.title = element_text(size = 15,face = 'bold')，调整图例的标题
      3. 标题：ggtitle('标题')
3. 