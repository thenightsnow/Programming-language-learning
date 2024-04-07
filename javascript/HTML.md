# HTML学习笔记

## 学习大纲
部分 | 主要内容与重难点 | 推荐学习资料
----|--------------|-----------
HTML简介 | 介绍HTML的起源、作用、和基本工作原理。**重难点**：理解网页的基本结构和如何通过标记定义内容。 | MDN Web Docs（HTML: HyperText Markup Language）
HTML基础 | 学习使用核心标签(如\<div>, \<span>, \<a>, \<img>)和属性。掌握创建列表、表格、表单的方法。**重难点**：熟悉各种HTML标签及其属性的使用场景和限制。 | 《Head First HTML与CSS》
HTML5介绍 | 探索HTML5新增的语义标签和功能(如\<article>, \<nav>, \<section>, \<canvas>, \<audio>, \<video>)，以及新的APIs。**重难点**：利用HTML5的新特性改善网页语义化和交互性。 | HTML5 Rocks
HTML最佳实践 | 学习语义化编写HTML、基本的SEO优化技巧、提高网页可访问性的方法。**重难点**：编写既符合SEO优化又具有良好可访问性的HTML代码。 | W3Schools HTML Tutorial
实践项目 | 通过实际项目(如创建个人简历、博客布局、响应式网页)来应用所学知识。**重难点**：将理论知识应用到实际项目中，解决实际问题。 | FreeCodeCamp
进阶资源和学习路径 | 深入学习HTML规范、关注Web技术的最新发展。**重难点**：理解并跟上HTML和Web标准的最新变化。 | MDN Web Docs, Web Standards Curriculum by W3C

## 初始代码
1. 网页的基本结构：
   1. \<!DOCTYPE html>：声明文档类型，告诉浏览器使用HTML5解析器
   2. \<html>：网页的根元素，包含网页的头部和主体
   3. \<head>：网页的头部，包含网页的元数据，如网页标题、样式、脚本等
   4. \<title>: 网页的标题，显示在浏览器的标题栏
   5. \<body>: 网页的主体，包含网页的主要内容

    ```html    
    <!DOCTYPE html>    
    <html> 
    <head>
        <meta charset="UTF-8">  <!-- 定义网页的字符编码 --> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 定义网页的视口 -->
        <meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 定义浏览器兼容模式 -->
        <style> /* 定义网页的样式 */ </style>
        <script> /* 定义网页的脚本 */ </script>
        <title>网页标题</title>
    </head>
    <body>
        网页内容
    </body>
    </html>
    ```
    
2. 基本标签：
   1. 标题和段落
      1. 标题可以分为\<h1>到\<h6>六级标题，用于显示重要的标题
      2. 段落可以用\<p>标签包裹，用于显示文本内容
         1. 空格会被合并，换行符会被忽略，因此可以用\<br>标签来插入换行符
   2. 链接
      1. 跳转链接：
         1. 示例：\<a href="链接地址">超链接文本</a>
            1. href：定义了链接的URL，可以是相对路径或绝对路径
            2. 超链接文本：显示在链接上，用户点击后会跳转到目标页面或文件
      2. 跳转页面内部元素：
         1. 示例：\<a href="#id">超链接文本</a>
            1. href：定义了链接的URL，可以是# + id，表示跳转到网页内部的某个元素
            2. id：定义了网页内部的元素的唯一标识符，可以是任意的，但建议使用有意义的名称
         2. 注意：跳转页面内部元素时，必须先定义该元素的id，否则无法跳转
   3. 图片
      1. 示例：\<img src="图片地址" alt="图片描述">
         1. src属性定义了图像的URL，
         2. alt属性定义了图像的替代文本，当图像无法显示时，会显示替代文本
      2. 宽度和高度：可以通过CSS样式设置，也可以在\<img>标签中设置
         1. 示例：\<img src="图片地址" alt="图片描述" width="100px" height="50%(相对父元素而言，即外层元素)">
      3. 换行：图片不会单独占一行，除非一行放不下
   4. 用户输入
      1. input标签
         1. 示例：\<input type="text" placeholder="提示文本">
            1. type:定义了输入框的类型，如text、button、checkbox、radio、password、email、file等
            2. placeholder(当type为text或password时有效):定义了输入框的提示文本，用户点击输入框时会显示提示文本
      2. select标签
         1. 示例：\<select>
            1. \<option>标签定义了下拉列表中的选项，每个选项用一个\<option>标签包裹
            2. size:定义了下拉列表的高度
            3. value:定义了下拉列表的默认值，用户选择其他值后，会自动更新该属性的值
            4. multiple:定义了下拉列表是否可以多选，如果设置了该属性，则下拉列表可以同时选择多个选项
   5. 容器
      1. div: 块级容器，用于包裹其他HTML元素
         1. 块级元素：div、p、h1~h6、ul、ol、table、form等元素：
      2. span: 内联容器，用于包裹其他HTML元素，与div的区别在于span只能包含文本内容，不能包含其他HTML元素
         1. 内联元素：span、a、img、input、select、button等元素：
   6. 表单
   7. 其他标签
      1. \<a>: 定义一个超链接，用于跳转到其他页面或文件
      2. \<ul>: 定义一个无序列表，用于列出项目
      3. \<ol>: 定义一个有序列表，用于列出项目
      4. \<li>: 定义列表项，用于将项目添加到列表中
      5. \<table>: 定义一个表格，用于显示数据
      6.  \<tr>: 定义表格的行，用于显示表格中的数据
      7.  \<td>: 定义表格单元格，用于显示表格中的数据
      8.  \<form>: 定义一个表单，用于收集用户输入
      9.  \<label>: 定义一个标签，用于绑定输入框和其他元素
      10. \<select>: 定义一个下拉列表，用于收集用户选择
      11. \<option>: 定义下拉列表中的选项，用于显示可供选择的选项
      12. \<button>: 定义一个按钮，用于触发某些功能
