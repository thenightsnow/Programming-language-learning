# bruceR

## 安装
1. CRAN平台安装正式版：
```R
install.packages("bruceR",dep=TRUE) # dep=TRUE以安装所有依赖包，否则可能无法正常使用某些函数
```
2. GitHub平台安装开发版：
```R
# 首先安装devtools包
install.packages("devtools")
# 然后安装bruceR包
devtools::install_github("brucehoff/bruceR")
```
## 主要使用函数
1. `set.wd() set_wd()`：设置工作目录，自动获取并设置到当前打开文件（R脚本）的路径。
2. `import()/export()`：一站式导入/导出任意存储格式的数据表
   1. `file`：带后缀的文件名（包括但不限于TXT、CSV、Excel、SPSS、Stata等），如果不设定，则从剪贴板导入/导出至剪贴板
   2. `sheet`：如果是Excel文件，可以额外指定是哪个Sheet表单（默认是第一个Sheet）
   3. `range`：如果是Excel文件，可以额外指定数据的单元格范围（默认是全部单元格）
   4. `encoding`：字符编码（"UTF-8"、"GBK"、"CP936"中的一种），一般用于会出现乱码的使用UTF-8编码的带有中文字符的CSV文件（设为"UTF-8"即可）
   5. `header`：导入时是否把第一行作为变量名（导出时是否包含变量名）？默认是TRUE，可设为FALSE
   6. `as`：导入后使用哪种数据框类型？默认是"data.frame"，可设为"data.table"或"tibble"
3. `print_table()`：打印三线表（输出到R Console或Word文档，是bruceR很多函数调用的基础函数）
   1. `x`：矩阵（matrix）、数据框（data.frame、data.table等）或能够提取出模型系数表的统计模型（lm、glm、lmer、glmer等）
   2. `digits`：保留的小数位数，默认是3位小数
   3. `file`：保存的Word文档（.doc），默认输出到R控制台
   4. ...
4. `model_summary()`：回归模型结果汇总输出（输出到R Console或Word文档）
   1. `model.list`：回归模型（多个模型用list()连接起来），支持多种回归模型的组合（包括但不限于一般线性模型、广义线性模型、混合线性模型、广义混合线性模型等）
   2. `std`：是否换成标准化回归系数（std=TRUE）？默认输出非标准化回归系数（std=FALSE）
   3. `digits`：保留的小数位数，默认是3位小数
   4. `file`：保存的Word文档，默认输出到R控制台
   5. ...
5. `RECODE()`：数值重新编码
   1. `var`：变量
   2. `recodes`：重新编码的规则（一个字符串）
6. `MEAN()`：多变量的横向计算系列函数——求多题平均值（无需额外手动反向计分）.该系列的函数包括MEAN()、SUM()、COUNT()、MODE()、STD()、CONSEC()。
   1. data：数据框（类型可以是data.frame、data.table、tibble）
   2. `var和items`：【变量定义方式①】var和items搭配使用，可定义名称相同、序号不同的多个变量，如var="RSES", items=1:10
   3. `vars`：【变量定义方式②】直接定义多个变量，如vars=c("X1", "X2", "X3", "X4", "X5")
   4. `varrange`：【变量定义方式③】定义多个变量的起止点（按照data的变量顺序依次寻找起止范围内的所有变量），如varrange="A1:E5"
   5. `rev`：定义哪些变量需要反向计分，建议输入原始变量名，如rev=c("E1", "E2")，也可以输入序号，如rev=1:2 —— 不需要提前手动计算反向计分后的新变量！
   6. `likert`：如果使用了rev参数，建议明确定义量表数值范围，如likert=1:6；也可以不定义该参数，将自动从变量中找出最大值和最小值作为范围
7. `Alpha()`：内部一致性信度（输出Cronbach's α、McDonald's ω）,参数同MEAN()系列函数。
8. `EFA()与PCA()`：探索性因素分析与主成分分析，PCA()是EFA()的简单封装，即EFA(..., method="pca")，数据和变量定义方式与MEAN()函数一致
   1. `method`：分析方法，可选择"pca"（默认，主成分分析）、"pa"（主轴因子法）、"ml"（最大似然法）、"minres"（最小残差法）等9种方法
   2. `rotation`：因子旋转方法，可选择"none"（无）、"varimax"（默认，方差最大法）、"oblimin"（斜交旋转法）等6种方法
   3. `nfactors`：因子数量确定方法，可选择"eigen"（默认，根据特征根确定）、"parallel"（根据模拟数据的平行分析确定），或手动输入一个数字（固定数量）
   4. `sort.loadings`：是否按照载荷大小排序？默认是TRUE
   5. `hide.loadings`：隐藏低于某个值的载荷？默认是0（不隐藏）
   6. `plot.scree`：是否画碎石图？默认是TRUE
   7. `kaiser`：是否做Kaiser标准化处理？默认是TRUE，以保持和SPSS的做法与结果一致
   8. `max.iter`：最大迭代次数，默认是25，以保持和SPSS一致
   9. `min.eigen`：如果设置nfactors="eigen"，那么可以设置特征根的阈限，默认是1
   10. `digits`：保留的小数位数，默认是3位小数
   11. `file`：保存的Word文档，默认输出到R控制台
9.  `CFA()`：验证性因素分析
    1. `data`：数据框
    2. `model`：模型语句，类似于lavaan包的写法（但允许更简化、更灵活的写法），如"A =~ a[1:5]; B =~ b[c(1,3,5)]; C =~ c1 + c2 + c3"
    3. `highorder`：高阶因素名称，默认没有
    4. `orthogonal`：潜变量间是否正交，默认是FALSE
    5. `digits`：保留的小数位数，默认是3位小数
    6. `file`：保存的Word文档，默认输出到R控制台
10. `Describe()`：描述统计（输出样本量、平均值、标准差、中位数、偏度、峰度）
    1. `data`：数据框（默认使用所有变量，请提前筛选出想要分析的变量们）
    2. `digits`：保留的小数位数，默认是2位小数
    3. `file`：保存的Word文档，默认输出到R控制台
    4. `plot`：是否画每个变量的分布图、变量间的相关图？默认是FALSE
    5. ……（见原始帮助文档）
11. `Freq()`：频数统计（输出频数与频率%）
    1. `var`：变量（一般使用$从数据框中选取出来）
    2. `label`：如有需要，可以定义数值标签
    3. `sort`：排序方法，默认按照变量数值/标签排序，可选择"-"（按频数从大到小排列）或"+"（按频数从小到大排列）
    4. `digits`：保留的小数位数，默认是1位小数
    5. `file`：保存的Word文档，默认输出到R控制台
12. `Corr()`：相关分析（输出相关系数及其95%置信区间）
    1. `data`：数据框
    2. `method`：相关系数计算方法，默认是"pearson"，可选择"spearman"或"kendall"
    3. `p.adjust`：p值（在多重比较中的）校正方法，默认不校正，可选择"fdr"、"holm"、"bonferroni"等多种方法
    4. `digits`：保留的小数位数，默认是2位小数
    5. `file`：保存的Word文档，默认输出到R控制台
    6. `plot`：是否画相关系数矩阵图？默认是TRUE（需要保证RStudio绘图区域留得够大，不然画不出来）
    7. ……（见原始帮助文档）
13. `TTEST()`：单样本/独立样本/配对样本t检验（输出效应量Cohen's d及其95%置信区间、贝叶斯因子BF10）
    1. `data`：数据框（必须为宽数据，即一行代表一个人，重复测量占多个变量）
    2. `y`：因变量（可批量分析多个因变量；如果是配对样本t检验，则需要是偶数个）
    3. `x`：自变量（可批量分析多个自变量；只有在独立样本t检验中需要定义这个参数）
    4. `paired`：是否为配对样本t检验？默认是FALSE
    5. `var.equal`：是否满足方差齐性？默认是TRUE，结果中有方差齐性Levene检验可供参考
    6. `mean.diff`：是否报告原始的均值差异和95%置信区间？默认是TRUE
    7. `test.value`：假设检验的数值，默认是0（一般用不到这个参数）
    8. `test.sided`：假设检验的方向，默认是双尾（一般用不到这个参数）
    9. `factor.rev`：是否比较“高 vs. 低”而不是“低 vs. 高”？默认是TRUE
    10. `bayes.prior`：贝叶斯检验的先验分布，默认是0.707
    11. `digits`：保留的小数位数，默认是2位小数
    12. `file`：保存的Word文档，默认输出到R控制台
14. `MANOVA()`：多因素被试间/被试内/混合设计方差分析ANOVA（输出效应量partial η²、generalized η²）
    1. `data`：数据框（可以是宽数据，也可以是长数据；函数内部都会自动转换成长数据，然后调用afex包的aov_ez()函数进行ANOVA分析）
    2. `subID`：如果data是长数据（重复测量ANOVA），则必须定义ID变量，因为长数据里面一个被试占多行
    3. `dv`：如果是被试间ANOVA或长数据的重复测量ANOVA，则需要定义单个因变量
    4. `dvs`：如果是宽数据的重复测量ANOVA，则需要定义多个因变量（重复测量），可以是变量范围，如dvs="A1B1:A2B3"
    5. `dvs.pattern`：如果使用了dvs参数，则必须定义变量名的命名规律，比如dvs.pattern="A(.)B(.)"会自动提取"A1B1"、"A1B2"……中的数字作为因素水平；这里需要学习“正则表达式”的用法
    6. `between`：被试间因素的名称
    7. `within`：被试内因素的名称
    8. `covariate`：协变量的名称
    9. `ss.type`：平方和（SS）的计算方法，默认是"III"型SS，还可以是"II"型SS
    10. `sph.correction`：重复测量ANOVA中，违背球形假设后的校正方法，默认是"none"，可选择"GG"（Greenhouse-Geisser）或"HF"（Huynh-Feldt）
    11. `digits`：保留的小数位数，默认是2位小数
    12. `file`：保存的Word文档，默认输出到R控制台
15. `EMMEANS()`：简单效应检验与多重比较（输出效应量Cohen's d及其95%置信区间）
    1. `model`：由MANOVA()函数返回的对象，一般配合管道操作符%>%使用，可叠加多个EMMEANS()分析（无限套娃）
    2. `effect`：待检验的“简单主效应”（如果输入多个，还会报告“简单交互作用”和“简单简单效应”）
    3. `by`：简单效应检验中的“调节变量”（也可以输入多个，则检验“简单简单效应”）
    4. `contrast`：比较方法，默认是"pairwise"，可选择"seq"、"poly"等
    5. `reverse`：是否比较“高 vs. 低”而不是“低 vs. 高”？默认是TRUE
    6. `p.adjust`：p值的多重比较校正方法，默认是"bonferroni"，可选择"none"、"fdr"、"hochberg"、"hommel"、"holm"、"tukey"、"mvt"、"dunnettx"、"sidak"、"scheffe"、"bonferroni"
    7. `sd.pooled`：计算Cohen's d时依据的混合标准差，默认使用“误差均方根”（RMSE）作为混合标准差 ——【免责声明】关于如何确定混合标准差，存在比较大的争议！默认输出的结果并不是唯一正确，仅代表开发者认为的更合理设定！用户对这个参数的设置负有全部责任！
    8. `digits`：保留的小数位数，默认是2位小数