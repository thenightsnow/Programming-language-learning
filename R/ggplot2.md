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
      2. 标度训练：根据所有数据集里数据的范围得到整体数据的范围，用于控制多个图层中数据到图形的映射范围
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
   1. 基础：layer (geom, geom_params, stat, otat_params, data, mapping, position)
   2. 快捷语法：
      1. geom_xxx(mapping = aes(x, y), stat = "stat_xxx", position = "position_xxx")
      2. stat_xxx(mapping = aes(x, y), position = "position_xxx")
2. 数据：必须是data.frame格式的数据集，或者可以转换为data.frame格式的数据集
   1. 更改数据集：`%+%`运算符，可以将多个数据集连接起来，并生成一个新的data.frame数据集
3. 图形属性映射：
   1. 映射函数：`aes(x, y, color, shape, size, alpha, linetype, label)`
   2. 映射添加、修改、删除：`+`运算符，可以添加新的映射，修改已有映射，删除已有映射
4. 几何对象：
   1. 几何对象：`geom_xxx()`，见[几何对象类型](补充资料/ggplot/几何对象1.jpg)
   2. 属性：不同的几何对象可以调整的属性不尽相同，见[几何对象属性](补充资料/ggplot/几何对象2.jpg)
5. 统计变换：
   1. 统计变换：`stat_xxx()`，见[统计变换类型](补充资料/ggplot/统计变换1.jpg)
6. 位置调整

### 工具箱
1. 揭示不确定性：误差棒
   1. 常见工具：[可用几何对象](补充资料/ggplot/不确定性.jpg)
2. 统计摘要：
   1. 单独的统计摘要计算函数：`fun.y,fun.ymin,fun.ymax`
   2. 复杂的统计摘要计算函数：`fun.data`,[可用摘要函数](补充资料/ggplot/统计摘要.jpg)
3. 图形注解：注解只是额外的数据
   1. 逐个添加
   2. 批量添加
4. 权重数据

### 标度、坐标轴和图例
1. 标度：
   1. 工作原理：
      1. 变换：数据到图形的映射，先于统计摘要可以让数据在不同的数据变换条件下尺度保持一致
      2. 训练：根据所有数据集里数据的范围得到整体数据的范围，用于控制多个图层中数据到图形的映射范围
      3. 映射：数据属性映射到图形空间，如color、size、shape等
   2. 标度类型：
      1. 位置标度：用于将连续型、离散型和日期-时间型变量映射到绘图区域，以及构造对应的坐标轴；
         1. 基本参数
            1. xlim,ylim：坐标轴范围
            2. expand：坐标轴范围扩大范围，例子：`expand = c(0.1,0.1)`，第一个参数给出乘的溢出，第二个参数给出加的溢出
         2. 连续型：
            1. scale_x_continuous()：用于连续型变量的位置标度，包括：
               1. trans：变换函数，默认是identity，可以选择log10、sqrt、reverse等;等价于scale_x_log10()，但在坐标轴的标签上不一样
            2. scale_y_continuous()：用于连续型变量的位置标度，包括：同上
         3. 日期-时间型：
            1. scale_x_date()：日期-时间型变量的位置标度，包括：
               1. major和minor：以时间为单位设置主刻度和次刻度
               2. format：日期格式，如"%Y-%m-%d"
            2. scale_y_date()：日期-时间型变量的位置标度，包括：
         4. 离散型：
            1. xlim,ylim
      2. 颜色标度：用于将连续型、离散型变量映射到颜色空间，以及构造对应的颜色映射；
         1. 连续型（即渐变色）：
            1. scale_color_gradient()和scale_fill_gradient()：双色梯度，low和high参数控制颜色梯度两端的值
            2. scale_color_gradient2()和scale_fill_gradient2()：三色梯度，low和high参数控制颜色梯度两端的值，mid参数控制中间值
            3. scale_color_gradientn()和scale_fill_gradientn()：多色梯度，low和high参数控制颜色梯度两端的值，n参数控制颜色数;rescale和value参数
         2. 离散型：
            1. 自动选择：scale_color_brewer()和scale_color_hue()，沿着色轮均匀分布的色相选择
            2. 手动选择：scale_color_manual()，手动选择颜色，values参数控制颜色值
      3. 手动标度：用于将离散型变量映射到我们选择的符号大小、线条类型、形状或颜色 ，以及创建对应的图例；
      4. 同一型标度：用于直接将变拭值绘制为图形屈性，而不去映射它们。举例来说，假设我们想要将变讥映射为符号的颜色，而此变从本身就是一个由颜色值组成的向忧，那么我们就无须再将其映射为其他的颜色，直接渲染这些值本身即可.
   3. 通用参数
      1. name：标度名称,xlab,ylab,ggtitle,labs
      2. limits：数据范围
      3. breaks和labels：分割点和标签，有breaks时，labels可以不用设置；但有labels时，breaks必须要设置
      4. formatter：未指定标签则自动格式化标签
2. 图例和坐标轴：参考前面的name部分

### 定位
1. 位置调整：参考前文出现重叠对象部分（dodge、fill、stack、jitter、nudge）
2. 位置标度：参考前文
3. 分面：
   1. 分面类型：
      1. 网格型facet_grid()：两个分面变量，形成一个二维图形。同列面板必须有相同的x轴，同行面板必须有相同的y轴。space参数使标度成比例
      2. 封装型facet_wrap()：一个分面变量，形成一行图形，根据一行图形的数量来将其换行，形成类似二维的效果
   2. 标度控制
      1. 固定：fixed
      2. 自由变化：free，free_x，free_y
   3. 连续型变量处理：
      1. 转换成离散型变量：n个长度相同部分（可以控制分段的数量，或者分段的长度），n个数目点相同的部分
   4. 其它
      1. 分组与分面：分组的数据重叠在一起，可以用分面展示
      2. 并列于分面：可以把并列和分面一起写，而且当两个变量完全交叉但部分组合水平缺失时，分面效果更好
4. 坐标系
   1. 可用坐标系：[坐标系](补充资料/ggplot/坐标系.jpg)
   2. 坐标变换：第一步根据定位确定形状参数，第二步进行转换（分割再组合）
   3. 坐标系种类：
      1. 笛卡尔坐标系：
         1. coord_cartesian()：默认的坐标系，x轴和y轴的范围是一致的，可以用xlim和ylim参数调整
         2. coord_flip()：翻转坐标轴
         3. corrd_trans()：坐标变换，包括log,sqrt,reverse等
         4. coord_equal()：等比例坐标系，使坐标轴的长度相等
      2. 非笛卡尔坐标系：
         1. 极坐标系：coord_polar()，可以用折线的形式连接，也可以用柱状图或其他方式连接（需要在图层中加载函数）
         2. 其他坐标系：coord_map()，可以用地图的形式展示数据，需要加载maptools包

### 其它细节操作
1. 主题：ggplot2的主题系统，可以控制整体的外观和感觉
   1. 内置主题：theme_bw()白色背景和深灰色网线，theme_gray()灰色背景和浅灰色网线。base_size参数可以调整字体大小
   2. 主题设置：
      1. 全局设置：theme_set()返回先前的主题，用于备用，里面的参数可以设置当前的全局主题;theme_update()更新当前主题，用于临时设置;theme_get()获取当前主题
      2. 局部设置：theme()，可以设置多个主题，用+连接，会覆盖全局默认的全局设置。如：theme_bw() + theme(text = element_text(size = 16))
   3. 主题元素和相关函数：
      1. 文本：element_text()，调整主题的文本元素，包括字体、大小、颜色、对齐方式、斜体、下划线、粗体、字体系列等
      2. 线条：element_line()，调整主题背景的线条，包括颜色、粗细、类型、透明度等
      3. 矩阵：element_rect()，调整主题的矩阵元素，包括填充颜色、透明度、边框、线型等
      4. 空白：element_blank()，用于隐藏某些元素
2. 自定义标度和几何对象
   1. updata_geom_defaults()：更新默认的几何对象设置
   2. updata_scale_defaults()：更新默认的标度设置
   3. 几何对象的默认属性：[默认属性](补充资料/ggplot/默认属性.jpg)
3. 储存输出
   1. ggsave()：保存图片，使用png和pdf输出效果最好
4. 一页多图（grid包）
   1. 子图：viewport()函数，可以将一张图分成多个子图，每个子图可以单独调整大小、位置、标题、坐标轴等。例如：viewport(width = 0.5, height = 0.5, x = 0.5, y = 0.5)
   2. 矩阵网络：
      1. 多图：grid.newpage()函数，可以创建新的一页，并在其中绘制多个图
      2. grid.layout()函数，可以设置子图的布局，例如：grid.layout(nrow = 2, ncol = 2)
      3. 示例：
      ```R line-numbers
      library(grid)
      grid.newpage()
      pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 2)))
      vplayout <- function(x, y, width, height) {
        viewport(layout.pos.row = x, layout.pos.col = y)
      }
      print(a,vp=vplayout(1, 1:2))
      print(b,vp=vplayout(2, 1))
      print(c,vp=vplayout(2, 2))
      dev.off()   
      ```

### 数据操作（需要进一步实际操作）
1. dplyr包：数据操纵包，可以对数据集进行过滤、排序、重组、聚合等操作
   1. ddply()：对数据集进行分组操作，可以指定分组变量和操作函数，基本用法是ddply(.data, .groupvar, .fun)
2. reshape2包：数据重塑包，可以将数据集转换成不同的形式
   1. melt()：将数据集转换成长格式，可以指定id变量和measure变量，可以指定其他变量作为分组变量。基本语法形式是melt(data, id.var, measure.var)
   2. dcast()：将数据集转换成宽格式，可以指定id变量和measure变量，可以指定其他变量作为分组变量

### 减少重复操作
1. last_plot()：获取上一次绘制的图形对象，可以重复使用
2. 制作绘图模板：ggplot2的每一个组件都是对象，可以被创建储存并应用于某个图形中
3. 定义绘图函数：可以将绘图过程中的一些参数固定下来，然后定义一个函数，可以重复使用

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