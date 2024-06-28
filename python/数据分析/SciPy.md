# SciPy包

## 常量模块
1. `scipy.constants`：常量模块，包含物理常数、基本单位、光速、磁通量等。
2. 单位：
   1. 国际单位制词头：`kilo,hecto,centi`，表示单位的倍数和分数;
   2. 二进制前缀：`kibi, mebi, gibi, tebi, pebi, exbi`，字节单位kb为1024；
   3. 质量单位：`gram`，返回千克
   4. 角度单位：`degree`，返回弧度
   5. 时间单位：`second、hour、minute`，返回秒
   6. 长度单位：`light_year、parsec`，返回米
   7. 压强单位：`atm`，返回帕斯卡

## 统计模块
### 基本使用
1. `scipy.stats`：统计模块，包含各种统计分布、函数、随机数生成器等。
2. 参数估计：
   1. 标准误差：`scipy.stats.sem(data)`，参数data为样本数据，返回标准误差。
   2. 样本均值：`scipy.stats.mean(data)`，参数data为样本数据，返回样本均值。
   3. 统计量的值：`t.ppf(0.975, n-1)`，参数n为样本量，返回t分布的0.975分位数。
3. 统计检验：
    1. 均值检验：均返回统计检验值和p值
       1. 两组比较
          1. 单样本t检验：`scipy.stats.ttest_1samp(data, checkvalue)`，参数data为样本数据，checkvalue为总体均值。
          2. 配对t检验：`scipy.stats.ttest_rel(data1, data2)`，参数data1、data2为两组样本数据；将两组数据相减，进行单样本t检验，两者效果一致。
          3. 独立t检验：`scipy.stats.ttest_ind(data1, data2)`
          4. 符号秩和检验：`scipy.stats.wilcoxon(data-checkvalue)`，对应配对t
          5. 秩和检验：`scipy.stats.mannwhitneyu(data1, data2)`，对应独立t
       2. 多组比较
          1. 单因素方差分析：
             1. 简易操作：`scipy.stats.f_oneway(data1, data2, data3,...)`，参数data1、data2、data3为各组样本数据；返回F检验值和p值。
             2. 建模：构建模型：`model = sm.stats.ols('y ~ C(x)', data).fit()`，进行单因素方差分析`result = sm.stats.anova_lm(model)`，返回F检验值、p值等。
                > 采用statsmodels模块进行分析，将所有数据的组别设置为自变量（以数组的方式呈现），将所有数据设置为因变量（以数组的方式呈现）设置为因变量，自变量和因变量的数据要一一对应。将两者保存于字典中。
          2. 多因素方差分析：
             1. 不考虑交互：构建模型`model = sm.formula.ols('y ~ C(x1) + C(x2) + C(x3)', data).fit()`，进行多因素方差分析`result = sm.stats.anova_lm(model)`，返回F检验值、p值等。
             2. 考虑交互：构建模型`model = sm.formula.ols('y ~ C(x1)*C(x2)*C(x3)', data).fit()`，交互作用也可以用x1:x2表示
          

### statsmodels模块
1. `statsmodels`：统计模型模块，包含线性回归、时间序列分析、非参数回归等。
2. 线性回归：