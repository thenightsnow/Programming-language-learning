# pandas模块使用

## 下载安装

1. pandas模块下载（数据分析）：在终端输入`pip install pandas`
2. matplotlib模块下载（数据可视化）：在终端输入`pip install matplotlib`
3. openpyxl模块下载：在终端输入`pip install openpyxl`
4. scispy模块下载：在终端输入`pip install scipy`

## 基本数据结构
### 序列（series）
1. pd.Series():一个序列，关注的三个方面`.data,.name,.index`，不仅序列有name，index也有name属性。并不清楚是行还是列，只有加入到DataFrame中才会知道。序列有一个apply的方法
   1. 生成：
      1. 直接生成   
         1. 生成方法1：将字典传参，字典的键会成为index。
            1. 仅传入字典：按照字典键的顺序排列
            2. 传入字典和index：按照index的顺序排列，并且字典中的键值不在index中时会出现空值
         2. 生成方法2：将一个列表传给index，另一个表给直接传入
            ```python {.line-numbers}
            import pandas as pd

            d = {'x':100,'y':200,'z':300}
            b = ['x','y','z']
            c = [100,200,300]
            s1 = pd.Series(d)        #生成序列对象方法1
            s2 = pd.Series(c,index=c)       #生成序列对象的方法2
      2. 从dataframe中导出
         1. 方法1（loc，需要用行标签和列标签）：
            1. 仅传入索引名称：`df.loc['内化症状(INT)']`，返回一个索引为列名的序列
            2. 仅传入列名：`df.loc[:,'内化症状(INT)']`，返回一个索引为行名的序列
         2. 方法2（iloc，需要用行位置和列位置）：`df.iloc[:,12]`。需要注意的是，以上两种方法在使用的时候如果列的位置或标签是多个或者一个列表的话，会创建一个dataframe。
         3. 方法3：`df['SUM']`
   2. 切片：操作基本用列表
   3. 序列合并（也可以用于dataframe合并）：`pd.concat([data_1,data_2])`
   4. 函数应用：map(),可以接收一个函数作为参数
2. 将序列以行或者列的方式添加到表单
   1. 以行的形式：直接将创建的序列传给Dataframe
   2. 以列的形式：将名字和列表指进行对应，以字典的形式传递参数
       ```python {.line-numbers}
       import pandas as pd

       s1 = pd.Series([1,2,3],index = [1,2,3], name='A')      #创建三个序列，它们的index都相同。当index不同的时候，会子非并集部分产生空值
       s2 = pd.Series([100,2,3],index = [1,2,3], name='B')
       s3 = pd.Series([1000,2,3],index = [1,2,3], name='C')

       df = pd.DataFrame({s1.name:s1,s2.name:s2,s3.name:s3})      #以列的形式添加进入表单
       df = pd.DataFrame(s1,s2,s3)        #以行的形式添加进入表单
### 表单（dataframe）
1. pd.Dataframe:一个表单，关注`.data,.coumns,.index,.name`,索引和表单都有名称
   1. 生成方法：（有很多）
      1. 传入字典：字典的键会成为列名，字典的值会成为行数据（列排序可以传入coumns参数进行修改，index可以传入index参数进行修改）
      2. 传入列表：列表的第一个元素会成为列名，剩余的元素会成为行数据
      3. 传入numpy数组：numpy数组的第一维会成为行数据，第二维会成为列数据
      4. 传入Series：传入Series会将Series的index作为行名，Series的name作为列名，Series的data作为行数据
   2. 添加数据：
      1. df.['new_column'] = new_data：添加一列数据。如果data是一个值，该列都等于这个数值；如果data是一个序列，则会对应索引位置进行填充；如果是一个表达式，怎么根据数据情况进行填充
      2. df.loc[new_index] = new_data：添加一行数据
   3. 删除数据：
      1. del df['column_name']：删除一列数据
      2. df.drop(index=1)：删除一行数据
   4. 重设索引：
      1. `obj.reindex(new_index)`：将索引设置为new_index，如果new_index中有原来索引中没有的元素，则会产生空值,还可以传入一个参数，用来说明新的索引的使用
      2. `obj.reset_index()`：返回一个新序列，将索引重置为默认值,传入`inplace=True`参数可以将默认值设置为原来的序列
   5. 函数应用：
      1. apply()方法可以对整个序列或者某一列进行操作，返回一个新的序列或者DataFrame。
      2. applymap()方法可以对整个表单进行操作，返回一个新的表单。
2. 单元格的读取：可以使用for循环对单元格进行填充
   1. 从序列里面读取：`data['ID'].at[1]`
   2. 从DataFrame中读取：`data.at[i,'ID']`

## 文件
1. 创建文件
   1. DataFrame：一个数据帧，相当于excel的一个sheet。传入的参数应该是字典
      1. to_excel：将信息保存至一个新文件
            ```python {.line-numbers}
            import pandas as pd

            df = pd.DataFrame({'ID':[1,2,3],'name':['chen','Jack','Jane']})     #创建一个DataFrame，括号可以是空的，或者是一个字典，而且字典的各个值的数量应该是相同的长度
            df = df.set_index('ID')     #将ID设置为文件的索引。另一种操作为df.set_index('ID',inplace = True)
            df.to_excel('F:/Artical/output.xlsx')       #文件的输出路径，该路径下不能有重名文件，能覆盖？
2. 读取文件
   1. read_excel/csv：读取表格中的信息(见最后面的示例)
      1. header：表头，默认值为0。当第一行数据很脏，用第二行就赋值为1；当没有表头就赋值为None
      2. index_col：第一列默认为index。当知道第一列的内容名字的时候，可以对index_col赋值
      3. skiprow：当前面存在空行，可以使用该语句进行跳过
      4. usecols：仅使用当前选定的列
      5. dytpe：给表格的数据设置类型
            ```python {.line-numbers}
            import pandas as pd

            data = pd.read_excel('F:/Artical/数据处理.xlsx',header = None, index_col = 'ID'，dtype={'ID':str,'Type':str,'Title':str,'firstName':str})        #读取文件
            data.columns = ['ID','Type','Title','firstName']        #给表头输入
            print(data.shape)       #打印行数、列数
            print(data.columns)     #打印表头，表头可以用rename对指定的表头进行更改
            print(data.head())      #打印表格开头5行
            print(data.tail())      #打印表格末尾5行
            data.to_excel('F:/Artical/数据处理1.xlsx')
            data = pd.read_excel('F:/Artical/数据处理.xlsx',skiprow=3,usecols='C:F')          #跳过三个空行，选用C到F列
3. 写入文件
   1. 覆盖：覆盖原有数据，只保留最后一份数据
      ```python {.line-numbers}
      import numpy as np
      import pandas as pd
      s1 = pd.DataFrame(np.array([['s1', 's1', 's1', 's1']]), columns=['a', 'b', 'c', 'd'])
      s2 = pd.DataFrame(np.array([['s2', 's2', 's2', 's2']]), columns=['a', 'b', 'c', 'd'])
      s1.to_excel('test.xlsx', sheet_name="111", index=False)
      s2.to_excel('test.xlsx', sheet_name="222", index=False)	# 只保留此份数据
      
      with pd.ExcelWriter("test.xlsx") as writer:
      # 保留两份数据
         s1.to_excel(writer, sheet_name="111", index=False)
         s2.to_excel(writer, sheet_name="222", index=False)
   2. 新增：保留原有数据，新增一个sheet或修改原有数据
      ```python {.line-numbers}
      book = load_workbook("test.xlsx")	# 该文件必须存在,并且该语句必须在 with pd.ExcelWriter() 之前
      with pd.ExcelWriter("test.xlsx",engine='openpyxl', mode='a',if_sheet_exists='overlay') as writer:
         writer.workbook = book
         s2.to_excel(writer, sheet_name="222", index=False)	
         # 新增一个sheet 并写入,如果这里这里指定的sheet已经存在,那么会在该名称后追加1,2,3,... 创建一个新的sheet写入,不会在原有sheet上。
         sheet = book['222']	# 通过sheet名称 获取 sheet
         sheet.cell(2, 1, 'hello')	# 修改第二行第一列的值
         sheet['b2'] = '你好'	# 修改 b2 单元格的值
   3. 追加：可以在Excel中追加，也可以在pandas中先合并之后再覆盖
      ```python {.line-numbers}
      row = df.shape[0]	# 获取原数据的行数
      writer.sheets = {sheet.title: sheet for sheet in book.worksheets}
      # 追加新数据,追加前必须先格式化新数据,否则新数据缺少列,或是列顺序不对会导致数据紊乱
      s4.to_excel(writer, sheet_name='111', startrow=row + 1, index=False, header=False)

## 数据处理
1. 基本操作
   1. 初等运算：只陈列部分
      1. 加法：`df['A'] + df['B']`或者`series1 + series2`或者`df1+df2`或者`df1.add(df2)`,在add前面加上一个r会是df2加df1
      2. 减法：`df['A'] - df['B']`
      3. 乘法：`df['A'] * df['B']`
      4. 除法：`df['A'] / df['B']`
   2. 空值填充：
      1. 运算时填充：`df1.add(df2,fill_value=0)`,这样会在运算时将空值的一方填充为0进行计算
      2. 直接填充：使用fillna()方法，对空值的dataframe或者series进行填充
   3. 序列和dataframe的计算：
      1. 按行计算：`df + series1`，是表单的每一行与序列进行计算（序列的索引与表单列名相同的对应计算，不同的为空值），得到一个新的表单
      2. 按列计算：`df.mul(df2,axis=1)`，是表单的每一列与另一个表单进行计算（表单的列名相同的对应计算，不同的为空值），得到一个新的表单
2. 统计分析：可查看[Pandas API](https://pandas.pydata.org/docs/reference/index.html)
   1. 均值、和、标准差、方差(也可察看《python for data analysis》P160)
      ```Python {.line-numbers}
      import pandas as pd
      import numpy as np 

      data = pd.read_excel('F:/Article/数据处理.xlsx',nrows=10)
      temp = data[['合理程度','伤害意愿']]      #取其中两列
      data_sum = temp.sum(axis=1)      #按行计算总和，axis=0或者'coumns'是按列计算，axis=1或者'index'是按行计算
      data_mean = temp.mean(axis=1)    
      data_std = temp.std()      #按列计算标准差
      data_all_mean = temp.mean()   #按列计算均值
      data.corr()     #查看两两相关
      data.cov()     #查看两两协方差
      data.corrwith(temp)     #查看各列数据与temp的相关
      data.describe()     #查看数据集的描述性统计信息
      temp.var()     #计算方差   
      np.mean(a)     #计算均值
      np.average(a, weights = [1, 2, 1, 1])     #计算加权均值，也可以计算均值
      np.var(a)   # 计算总体方差/矩阵所有元素的方差
      np.var(a, ddof = 1) # 计算样本方差
      np.std(a) # 计算总体标准差，具体用法参照之前的方差
      temp = temp._append(data_all_mean,ignore_index=True)
      print(temp)
3. 数据处理
   1. 数据清洗：删除空值、重复值、异常值、缺失值等
      1. 空值判断：`pd.isnull()`或者`pd.notnull()`
   2. 统计函数：
      1. 函数填充：要以已知的数据进行函数处理得到新的值，填充至另一处
         ```python {.line-numbers}
         import pandas as pd
               
         data = pd.read_excel('F:/Artical/数据处理.xlsx',index_col='ID')
         data['name'] = data['Type']*data['Title']       #name列的值是Type列和Title列的乘积填充的。用循环也可以吗，一般只进行部分运算用循环
         data['name'] = data['Type']*0.8     #name列的值是Type列的值乘0.8
   
      2. 排序：
         1. 按值排序：`df.sort_values(by='列名',ascending=True)`，ascending默认为True，是从小到大排序
               ```python {.line-numbers}
               import pandas as pd

               data = pd.read_excel('F:/Artical/数据处理.xlsx',index_col='ID')
               data.sort_values(by='Type',inplace=True,ascending=False)        #by后面加要排序的列名，ascending默认为True，是从小到大
               data.sort_values(by=['Type','Title'],inplace=True,ascending=[False,True])       #同时进行两项排序，要在一个排序函数中运行
         2. 按索引排序：`df.sort_index(ascending=True)`，ascending默认为True，是从小到大排序
      3. 排名：df.rank()，ascending控制从小到大还是从大到小
         1. 简单排名：`df.rank()`，从小到大排名，相同值排名为均值
         2. 按最大值排名：`df.rank(method='max')`，相同值取排名最大值
         3. 按数值第一次出现结合从小到大进行排名：`df.rank(method='first')`
      4. 筛选
         1. 筛选独特值：`ser.unique()`，返回独特值数组
         2. 筛选大于或等于或在某个列表内的某个值：`ser[ser>value]`
         3. 布尔筛选：传入一个布尔序列，返回一个新的序列，True的位置保留，False的位置删除
         4. 函数筛选
            ```python {.line-numbers}
            import pandas as pd

            def age_18_to_30(a):        #定义一个用于年龄筛选的函数
            return 18<= a <30

            def level_a(s):     #定义一个水平筛选的函数
            return 85<= s <=100

            students = pd.read_excel('F:/Artical/数据处理1.xlsx',index_col='ID')
            students = students.loc[students['Age']].apply(age_18_to30).loc[students['Score']].apply(level_a)       #loc函数是定位的意思，apply则应用了该函数
            students = students.loc[students.Age.apply(age_18_to30)].loc[students.Score.apply(level_a)]     #和上面是等效的
4. 数据校验
   1. 第一种方法：try-except，用assert语句
      ```Python {.line-numbers}
      import pandas as pd

      def score_validation(row):
      try:
        assert 0<=row['合理程度']<=3      
      except:
        print(f'#{row['被试']} student has an invalid score {row['合理程度']}')     #用f可以将引号内的内容使用变量,引号内的变量要用{}括起来

      data = pd.read_excel('F:/Article/数据处理.xlsx',nrows=10)
      data.apply(score_validation,axis=1)    #axis(轴）的值为1是水平（从左到右）的方式读取，值为0是垂直（从上到下）的方式读取
   2. 第二种方法：if not语句 `if not 0<= row['合理程度'] <= 3`
5. 拆分列（根据文本内容，将内容拆分成两部分）
      ```Python {.line-numbers}
      import pandas as pd 

      data = pd.read_excel('F:/Article/数据处理.xlsx',nrows=10)
      df = data['Full Name'].str.split(' ',n=3,expand=True)    #split分隔不填写内容切分方式的话默认为空格和Tab切割；n的值为0或-1是切分后保留所有元素，等于3表示保留前三个元素；expend=True表示将切分后的内容扩展成一列或者多列
      data['First Name']=df[0]
      data['Last Name']=df[1]

## 绘图
1. 相关文件和模块：matplotlib（文件），pyplot（模块）
2. 使用pandas和pyplot绘图：
   1. 示例
      ```Python {.line-numbers}
      import pandas as pd
      import matplotlib.pyplot as plt     #加载绘图的组块

      data = pd.read_excel('F:/Article/数据处理.xlsx',nrows=10)
      data.sort_values(by='伤害意愿',inplace=True,ascending=False)      #排序
      print(data.head())

      # data.plot.bar(x='合理程度',y='伤害意愿',color='orange',title='Experiment 1')      #用pandas模块绘图，对xy轴传参，对颜色、图题进行设置
      plt.bar(data['合理程度'],data['伤害意愿'],color='orange')      #用pyplot进行绘图，注意定义xy轴的方法，在此处设置颜色
      plt.xticks(data['合理程度'],rotation='vertical')      #将x轴变量的显示转成垂直的
      plt.xlabel('Nuber')     #给x轴进行标签
      plt.ylabel('NUM')    #给y轴进行标签
      plt.title('Experiment 1',fontsize=16)     #给图一个题目
      plt.tight_layout()      #将x轴的变量名展示完全（可能会存在部分删除的现象）
      plt.show()     #展示图