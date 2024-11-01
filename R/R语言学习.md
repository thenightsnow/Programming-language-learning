# R语言学习

## 基本语法
### 文件导入和输出
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

### 数据类型（单一的属性时，都可被视为向量）
1. 数字
   1. 数字常量：一般型和科学计数法               
2. 因子
   1. 创建因子：`factor(x = character(), levels, labels = levels, exclude = NA, ordered = is.ordered(x), nmax = NA)`，水平值不指定就是向量的各个值，标签顾名思义
   2. 生成因子水平：`gl(n, k, length = n*k, labels = seq_len(n), ordered = FALSE)`      
3. 逻辑
4. 字符串
   1. 创建：用单引号或者双引号
   2. 相关操作：
      1. 连接字符串：`paste()`
      2. 格式化字符串或数字：`format()`
      3. 截取字符串：`substring()`
      4. 字符串替换：`gsub()`
5. 特殊值：`NA Inf NaN NuLL`
   1. NaN：Not a Number，表示非数值
   2. Inf：Infinity，表示无穷大
   3. NA：Not Available，表示缺失值
   4. NULL：表示空值

### 数据结构
1. 向量：每个元素必须都是相同的类型，且只有一个值
   1. 方法1：`a=c(1,2,3)`
   2. 方法2(min:max)：`a=1:5`
   3. 方法3(seq函数)：`a=seq(1,9,2)`，1到9的等差数列；`seq(0, 1, length.out=3)`，0到1的三个等差数
   4. 方法4(rep函数)：`rep(0, 5)`重复函数
2. 列表：每个元素可以是任意类型，可以有多个值
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
5. 数据框：每个元素都是一个向量，且长度相同
   1. 创建数据框：`data.frame(…, row.names = NULL, check.rows = FALSE,check.names = TRUE, fix.empty.names = TRUE,stringsAsFactors = default.stringsAsFactors())`
      1. 使用(cbind()):`cbind(sites,likes,url)`，将多个向量合并成一个数据框
      2. 使用(rbind()):`rbind(table,newtable)`，将两个数据框合并
   2. 概要信息：`summary()`
   3. 提取元素
      1. 提取指定列：`data.frame(table$姓名)`
      2. 提取某行、某列：`table[1:2,],table[,1:2],table[c(2,3),c(1,2)]`
   4. 扩展
      1. 扩展列：`table$部门 <- c("运营","技术","编辑")`

### 运算符
1. 算术运算符：`+ - * / ^ %% %/% %*%`
   1. 取余：`%%`
   2. 取模：`%/%`
   3. 点乘（矩阵相乘）：`%*%`
2. 循环补齐(recycling)：做算术运算时，当两个向量长度相等的时候，就一一对应的完成计算；当两个向量长度不相等的时候，短的向量会循环补齐，保持与长向量的长度一致后，再做运算。
3. 关系运算符：`== !=  <  <=  >  >=`，第一向量的每个元素与第二向量的相应元素进行比较，比较的结果是布尔值
4. 逻辑运算符：`& | !`
5. 其它运算符：
   1. `:`：冒号运算符。它按顺序创建一个整数序列
   2. `%in%`：在向量中查找元素，返回逻辑向量

### 判断语句
1. if
   1. 单个if：`if(boolean_expression) { 布尔表达式为真将执行的语句}`
   2. if...else...:`if(boolean_expression) {如果布尔表达式为真将执行的语句} else {如果布尔表达式为假将执行的语句}`
   3. if...else if...else
2. switch
   1. 当表达式是整数：返回case位置值。`x <- switch(3,"google","runoob","taobao")`
   2. 当表达式是字符串：返回case中变量名对应的值。`switch("runoob", google="www.google.com", runoob = "www.runoob.com", taobao = "www.taobao.com")`

### 循环
1. 循环类型：
   1. repeat:`repeat { 相关代码 if(condition) {break}}`
   2. while:`while(condition){statement(s);}`
   3. for:`for (value in vector) {statements}`
2. 循环控制：
   1. break
   2. next：跳过当前循环，进入下一循环。类似于其他函数的continue

### 函数
1. 定义函数：
   1. 基本形式：`function_name <- function(arg_1, arg_2, ...) {# 函数体 return(output)}`
   2. 组成部分：函数名、参数、函数体、返回值
2. 懒惰计算：R函数对参数的计算是懒惰的，只有我们在计算它的时候才会调用
   1. 示例：`f <- function(x) {10}  f()`，该函数并未调用x，所以不会报错

## 包
### 包的管理
1. 包的安装：
   1. 基本形式：`install.packages("package_name")`
   2. 升级包：`update.packages("package_name")`
   3. 卸载包：`remove.packages("package_name")`
2. 包的加载：
   1. 基本形式：`library(package_name)`
   2. 加载多个包：`library(package_name1, package_name2)`
3. 包的使用：
   1. 查看包帮助：`help(package_name)`
   2. 查看包函数：`ls(package_name)`
   3. 使用包函数：`package_name::function_name()`
   4. 导入包函数：`library(package_name)`，然后使用`::`运算符调用函数
4. 包的开发：
   1. 包的结构：
      1. 包名：包名必须是唯一的，不能与其他包重名
      2. 文档：包的说明文档，一般放在包的根目录下，文件名为`DESCRIPTION`
      3. 源文件：包的源代码文件，一般放在包的根目录下，文件名以`.R`结尾
      4. 数据文件：包的数据文件，一般放在包的根目录下，文件名以`.RData`结尾
      5. 其他文件：包的其他文件，一般放在包的根目录下，如`README.md`、`LICENSE`等
   2. 包的构建：
      1. 准备工作：
         1. 安装`devtools`包：`install.packages("devtools")`
         2. 创建包目录：`create_package("package_name")`
      2. 编写源文件：
         1. 编写源文件：`src/package_name.R`
         2. 编写文档：`man/package_name.Rd`
         3. 编写测试文件：`tests/testthat/test_package_name.R`
      3. 构建包：`build("package_name")`

### dplyr包
1. 导入包：`library(dplyr)`
2. 常用函数：
   1. `select()`:选择列，传入列名向量或者有关列的表达式，
   2. `filter()`:过滤行,传入判断条件的逻辑表达式（也有%in%运算符等）
   3. `arrange()`:排序，传入列为正序，用desc()函数可以倒序
   4. `mutate()、transmute()`:新增列（算数、模运算、逻辑运算等），transmute()函数可以只保留新列
   5. `summarize()`:汇总
   6. `group_by()`:分组
   7. `left_join()`:左连接
   8. `inner_join()`:内连接
   9. `full_join()`:全连接
   10. `anti_join()`:反连接
3. 示例：
   ```R line-numbers
   library(dplyr)
   # Example data
   data <- data.frame(
      id = c(1, 1, 2, 2, 3, 3),
      date = as.Date(c("2021-01-01", "2021-01-02", "2021-01-01", "2021-01-02", "2021-01-01", "2021-01-02")),
      category = c("A", "B", "A", "B", "A", "B"),
      value = c(10, 20, 10, 20, 10, 20)
   )
   # Filtering rows where the category is 'A'
   filtered_data <- data %>%
      filter(category == "A")

   # Selecting specific columns
   selected_data <- data %>%
      select(id, value)

   # Arranging rows by value in descending order
   arranged_data <- data %>%
      arrange(desc(value))

   # Adding a new column that is a transformation of existing columns
   mutated_data <- data %>%
      mutate(new_value = value * 10)

   # Summarizing data to find mean value per category
   summarized_data <- data %>%
      group_by(category) %>%
      summarise(mean_value = mean(value))
   ```

### readr包
1. 导入包：`library(readr)`
2. 常用函数：
   1. `read_table()`:读取txt文件，默认使用`\t`分隔符，可以指定分隔符
   2. `read_csv()`:读取csv文件，默认使用`,`分隔符，可以指定分隔符
3. 示例：
   ```R line-numbers
   library(readr)
   # Reading a txt file
   txt_data <- read_table("data.txt")

   # Reading a csv file
   csv_data <- read_csv("data.csv")
   csv_data2 <- read_csv("a,b,c
      1,2,3)
   csv_data3 <- read_csv("The first line of metadata
   The second line of metadata
   x,y,z
   1,2,3
   4,5,6",skip = 2)
   ```
