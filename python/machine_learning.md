# 机器学习

## 模型（理论学习）
### 模型评估与选择
1. 基本概念
   1. 数据集
      1. 训练集：用于训练模型的样本集合。
      2. 测试集：用于评估模型性能的样本集合。
      3. 验证集：用于调整模型参数的样本集合，通常是从训练数据中拆分出来一部分作为验证集。
   2. 误差类型
      1. 经验误差（训练误差）：模型在训练集上的误差。
      2. 泛化误差：模型在测试集或新数据上的误差。
   3. 拟合情况
      1. 过拟合：模型过于复杂，把训练集样本的一些特点当作了所有样本的共性，泛化能力降低，以至于在训练集上表现良好，但在测试集上表现不佳。
      2. 欠拟合：模型过于简单，对训练集的样本没有足够的刻画，训练集的一般性质没有被学到。
   4. 调参：现实生活中常见的做法是将模型的参数给出一个取值范围，然后按照一个步长去取值，进行多次拟合给出最佳参数方案。
   5. 偏差和方差：通常随着训练记得增加，偏差减小，方差增加。两者是冲突的
      1. 偏差：模型的期望预测值与真实值之间的偏离程度。
      2. 方差：模型在不同训练集上预测值的变化程度。
2. 评估方法
   1. 留出法：将数据集分为训练集和测试集，训练集用于训练模型，从而得到测试误差，作为泛化误差的估计。训练集和测试集互斥。
        > 1）测试集和训练集的样本分布要尽可能一致；2）一次抽样得到的测试集和训练集往往不可靠，需要多次重复抽样；3）一般将2/3 ~ 4/5的数据作为训练集，剩下的数据作为测试集。
   2. 交叉验证法：将数据集分为K折，每次使用K-1折作为训练集，剩余一折作为测试集，K次训练，每次测试集的误差求平均。当测试集样本为一个的时候为特例情况，即留一法。
   3. 自助法：对数据集进行n次有放回的抽样，这样形成一个新的数据集，根据概率计算原数据集有36.8%的样本没有被抽到，将这一部分没有被抽到的样本作为测试集。
        > 通常在样本量较小的时候使用
3. 评估标准
    > 性能度量需要结合任务需求，所以模型的好坏采用的标准并不完全一致
   1. 错误率与精度：适用于分类任务
      1. 错误率：错误分类的样本数占所有样本数的比例。
      2. 精度：正确分类的样本数占所有样本数的比例。
   2. 查准率、查全率和F1：当关心分类出的样本中正确的比例
      1. 查准率（P）：查准率是指模型预测为正的样本中，真实为正的样本的比例。
      2. 查全率（R）：查全率是指真实为正的样本中，模型预测为正的比例。
        > 通常，查准率和查全率是相矛盾的，查准率越高，查全率就越低。根据预测结果，将样本排序，最前面的为最可能为正例的数据，最后面为最不可能的数据，这样从前往后将数据当成正例，可以绘制一个P-R曲线（precision-recall curve,查准率为纵轴，查重率为横轴）
      3. F1：查准率和查全率的调和平均值。
            > 查重和查准为了进行权衡，需要取一个平衡点。由于曲线下的面积不好计算，选用了查重和查准相等的点，但这个计算过于简单，最后采用了F1作为度量。 
         1. Fβ：是查准率和查全率的加权调和平均值（对查准和查全的权重不同，β大于1，查全有更大影响）。
         2. 宏F1：是每一次学习训练得到的模型的P、R值的均值求得的
   3. ROC曲线与AUC：适用于二分类任务
      1. ROC曲线（受试者特征曲线）：是横轴为假阳率（FPR，false positive rate）、纵轴为真阳率（TPR，true positive rate）的曲线。
      2. AUC：是ROC曲线下的面积，越大越好。
   4. 代价敏感错误率与代价曲线：错误分类的代价评估
      1. 代价敏感错误率：当代价不同时，机器会倾向于最小化代价，而不是最小化错误率
      2. 代价曲线：横轴是正例概率代价，纵轴是归一化代价
4. 模型比较：比较测试错误率
    > 考虑到机器算法存在随机性、测试集样本不同的差异，需要采用假设检验的方式来断言哪个模型更好。
   1. 假设检验（通常留出法用这个）：和0.3或者其它值进行比较
   2. 交叉验证t检验：两个模型，通过交叉验证得到多个错误率值，进行t检验
   3. McNemar检验：两个模型，对测试集样本进行分类得到正确错误的列联表，类似卡方检验
   4. Friedman检验和Nemenyi事后比较：多个模型，对测试集样本进行分类得到多个错误率值，进行Friedman检验(F检验的非参数检验)
   
### 线性模型
1. 线性回归
   1. 最小二乘法：使得所有实际点到曲线的欧氏距离最小
   2. 正则化：在多元线性回归回归中，可能存在多个解，引入正则化项，来确定学习算法的归纳偏好
   3. 广义线性模型：将输出标记的一个函数映射（单调可微）作为目标，该函数将线性回归模型的实际值和预测值联系起来
2. 对数几率回归（一知半解）
   1. 原理：在进行分类的时候，我们希望大于临界值为1，小于临界值为0，在临界值上为0.5，随机分配。利用广义线性模型的方式，将y值转换成跃迁函数不连续，所以可以用对数几率函数来替代
   2. 估计方法：利用极大似然估计法
3. 线性判别分析（LDA）
   1. 原理：设法将样例投影到一条直线上，使得同类样例在该直线上尽可能的聚集，不同类样例尽可能的分散。
4. 多分类问题
   1. 多个类别分别进行两类学习，建立多个分类模型

### 决策树