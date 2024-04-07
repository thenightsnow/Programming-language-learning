# CSS

CSS (Cascading Style Sheets) 是一种用来表现 HTML 文档样式的语言。CSS 定义了页面的布局、颜色、字体、边框、背景等外观样式。CSS 能够让网页更加美观、更加具有互动性。

## 语法
1. 基本结构：`selector { property: value; }`
   1. 选择器：`selector` 用于选择 HTML 元素，可以是标签名、类名、ID 等。
      1. 标签选择器：选择文档中所有的某种标签。示例：`h1 { color: red; }`
      2. ID 选择器：选择具有特定 ID 的元素。示例：`#my-id { color: blue; }`
      3. (Class)类选择器：选择具有特定类名的元素。示例：`.my-class { color: green; }`
      4. 群组选择器: 选择多种标签。示例：`div, p { color: black; }`
      5. 通配选择器：选择所有元素。示例：`* { margin: 0; padding: 0; }`
      6. 层次选择器：
         1. 后代选择器：选择某元素的所有后代元素。示例：`div p { color: blue; }`
         2. 子选择器：选择某元素的直接子元素。 示例：`div > p { color: blue; }`
         3. 相邻兄弟选择器：选择某元素的相邻元素。示例：`div + p { color: blue; }`
         4. 兄弟选择器：选择某元素的兄弟元素。示例：`div ~ p { color: blue; }`
      7. 属性选择器：选择具有特定属性的元素，写法很多，常见的有：
         1. `[attribute]`：选择具有特定属性的元素。示例：`[title] { color: blue; }`
         2. `[attribute=value]`：选择具有特定属性值（精确匹配）的元素。示例：`[title="example"] { color: blue; }`
         3. `[attribute~=value]`：选择具有特定属性值（包含）的元素。示例：`[class~="example"] { color: blue; }`
         4. `[attribute|=value]`：选择具有特定属性值（以特定值开头）的元素。示例：`[lang|="en"] { color: blue; }`
         5. `[attribute^=value]`：选择具有特定属性值（以特定值开头）的元素。示例：`[class^="example"] { color: blue; }`
         6. `[attribute$=value]`：选择具有特定属性值（以特定值结尾）的元素。示例：`[class$="example"] { color: blue; }`
         7. `[attribute*=value]`：选择具有特定属性值（包含特定值）的元素。示例：`a[href="https://www.example.com"] { color: blue; }`
      8. 伪类选择器：选择某元素的某种状态，如鼠标悬停、选中、激活等。示例：
         1. `:link`：选择未被访问的链接。
         2. `:visited`：选择已被访问的链接。
         3. `:hover`：选择鼠标悬停的元素。
         4. `:active`：选择激活的元素。
   2. 属性：`property` 用于设置 CSS 样式，如字体、颜色、背景、边框等。
      1. 优先级：
         1. 排序：内联样式 > 外部样式 > 内嵌样式 > 浏览器默认样式。
         2. !important 规则：可以提高 CSS 样式的优先级。
   3. 值：`value` 用于设置 CSS 属性的具体值，可以是颜色值、字体大小、边框样式等。
2. 注释：`/* 注释内容 */`
3. 在HTML中引入CSS:
   1. 内联样式：在 HTML 元素中使用 style 属性直接设置 CSS 样式。
   2. 外部样式：在 HTML 文档的 head 部分通过 link 标签引入外部 CSS 文件。
   3. 内嵌样式：在 HTML 文档的 head 部分通过 style 标签直接写入 CSS 代码。

## 常用样式
1. 文本样式：
   1. 字体：设置字体风格、系列、大小、粗细等。可以简写在一个声明中，如 `font: italic bold 16px/1.5 Arial, sans-serif;`。
      1. font-style：设置字体风格。
      2. font-family：设置字体系列。
      3. font-size：设置字体大小。
      4. font-weight：设置字体粗细。
   2. 颜色：设置文本颜色。
      1. 表示方式：`color: red;` 或 `#RRGGBB` 或 `rgb(255, 0, 0)`。
   3. 段落样式：设置文本缩进、行高、对齐方式等。
      1. 文本对齐：`text-align: left;` 或 `text-align: right;` 或 `text-align: center;`。
      2. 文本缩进：`text-indent: 2em;`。
      3. 行高：`line-height: 1.5;`。
   4. 空白处理：设置空白字符处理方式。取值有：nomal、pre、nowrap、pre-wrap、pre-line。
      1. 空白合并：`white-space: normal;`
      2. 合并换行：`white-space: nowrap;`
      3. 换行：`word-wrap: normal;`
2. 盒子样式：
   1. 边框：
      1. 基本设置：设置边框样式、宽度、颜色。可以简写在一个声明中，如 `border: 1px solid black;`。
      2. 圆角：`border-radius: 5px;`。
      3. 针对不同边框：可以设置不同边框的样式、宽度、颜色。如 `border-top: 1px solid black;`。
   2. 盒子模型
      1. 外边距：`margin: 10px;` 或 `margin: 10px 20px;` 或 `margin: 10px 20px 30px;` 或 `margin: 10px 20px 30px 40px;`。
      2. 内边距：`padding: 10px;` 或 `padding: 10px 20px;` 或 `padding: 10px 20px 30px;` 或 `padding: 10px 20px 30px 40px;`。
      3. 宽度和高度：`width: 100px;` 或 `height: 100px;`。
      4. 边框和背景：`border: 1px solid black;` 或 `background-color: #f0f0f0;`。
3. 光标样式：
   1. cursor 属性：设置鼠标光标的形状。
      1. auto：默认光标。
      2. pointer：指针光标。
      3. move：移动光标。
      4. text：文本光标。
      5. wait：等待光标。
      6. help：帮助光标。
      7. progress：进度条光标。
4. display属性：
   1. 块级元素：display: block;
   2. 行内元素：display: inline;
   3. 隐藏元素：display: none;（元素不占据空间）
   4. 表格元素：display: table;
   5. 列表元素：display: list-item;
   6. 内联块元素：display: inline-block;
5. visibility属性：
   1. 显示元素：visibility: visible;
   2. 隐藏元素：visibility: hidden;(元素仍然占据空间，只是看不见)
6. 溢出处理：
   1. 内容溢出：overflow: hidden;（内容超出盒子部分隐藏）
   2. 内容可滚动：overflow: scroll;（内容超出盒子部分显示滚动条）
   3. 内容可滚动且可换行：overflow: auto;（内容超出盒子部分显示滚动条，内容可换行）
   4. 内容可换行：overflow: auto;（内容超出盒子部分显示省略号）
7. position属性：
   1. 相对定位：position: relative;（相对于元素本身位置进行定位）
   2. 绝对定位：position: absolute;（相对于最近的已定位的祖先元素进行定位）
   3. 固定定位：position: fixed;（相对于浏览器窗口进行定位）
   4. 粘性定位：position: sticky;（相对于最近的已定位的祖先元素进行定位，当元素在屏幕范围内时，它的位置固定）
   5. z-index属性：设置元素的堆叠顺序。(元素越靠前，z-index值越大)


### 字体