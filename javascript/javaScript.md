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

## Jspsych框架
### 引入jsPsych框架和插件
1. 引入框架（必需）：在HTML文件中引入jsPsych.js文件
   1. 使用CDN托管的源代码：`<script src="https://unpkg.com/jspsych@7.2.3"></script>`
   2. 下载并本地引入：下载jsPsych.js文件，在HTML文件中引入
2. 引入插件：在HTML文件中引入插件文件
   1. 使用CDN托管的源代码：
      1. 引入键盘按键插件：`<script src="https://unpkg.com/@jspsych/plugin-html-keyboard-response@1.1.1"></script>`,刺激可以是文字、图片、视频等
         1. 引入图片键盘按键插件：`<script src="https://unpkg.com/@jspsych/plugin-image-keyboard-response@1.1.1"></script>`,刺激只能是单张图片
         2. 引入视频键盘按键插件：`<script src="https://unpkg.com/@jspsych/plugin-video-keyboard-response@1.1.1"></script>`,刺激只能是单个视频
         3. 引入音频键盘按键插件：`<script src="https://unpkg.com/@jspsych/plugin-audio-keyboard-response@1.1.1"></script>`,刺激只能是单个音频
      2. 引入鼠标点击插件：`<script src="https://unpkg.com/@jspsych/plugin-html-button-response@1.1.1"></script>`
      3. 引入滑条插件：`<script src="https://unpkg.com/@jspsych/plugin-html-slider-response@1.1.1"></script>`
      4. 引入复杂刺激呈现插件：`<script src="https://unpkg.com/@jspsych/plugin-canvas-keyboard-response@1.1.1"></script>`,canvas是一个画布，还可以有鼠标、滑块等刺激插件
      5. 引入问卷相关插件：
         1. 单选题：`<script src="https://unpkg.com/@jspsych/plugin-survey-multi-choice@1.1.1"></script>`
         2. 多选题：`<script src="https://unpkg.com/@jspsych/plugin-survey-multi-select@1.1.1"></script>`
         3. 文本输入：`<script src="https://unpkg.com/@jspsych/plugin-survey-text@1.1.1"></script>`
         4. 评分题（李克特）：`<script src="https://unpkg.com/@jspsych/plugin-survey-likert@1.1.1"></script>`
      6. 屏幕控制（进出全屏）：`<script src="https://unpkg.com/@jspsych/plugin-fullscreen@1.1.1"></script>`
      7. 浏览器筛选：`<script src="https://unpkg.com/@jspsych/plugin-browser-check@1.0.1"></script>`
      8. 预加载：`<script src="https://unpkg.com/@jspsych/plugin-preload@1.1.1"></script>`
   2. 下载并本地引入：下载插件文件，在HTML文件中引入
3. 引入css文件：在HTML文件中引入jsPsych.css文件，也可以自定义jsPsych的样式
   1. 使用CDN托管的源代码：`<link rel="stylesheet" href="https://unpkg.com/jspsych@7.2.3/css/jspsych.css">`
   2. 下载并本地引入：下载jspsych.css文件，在HTML文件中引入

### 编写jsPsych代码
1. 定义实验主要部分：
   1. 初始化jsPsych实例：`let jsPsych = initJsPsych();`
   2. 定义实验试次：`let trial = { ... }`，定义一个对象，包含刺激相关信息，如刺激类型、内容、提示、选项、图片、视频、音频等，具体来说其实是事件
   3. 运行实验：`jsPsych.run([trial]);`，将实验试次传入run()方法，开始运行实验。传入的参数是一个数组，也就是时间线
2. 时间线：
   1. 主时间线
   2. 子时间线：一个插件模板中有一个`timelines`属性，它可以接受一个数组，数组的每一个元素都是一个对象，对象中定义了各个试次中没有被模板定义的属性
   3. 时间线变量：`timeline_variables`，是适用于子时间线的模板。在时间线中用`jsPsych.timelineVariable()`方法来获取变量的值。
   4. 时间线变量的随机化：`sample`属性，可以定义抽取的时间线变量的样本数量，在抽取之前对各个样本进行权重赋值，并设计抽样方法（可以自定义，使用`fn`属性）。
   5. 动态参数：可以使用一个函数作为试次对象的参数值。
      > 试次中对象的属性会在定义的时候就进行解析，会造成一些问题，比如获取的当前时间是定义时候的时间、如果时间线变量在模板的字符串中则在定义时就被解析为对象。所以可以用动态参数来解决这个问题。
3. 事件：
   1. 试次事件：
      1. 开始事件：`on_start`，在试次开始时触发，用于对单个试次做最后的调整修改，可以传入当前的试次对象；
      2. 加载完成：`on_load`，在试次加载完成时触发，完成对对象的解析、将刺激内容呈现在屏幕上才触发，没有任何参数供使用；
      3. 结束事件：`on_finish`，在试次结束时、屏幕上内容清空时触发，可以对最后的数据进行修改，传入当前试次记录的数据；
   2. 子时间线事件：
      1. 开始事件：`on_timeline_start`，在子时间线开始时触发；
      2. 结束事件：`on_timeline_finish`，在子时间线结束时触发；
      3. 条件事件：`conditional_function`，在子时间线中，可以定义条件判断，当条件成立时触发，返回true或false。
      4. 循环事件：`loop_function`，在子时间线中，可以定义循环，它可以接收包含了当前子时间线在当前这一次循环中所产生的数据，并根据这一数据来判断是否继续循环
   3. 全局事件：在`initJsPsych()`方法中定义
      1. 每一个试次开始的时候触发：`on_trial_start`，可以对当前试次进行初始化操作；
      2. 每一个试次结束的时候触发：`on_trial_finish`，可以对当前试次进行最后的处理操作；
      3. 每一个试次数据更新的时候触发（并未监听数据变化）：`on_data_update`，基本用途和结束事件相同；
      4. 所有试次结束后触发：`on_finish`，接收全局的数据对象
      5. 页面关闭时触发：`on_close`，可以用于清理一些资源，比如停止计时器、关闭视频、音频、保存数据等。
      6. 用户和页面交互操作时触发：`on_interaction_data_update`，可以用于记录用户交互数据，比如鼠标点击、键盘按键等，可以接收数据作为参数。
   4. 生命周期：见P158《JsPsych从入门到精通》
4. 自定义实验
   1. 实验外观：自己写css文件
   2. 在页面局部呈现：
      1. `display_element`，可以指定在哪个元素内呈现实验内容，默认值为`body`。
      2. `experiment_width`，实验区域宽度，默认是最大宽度。
   3. 添加进度条：在初始化中写入
      1. `show_progress_bar`，是否显示进度条，设置为true即可。
      2. `message_progress_bar`，进度条提示信息（这个内容要不断手动更新）。
      3. `auto_update_progress_bar`，是否自动更新进度条，设置为true即可。如果是false可以自己在试次中手动添加，使用`jsPsych.setProgressBar()`方法。
   4. 自定义数据：
      1. `data`，可以自定义实验数据，可以用来标记试次，用与on_finish事件中对数据进行处理。
      2. `Datacollection`:
         1. 获取
            1. `jsPsych.data.get()`，获取当前实验数据集合，返回一个对象。
            2. `jsPsych.data.getInteractionData()`，获取当前用户交互数据，返回一个对象。
            3. `jsPsych.data.getLastTrialData()`，获取最后一个试次数据，返回一个对象。
            4. `jsPsych.data.getLastTimelineData()`，获取最后一个子时间线数据，返回一个对象。
         2. 察看
            1. `.values()`，获取数据集合中所有数据，返回一个数组。
            2. `.count()`，获取数据集合中数据数量。
            3. `.uniqueNames()`，获取数据集合中所有数据的名称，返回一个数组。
            4. `.csv()`，将数据集合导出为csv格式。
            5. `.json()`，将数据集合导出为json格式。
            6. `.localSave()`，将数据集合保存到本地。
         3. 修改
            1. `.addToLast(Object)`，向最后一个试次添加数据。
            2. `.addToAll(Object)`，向所有试次添加数据。
            3. `.join(datacollection)`，将两个数据集合合并。
         4. 筛选
            1. `.readOnly()`，将数据集合进行深拷贝。
            2. `first(n)`，获取前n个数据。
            3. `last(n)`，获取最后n个数据。
            4. `ignore(name)`，忽略指定名称的数据。
            5. `filterColumns(columns)`，筛选出指定列的数据。
            6. `filter(rule)`,rule可以是一个数组或者对象，是对象则必须包括键值对，数组则满足一条规则即可。
            7. `filterCustom(func)`，自定义筛选函数，接收一个函数，函数接收一个试次的数据作为参数，返回一个布尔值，true表示保留该数据，false表示忽略该数据。
            8. `.select(name)`，获取单一项数据的值。
   5. 提前结束
      1. 设置结束函数，在内部引入`jsPsych.finishExperiment()`，可以设置实验结束的条件，比如设置一个计时器，当计时器结束时，实验结束。
      2. 仅在当前试次中实现：开始时监听，结束时移除监听
   6. 模拟模式和视觉模式：
      1. 模拟：`jsPsych.simulate()`方法，可以模拟实验，传入一个实验对象，只产生数据，不渲染内容。
      2. Visual：`jsPsych.simulate(timeline,'visual')`,会渲染内容，模拟被试反应。可以对单个试次的行为进行配置，添加`simulate_options`属性，可以设置三个参数：data（模拟产生的数据）、mode（模拟模式，visual或data-only）、simulate（布尔值，是否模拟当前试次）。


### 使用插件
1. 插件通用参数：
   1. `post_trial_gap`，试次间隔时间，单位为毫秒，没有默认值。
   2. `save_trial_parameters`，是否保存试次参数，设置属性为true或false。有的属性有默认值，没有被定义也会保存。
   3. `data`，试次数据，允许接收动态参数，可以用来标记试次，用与on_finish事件中对数据进行处理。
2. 键盘按键插件：如若使用图片、视频、音频专门的插件，可以提供更多的参数，但记录的数据一样
   1. type：`JsPsychHtmlKeyboardResponse`
   2. 参数：
      1. `stimulus`，刺激内容，必须指定，可以是文字、图片、视频、音频等。
      2. `choices`，按键选项，默认为'ALL_KEYS',不接收设置为'NO_KEYS'，也可以设置成数组。
      3. `prompt`，提示信息，默认值为null，其值为在内容下方呈现额外的html内容。
      4. `stimulus_duration`，刺激持续时间，单位为毫秒，默认值为null，表示刺激一直持续到用户按下按键为止。
      5. `trial_duration`，试次持续时间，单位为毫秒，默认值为null，表示试次一直持续到用户按下按键为止。
      6. `response_ends_trial`，是否在按下按键后结束试次，默认值为true。
   3. 记录的数据：
      1. `response`，用户按下的按键值，如果没有按下按键，则为null。
      2. `rt`，用户按下按键的时间，如果没有按下按键，则为null。
      3. `stimulus`，呈现的刺激内容。
3. 鼠标点击插件：也是一个系列，可以进一步察看细节内容。另外，按钮的布局可以参考书籍《JsPsych从入门到精通》P184
   1. type：`JsPsychHtmlButtonResponse`
   2. 参数：
      1. `stimulus`，同keyBoardResponse插件。
      2. `prompt`，同keyBoardResponse插件。
      3. `trial_duration`，同keyBoardResponse插件。
      4. `stimulus_duration`，同keyBoardResponse插件。
      5. `response_ends_trial`，同keyBoardResponse插件。
      6. `choices`,默认值为[]，该值的长度表示添加按钮的数量，数组内的每一个成员表示按钮上呈现的内容。
      7. `button_html`，按钮的html模板，默认值为'<button class="jspsych-btn">%choice%</button>'，其中%choice%会被替换为按钮的文本内容。
      8. `margin_vertical`，按钮的垂直间距，默认值为'0px'。
      9. `margin_horizontal`，按钮的水平间距，默认值为'8px'。
   3.  记录的数据：
      1. `response`，用户点击的按钮索引值，从0开始。
      2. `rt`，用户点击的时间。
      3. `stimulus`，呈现的刺激内容。
4. canvas插件：
   1. 插件：`JsPsychCanvasKeyboardResponse`
   2. 参数：
      1. `stimulus`，刺激内容，必须指定，接收当前试次的canvas参数，用来绘图
      2. `choices`，同keyBoardResponse插件。
      3. `prompt`，同keyBoardResponse插件。
      4. `trial_duration`，同keyBoardResponse插件。
      5. `stimulus_duration`，同keyBoardResponse插件。
      6. `response_ends_trial`，同keyBoardResponse插件。
5. 预加载插件：只有赋值给静态资源的参数才会被预加载，动态资源不会被预加载。
   1. type：`preload`
   2. 参数：只展示部分
      1. `auto_preload`，是否自动预加载，默认值为false。
      2. `trials`，预加载的试次数组，默认值为[]。包含了要预加载资源的试次和子时间线。
      3. `iamges`，预加载的图片数组，默认值为[]。
      4. `audio`，预加载的音频数组，默认值为[]。
      5. `video`，预加载的视频数组，默认值为[]。离线运行实验时不能预加载视频。
      6. `on_error`，预加载失败时触发的事件，默认值为null。
      7. `on_success`，预加载完成时触发的事件，默认值为null。
   3. 记录的数据：
      1. `success`，预加载是否成功
      2. `timeout`，预加载超时时间
      3. `failed_images`，预加载失败的图片
      4. `failed_audio`，预加载失败的音频
      5. `failed_video`，预加载失败的视频
6. 问卷插件：
   1. 单选题
      1. type:`jsPsychSurveyMultiChoice`
      2. 参数：
         1. `questions`，题目数组，数组中每个成员是一个对象，对象内包含了题目内容、选项等。
            1. `prompt`，题目内容，必须指定。
            2. `options`，选项数组，数组中每个成员是一个对象，对象内包含了选项内容、值等。
            3. `name`，题目的名称，默认为Q0，Q1，Q2等。
            4. `required`，是否必答，默认值为false。
            5. `horizontal`，是否横向排列，默认值为false。
         2. `randomize_question_order`，是否需要对问题顺序随机化，默认值为false。
         3. `preamble`，前导信息，默认值为null。即是否在题目顶端呈现一段话。
         4. `button_label`，提交按钮的文本，默认值为'continue'。
         5. `autocomplete`，页面输入元素是否允许自动填写，默认值为false。
      3. 记录的数据：
         1. `responses`，用户选择的选项值，是一个对象。对象的属性名为题目的name属性，值为用户选择的选项值。
         2. `rt`，用户提交的时间。
         3. `question_order`，问题顺序，是一个数组，如[0,1,2]。
   2. 多选题
      1. type:`jsPsychSurveyMultiSelect`
      2. 参数：基本同单选题，多一个。
         1. `required_message`，必答提示信息，默认值为'Please select at least one answer for this question.'。
      3. 记录的数据：基本同单选题，就response的值变成了一个数组。
   3. likert题
      1. type:`jsPsychSurveyLikert`
      2. 参数：
         1. `questions`，题目数组，数组中每个成员是一个对象。
            1. `prompt`，题目内容，必须指定。
            2. `labels`，标签数组，数组中每个成员是一个对象，对象内包含了标签内容、值等。必须指定。
            3. `name`，同单选题。
            4. `required`，同单选题。
         2. `randomize_question_order`，同单选题。
         3. `preamble`，同单选题。
         4. `button_label`，同单选题。
         5. `autocomplete`，同单选题。
         6. `scale_width`，默认值为null，接收一个纯数值，规定量表宽度的像素值。
      3. 记录的数据：基本同单选题，就response的值是数值。
   4. 填空题
      1. type:`jsPsychSurveyText`
      2. 参数：
         1. `questions`，题目数组，数组中每个成员是一个对象。
            1. `prompt`，题目内容，必须指定。
            2. `name`，同单选题。
            3. `required`，同单选题。
            4. `rows`，输入框的行数，默认值为1。
            5. `columns`，输入框的列数，默认值为40。
            6. `placeholder`，输入框的占位符，默认值为''。
         2. `randomize_question_order`，同单选题。
         3. `preamble`，同单选题。
         4. `button_label`，同单选题。
         5. `autocomplete`，同单选题。
      3. 记录的数据：基本同单选题，就response的值变成了被试填写的内容。
   5. 组合题
      1. type:`jsPsychSurveyHtmlForm`
      2. 参数：
         1. `html`，html字符串，页面上全部题目的内容。
         2. `preamble`,同单选题。
         3. `button_label`，同单选题。
         4. `autocomplete`，同单选题。
         5. `autofocus`，加载完成自动获得焦点元素ID，默认值为''。
         6. `dataAsArray`，是否将数据记录为数组，默认值为false。
      3. 记录的数据：
         1. `responses`，每一个元素被试的作答。
         2. `rt`，用户提交的时间。
7. 滑条插件：
   1. type：`jsPsychHtmlSliderResponse`
   2. 参数：
      1. `stimulus`,同keyBoardResponse插件。
      2. `prompt`，同keyBoardResponse插件。
      3. `trial_duration`，同keyBoardResponse插件。
      4. `stimulus_duration`，同keyBoardResponse插件。
      5. `response_ends_trial`，同keyBoardResponse插件。
      6. `labels`，标签数组，数组中每个成员从滑块的开始到结尾等距分布。
      7. `button_label`，提交按钮的文本，默认值为'continue'。
      8. `min`，最小值，默认值为0。
      9. `max`，最大值，默认值为100。
      10. `step`，步长，默认值为1。
      11. `slider_start`，滑块初始位置，默认值为50。
      12. `slider_width`，滑块宽度，默认值为null，接收数值。
      13. `require_movement`，是否需要滑动，默认值为false。
   3. 记录的数据：
      1. `response`，用户选择滑块值。
      2. `rt`，用户提交的时间。
      3. `stimulus`，呈现的刺激内容。
      4. `slider_start`，滑块初始位置。
8. 屏幕插件：
   1. type：`jsPsychFullscreen`
   2. 参数：
      1. `fullscreen_mode`，全屏模式，默认值为true。
      2. `message`，全屏提示信息，默认值为'<p>The experiment will switch to fullscreen mode when you press the button below.</p>';进入全屏需要手动确认。
      3. `button_label`，按钮文本，默认值为'Continue'。
      4. `delay_after`，延迟时间，单位为毫秒，默认值为1000。进入全屏时弹出提示会干扰实验，可以设置延迟时间。
   3. 记录的数据：
      1. `success`，浏览器是否支持全屏。