# ggplot2
## ggplot函数
1. 基础语法:ggplot(data, aes(x, y))
   1. 数据：data是数据集
   2. 美学映射：aes(x, y)是映射关系，x和y是数据集中的变量名
   3. 图层:

2. 构图要素
   1. 图层（layer）：包括几何形状和统计变化，一般用geom_或者stat_开头的函数
      1. geom:几何目标，每个geom有一个默认的stat变换
         1. geom_point():需要x轴和y轴，点图
         2. geom_line():需要x轴和y轴，线图
         3. geom_density():只需要y轴，密度图
         4. geom_boxpolt():需要x轴和y轴，箱型图
         5. geom_violin():x,y;小提琴图
         6. geom_histogram():x;直方图
         7. geom_bar():x;条形图。默认的是count，可以用identity函数赋予权重
         8. geom_smooth(method = "lm"):拟合一条直线，会有标准差阴影。里面的参数可以不加，lm就是直线
      2. stat:统计变换
         1. state_count():统计每个分类的数量
         2. stat_bin():将数据分为多个区间，并统计每个区间的数量
         3. stat_smooth():拟合一条曲线，会有标准差阴影。里面的参数可以不加，lm就是直线
   2. 位置调整
      1. posiotion：位置调整函数，包括:
         1. position_identity():不调整位置,重叠放在一起
         2. position_dodge():将同一类别的数据分散在同一水平线上
         3. position_fill():将同一类别的数据填充在同一空间上
         4. position_jitter():将同一类别的数据随机扰动
         5. position_nudge():将同一类别的数据相互靠近
         6. position_stack():将同一类别的数据堆叠在一起
      2. 其他位置调整函数：
         1. position_jitterdodge():将同一类别的数据随机扰动并分散在同一水平线上
         2. position_jitterdodge(dodge.width = 0.9):调整扰动的幅度
         3. position_jitter(width = 0.2):调整扰动的幅度
         4. position_stack(reverse = TRUE):将同一类别的数据堆叠在一起，反转顺序
   3. 标度（scales）：数据空间到美学空间的映射，如colour，shape，size等
      1. colour:
         1. 在aes中添加颜色:aes(displ,hwy,color=class)，可以根据给定的数据集中的参数的类别进行自动分配颜色
         2. 在geom中添加颜色：geom_point(color='blue')，让所有点变色
   4. 坐标系（coord）：coordinate system，数据以什么样的坐标系映射到图形窗口
      1. 常见坐标系：
         1. 笛卡尔坐标系
         2. 极坐标系：coord_polar()，可以用折线的形式连接，也可以用柱状图或其他方式连接（需要在图层中加载函数）
      2. 坐标调整函数：
         1. coord_cartesian(ylim = c(0,100))，调整y轴的范围
         2. coord_fixed(ratio = 1)：固定比例，使图形保持比例不变
         3. coord_flip()：翻转坐标轴
         4. coord_trans()：坐标变换，包括log,sqrt,reverse等
         5. coord_quickmap()：快速映射，适用于地图数据
   5. 分面（facet）：按不同的数据类别分别绘图，并放在一张图形中
      1. 根据类别将图放在不同位置：facet_wrap(~class)，第一个参数是一个formula，表示将数据按照class分组，第二个参数表示每组图放在一行
      2. 根据两个类别将图放在不同位置：facet_grid(class~.)，第一个参数表示将数据按照class分组，第二个参数表示每组图放在一列
   6. 主题（theme）：图形外观的其他设置，包括图例、背景、坐标轴等（theme()）
      1. 坐标轴：axis.text.x = element_text(angle = -30,size = 20,colour = 'red')，调了x轴的倾斜角度、字体大小和颜色
      2. 图例：legend.text = element_text(size = 15)，调整图例基本内容字体大小;legend.position = 'bottom'，位置默认在右边，调到下面；legend.title = element_text(size = 15,face = 'bold')，调整图例的标题
      3. 标题：ggtitle('标题')