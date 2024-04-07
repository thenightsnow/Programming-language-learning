# R语言学习

## 文件导入和输出
1. 将结果导入到文件：
   1. txt文件：
      1. cat函数：
         1. 基础用法：`cat(1, "加", 1, "等于", 2, '\n')`，可以拼接各个数据
         2. 将函数中的结果到文件：`cat("RUNOOB", file="D:\\r_test.txt")`，可以用参数`append=TRUE`来扩写内容，而不是覆写
      2. sink函数：
         1. 将控制台的结果输出到文件：`sink("D:\\r_test.txt")`，可以用参数`split=TRUE`将结果也展示在控制台，用参数`append=TRUE`来扩写内容
2. 将文件内容读出：
   1. txt文件：
      1. readLines函数：`readLines("D:\\r_test.txt")`，行与行之间需要有换行符，包括最后一行

## 数据类型
1. 数字
   1. 数字常量：一般型和科学计数法
      1. 按对象分类：
         1. 向量：`a = vector(3, 4)`，可以通过下标取出`a[2]`，没有偏移量
            1. 方法1：`a=c(1,2,3)`
            2. 方法2(min:max)：`a=1:5`
            3. 方法3(seq函数)：`a=seq(1,9,2)`，1到9的等差数列；`seq(0, 1, length.out=3)`，0到1的三个等差数
            4. 方法4(rep函数)：`rep(0, 5)`重复函数
         2. 列表
            1. 创建列表：
               1. 基本方式：`list()`
               2. 采用(c())：`my_list <- c(object1, object2, object3)`
            2. 列表元素命名：`names(list_data) <- c("Sites", "Numbers", "Lists")`
            3. 访问元素
               1. 根据索引：`list[1]`
               2. 根据名字：`list$a`
            4. 添加、删除、更新元素
            5. 合并列表：`c()`
            6. 转为向量：`unlist()`
         3. 矩阵
            1. 创造矩阵：`matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL)`
               1. 通过向量创造：`matrix(vector, 2, 3)`，按列填充。按行填充需要传递参数`byrow=TRUE`
            2. 矩阵的行列命名：`colnames(m1) = c("x", "y", "z") rownames(m1) = c("a", "b")`
            3. 矩阵转置：`t()`
            4. 访问橘政元素：`P[1,3],P[2,],P[,3]`
         4. 数组
            1. 创建数组：`array(data = NA, dim = length(data), dimnames = NULL)`，dim指定数组维度，可以为(2,3,4)；dimnames指定数组维度名称，可以是(行名，列名，矩阵名)
               1. 可以用矩阵和列表表示数组
            2. 访问数组元素：
               1. 访问单个元素：`P[1,2,1]`
               2. 访问多个元素：`P[c(1,2),c(2,3),c(1,2)]`
               3. 其他访问：`P[3,,2],P[,,2]`
            3. 操作数组：`apply(X, MARGIN, FUN, ...)`
         5. 因子
            1. 创建因子：`factor(x = character(), levels, labels = levels, exclude = NA, ordered = is.ordered(x), nmax = NA)`，水平值不指定就是向量的各个值，标签顾名思义
            2. 生成因子水平：`gl(n, k, length = n*k, labels = seq_len(n), ordered = FALSE)`
         6. 数据框
            1. 创建数据框：`data.frame(…, row.names = NULL, check.rows = FALSE,check.names = TRUE, fix.empty.names = TRUE,stringsAsFactors = default.stringsAsFactors())`
               1. 使用(cbind()):`cbind(sites,likes,url)`，将多个向量合并成一个数据框
               2. 使用(rbind()):`rbind(table,newtable)`，将两个数据框合并
            2. 概要信息：`summary()`
            3. 提取元素
               1. 提取指定列：`data.frame(table$姓名)`
               2. 提取某行、某列：`table[1:2,],table[,1:2],table[c(2,3),c(1,2)]`
            4. 扩展
               1. 扩展列：`table$部门 <- c("运营","技术","编辑")`
   2. 逻辑
   3. 字符串
      1. 创建：用单引号或者双引号
      2. 相关操作：
         1. 连接字符串：`paste()`
         2. 格式化字符串或数字：`format()`
         3. 截取字符串：`substring()`
         4. 字符串替换：`gsub()`

## 判断语句
1. if
   1. 单个if：`if(boolean_expression) { 布尔表达式为真将执行的语句}`
   2. if...else...:`if(boolean_expression) {如果布尔表达式为真将执行的语句} else {如果布尔表达式为假将执行的语句}`
   3. if...else if...else
2. switch
   1. 当表达式是整数：返回case位置值。`x <- switch(3,"google","runoob","taobao")`
   2. 当表达式是字符串：返回case中变量名对应的值。`switch("runoob", google="www.google.com", runoob = "www.runoob.com", taobao = "www.taobao.com")`

## 循环
1. 循环类型：
   1. repeat:`repeat { 相关代码 if(condition) {break}}`
   2. while:`while(condition){statement(s);}`
   3. for:`for (value in vector) {statements}`
2. 循环控制：
   1. break
   2. next：跳过当前循环，进入下一循环。类似于其他函数的continue

## 函数
1. 定义函数：
   1. 基本形式：`function_name <- function(arg_1, arg_2, ...) {# 函数体 return(output)}`
   2. 组成部分：函数名、参数、函数体、返回值
2. 懒惰计算：R函数对参数的计算是懒惰的，只有我们在计算它的时候才会调用
   1. 示例：`f <- function(x) {10}  f()`，该函数并未调用x，所以不会报错