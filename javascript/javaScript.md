# JavaScript 学习笔记

## 基础语法

### 数据概述
1. 变量和常量
   1. 变量
      1. let 声明与赋值（可以不赋值）
      2. var（另一个关键字，与let相同，但不建议使用）
   2. 常量
      1. const 声明常量，且必须赋值，并且不能再次赋值
2. 基本数据数据类型
   1. 数值型（Number）：整数、浮点数、科学计数法
   2. 字符串型（String）：单引号或双引号括起来的任意文本
   3. 布尔型（Boolean）：true、false
   4. 空值（null）：表示一个空对象指针
   5. 未定义值（undefined）：表示变量没有被赋值
   6. 对象型（Object）：JavaScript 中所有值都可以视为对象，包括函数、数组、日期、正则表达式等

### 基础语句
1. 条件语句
   1. if 语句: if (条件表达式) { 语句块 }
   2. if...else 语句: if (条件表达式) { 语句块1 } else { 语句块2 }
   3. if...else if...else 语句: if (条件表达式1) { 语句块1 } else if (条件表达式2) { 语句块2 } else { 语句块3 }
   4. switch 语句: switch (表达式) { case 值1: 语句块1; break; case 值2: 语句块2; break; default: 语句块3; }
2. 循环语句
   1. for 循环: for (初始化表达式; 循环条件表达式; 迭代表达式) { 语句块 }
   2. while 循环: while (循环条件表达式) { 语句块 }
   3. do...while 循环: do { 语句块 } while (循环条件表达式)
   4. for...in 循环: for (变量 in 对象) { 语句块 }
   5. for...of 循环: for (元素 of 可迭代对象) { 语句块 }
3. 函数声明
   1. 函数声明: function 函数名(参数列表) { 函数体 }
   2. 函数表达式: let 函数名 = function(参数列表) { 函数体 }，这种表达方式，函数的声明必须在调用之前

## 操作网页
1. 获取元素
   1. .querySelector() 方法：获取匹配指定 CSS 选择器的第一个元素
   2. .querySelectorAll() 方法：获取匹配指定 CSS 选择器的所有元素
   3.  document.getElementById() 方法：获取指定 ID 的元素
2. 修改、获取元素的属性
   1. className和classList属性
      1. className属性：获取或设置元素的类名，返回一个字符串，用空格分隔多个类名
      2. classList属性：获取或设置元素的类名，返回一个类名列表，可以对类名进行增删改查操作
         1. add() 方法：添加一个或多个类名
         2. remove() 方法：删除一个或多个类名
         3. toggle() 方法：如果元素没有该类名，则添加该类名；如果元素有该类名，则删除该类名
   2. style属性：获取或设置元素的样式，返回一个样式对象，可以对样式进行增删改查操作
      1. 获取元素属性：getElementByTagName()、getElementByClassName()、getElementsByName()、getElementById()等方法可以获取元素，然后用其style属性获取样式
      2. 设置元素属性（拥有最高优先级）：style.属性名 = 值，如style.backgroundColor = "red"
        > 注意：未通过代码设置的元素样式，如通过HTML的style属性设置的样式，则无法通过style属性获取到，只能通过上述方法获取到
   3. innerHTML和innerText属性
      1. innerHTML属性：获取或设置元素的内容，返回一个字符串
      2. innerText属性：获取或设置元素的内容，返回一个文本节点的文本内容，包括子元素的内容（渲染后的内容）
3. 动态添加、移除元素
   1. 添加元素
      1. 创建方法
         1. innerHTML属性：设置元素的内容，可以动态添加HTML代码。但是会先删除原来的内容后进行添加。
         2. createElement()方法：创建元素，然后设置其属性和内容，最后添加到指定位置。
      2. 进一步操作
         1. .append(): 在元素末尾添加内容
         2. .prepend(): 在元素开头添加内容
         3. .before(): 在元素前面添加内容
         4. .after(): 在元素后面添加内容
   2. 移除元素
      1. 移除方法：.remove()方法，可以移除元素，包括子元素
      2. 进一步操作：parentNode.removeChild(element)方法，可以移除指定元素，不包括子元素
4. 事件处理
   1. 事件类型：鼠标事件、键盘事件、表单事件、窗口事件、自定义事件
      1. 鼠标事件：click、dblclick、mousedown、mouseup、mousemove、mouseover、mouseout、mouseenter、mouseleave
      2. 键盘事件：keydown、keyup、keypress
      3. 表单事件：focus、blur、change、input
      4. 窗口事件：resize、scroll
      5. 自定义事件：可以自定义事件，触发时可以传递自定义数据
   2. 事件监听：addEventListener()方法，可以为元素添加事件监听器，当事件发生时，执行监听器中的代码
