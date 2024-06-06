# Numpy使用

## 优势
1. 快速向量化阵列操作用于数据绿化和清洗，构造子集和过滤，变换
2. 常见的数组算法有排序、唯一、集合运算等
3. 高效的描述性统计和汇总/汇总数据
4. 将条件逻辑表示为数组表达式，而不是带有if - Elielse分支的循环
5. 分组数据操纵(聚合、变换、函数应用)

## 多维数组对象（N-dimensional array，ndarray）
1. 创建多维数组
   1. 列表、元组、数组、其它序列转换：np.array()
      1. 转换成一维数组：`data1 = [6, 7.5, 8, 0, 1]; np.array(data1) `
      2. 转换成多维数组：`data2 = [[1, 2, 3], [4, 5, 6]]; np.array(data2)`
   2. 列表、元组、其它序列转换：np.asarray()，是数组了就不用转换
   3. 创建空数组: 传入一个元组（例如：（2,2,2,2））作为数组的shape
      1. np.zeros(): `np.zeros((2,2)) `
      2. np.zeros_like(): `np.zeros_like(arr) `,传入一个数组，生成一个相同形状的全0数组
   4. 创建全1数组: 
      1. np.ones(): `np.ones(5) `
      2. np.ones_like(): `np.ones_like(arr) `,传入一个数组，生成一个相同形状的全1数组
   5. 创建一个空数组（未定义数值）: 
      1. np.empty(): `np.empty((2,2)) `
      2. np.empty_like(): `np.empty_like(arr) `,传入一个数组，生成一个相同形状的空数组
   6. 创建一个序列数组：np.arange()
      1. 创建从0到10的数组：`np.arange(11) `
   7. 创建一个随机数数组：是np.random模块的内容
      1. `np.random.rand()`：生成0到1之间的随机数
      2. `np.random.randn()`：生成标准正态分布的随机数
      3. `np.random.randint()`：生成随机整数
      4. `np.random.normal(size=())`:生成正态分布的随机数,可以指定正态分布的均值和标准差
2. 数据类型：内存需要将一块数据都解释成特定的数据类型
   1. dtype属性：`arr.dtype`
   2. 数据类型定义：
      1. 在创建时定义：`arr = np.array([1, 2, 3], dtype=np.int64)`
      2. 转换数据类型：`arr.astype(np.float64)`,会返回一个新的数组，数据类型转换为float64，但原数组不变
3. 形状：
   1. shape属性：`arr.shape`，一般在创建的时候就需要给一个形状
   2. 改变形状：`arr.reshape(2, 3)`
4. 索引和切片：
   1. 索引：
      1. 基本索引：
         1. 单个值索引：根据创建时的维度，每个维度的都从0开始，进行索引
         2. 多个值索引：给出每个维度的索引值列表，返回对应位置的数组值
      2. 布尔索引：给出一个布尔数组，返回对应位置的数组值
         1. 一维布尔数组：索引出为true的值或者行、列等
         2. 多维布尔数组：要与索引的数组对应
      3. 布尔索引+整数索引：一个维度用布尔、一个维度用整数
   2. 切片：
      1. 一维数组的切片：和列表切片一样
      2. 多维数组的切片：每个维度上和一维数组切片一样，然后用逗号隔开
5. 转置矩阵和换位轴：
   1. 转置：
      1. 一维数组：`arr.T`
      2. 多维数组：`arr.transpose((1,0,2))`，需要接收一个轴向转置参数，就是轴的转换
    2. 换位轴：
      1. 交换两个轴：`arr.swapaxes(0, 1)`，交换第一维度和第二维度的轴

## 常用函数（见《python for data analysis》P107页往后的内容）
1. 基本函数
   1. 一元功能函数：以一个数组为参数，允许接收一个参数，让数据在原数组上操作
      1. np.abs()：取绝对值
      2. np.sqrt()：开方
      3. np.exp()：指数
      4. np.log()：对数
      5. np.sin()：正弦
      6.  np.floor()：向下取整
      7.  np.ceil()：向上取整
      8.  np.round()：四舍五入
      9.  np.sum()：求和
      10. np.mean()：求平均值
   2.  二元功能函数：以两个数组为参数
      1. np.add()：加法
      2. np.subtract()：减法
      3. np.multiply()：乘法
      4. np.divide()：除法
      5. np.power()：幂
      6. np.mod()：取模
      7. np.maximum()：取最大值
      8. np.minimum()：取最小值
      9. np.greater()：大于
      10. np.less()：小于
      11. np.equal()：等于
      12. np.not_equal()：不等于
      13. np.logical_and()：逻辑与
      14. np.logical_or()：逻辑或
      15. np.logical_not()：逻辑非
2. 数组操作函数
   1. np.meshgrid()：生成网格坐标,取两个一维数组，生成两个二维数组，第一个数组为行坐标，第二个数组为列坐标（往后以此类推）
      1. 二维网格：`x, y = np.meshgrid(np.arange(0, 1, 0.1), np.arange(0, 1, 0.1))`
      2. 三维网格：`x, y, z = np.meshgrid(np.arange(0, 1, 0.1), np.arange(0, 1, 0.1), np.arange(0, 1, 0.1))`
   2. np.where(cond, x, y)：根据条件选择数组元素,x和y可以是数组，也可以是标量，返回一个数组
      1. 条件（cond）：布尔数组，True表示选择x，False表示选择y
      2. x：选择条件为True的元素
      3. y：选择条件为False的元素
3. 数理统计函数（只列一部分）
   1. 求平均值:`np.mean(arr)`或者`arr.mean(axis=0)`,axis=0表示按列求平均值
   2. 求总和：`np.sum(arr)`或者`arr.sum(axis=0)`
   3. 从低维切片计算累加：`np.cumsum(arr, axis=0)`或者`arr.cumsum(axis=0)`
   4. 从低纬切片计算累乘：`np.cumprod(arr, axis=0)`或者`arr.cumprod(axis=1)`
   5. 布尔运算：`(arr > 0).sum()`,`(arr > 0).any()`,`(arr > 0).all()`
   6. 排序：`np.sort(arr)`或者`arr.sort(axis=1)`
   7. 返回唯一值：`np.unique(arr)`
4. 线性代数函数（只列一部分）
   1. 矩阵乘法：`np.dot(arr1, arr2)`
   2. 矩阵求逆：`np.linalg.inv(arr)`

## 数据保存与读取
1. 保存为numpy文件：
    1. npy格式（单个数组）：`np.save('my_array', arr)`
    2. npz格式（多个数组）：
       1. 直接保存：`np.savez('my_arrays.npz', x=x, y=y)`
       2. 压缩的形式保存：`np.savez_compressed('my_arrays.npz', x=x, y=y)`
