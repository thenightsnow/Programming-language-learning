# ggplot2
## ggplot函数
### 基础知识
1. 基础语法:ggplot(data, mapping=aes(x, y))
   1. 数据：data是数据集
   2. 美学映射：mapping是从数据到图形属性的映射关系
   3. 图层:

2. 图层组件
   1. 图层（layer）：包括几何形状和统计变化，一般用geom_或者stat_开头的函数
      1. 一种标度转换：数据和图形属性的映射
      2. geom:几何对象，每个geom有一个默认的stat变换
         1. geom_point():需要x轴和y轴，点图
         2. geom_line():需要x轴和y轴，线图
         3. geom_density():只需要y轴，密度图
         4. geom_boxpolt():需要x轴和y轴，箱型图
         5. geom_violin():x,y;小提琴图
         6. geom_histogram():x;直方图
         7. geom_bar():x;条形图。默认的是count，可以用identity函数赋予权重
         8. geom_smooth(method = "lm"):拟合一条直线，会有标准差阴影。里面的参数可以不加，lm就是直线
      3. stat:统计变换
         1. state_count():统计每个分类的数量
         2. stat_bin():将数据分为多个区间，并统计每个区间的数量
         3. stat_summary():对数据进行汇总，包括均值、方差、最小值、最大值等
         4. stat_smooth():拟合一条曲线，会有标准差阴影。里面的参数可以不加，lm就是直线
      4. 位置调整
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
   2. 标度（scales）：控制数据到图形的映射
      1. 标度转换：先于统计变换，如取对数、平方等
      2. 标度训练：根据所有数据集里数据的范围得到整体数据的范围
      3. 标度映射：数据属性映射到图形空间，如color、size、shape等
         1. colour:
            1. 在aes中添加颜色:aes(displ,hwy,color=class)，可以根据给定的数据集中的参数的类别进行自动分配颜色
            2. 在geom中添加颜色：geom_point(color='blue')，让所有点变色
         2. 像素相关：形状、大小等
   3. 坐标系（coord）：coordinate system，数据以什么样的坐标系映射到图形窗口
      1. 常见坐标系：
         1. 笛卡尔坐标系
         2. 极坐标系：coord_polar()，可以用折线的形式连接，也可以用柱状图或其他方式连接（需要在图层中加载函数）
      2. 坐标调整函数：
         1. coord_cartesian(ylim = c(0,100))，调整y轴的范围
         2. coord_fixed(ratio = 1)：固定比例，使图形保持比例不变
         3. coord_flip()：翻转坐标轴
         4. coord_trans()：坐标变换，包括log,sqrt,reverse等
         5. coord_quickmap()：快速映射，适用于地图数据
   4. 分面（facet）：按不同的数据类别分别绘图，并放在一张图形中
      1. 根据类别将图放在不同位置：facet_wrap(~class)，第一个参数是一个formula，表示将数据按照class分组，第二个参数表示每组图放在一行
      2. 根据两个类别将图放在不同位置：facet_grid(class~.)，第一个参数表示将数据按照class分组，第二个参数表示每组图放在一列

3. 图层对象
   1. 打印：print(p)
   2. 保存：ggsave(filename, plot = p)
   3. 显示：ggplotly(p)
   4. 总结：summary(p),包含数据、映射、图层、标度、坐标系、分面等信息

### 图层组件
1. 图层语法
   1. 基础：layer (goom, goom_params, stat, otat_params, data, mapping, position)
   2. 快捷语法：
      1. geom_xxx(mapping = aes(x, y), stat = "stat_xxx", position = "position_xxx")
      2. stat_xxx(mapping = aes(x, y), position = "position_xxx")
2. 数据：必须是data.frame格式的数据集，或者可以转换为data.frame格式的数据集
   1. 更改数据集：`%+%`运算符，可以将多个数据集连接起来，并生成一个新的data.frame数据集
3. 图形属性映射：
   1. 映射函数：`aes(x, y, color, shape, size, alpha, linetype, label)`
   2. 映射添加、修改、删除：`+`运算符，可以添加新的映射，修改已有映射，删除已有映射


## qplot函数(快速画图)
1. 基础语法：qplot(x, y, data = data, geom = 'point', ...)
   1. 基本参数：坐标轴和数据集
      1. x,y：数据集中的变量
      2. data：数据集
      3. geom：图形类型,可以是其中之一，也可以是图形组合，如：geom = c('point', 'smooth')
         1. scatter：散点图
         2. line：折线图
         3. smooth：拟合曲线，span参数可以控制平滑程度，se=TRUE可以显示标准差,method参数可以选择拟合方法，lm是线性回归
         4. bar：条形图,weight参数可以控制每个组的权重
         5. boxplot：箱型图
         6. violin：小提琴图
         7. histogram：直方图,binwidth参数可以控制直方图的宽度,..density..参数可以显示密度图
         8. density：密度图,adjust参数可以控制密度的调整方式，默认是频数，density参数可以选择密度的计算方式，默认是密度
   2. 分面(facet)
   3. 其它参数：
      1. color：颜色
      2. fill：填充颜色
      3. shape：形状
      4. size：大小
      5. alpha：透明度
      6. linetype：线型
      7. label：图例标签
      8. title：标题
      9.  xlab：x轴标签
      10. ylab：y轴标签
      11. xlim：x轴范围
      12. ylim：y轴范围
      13. main：主标题