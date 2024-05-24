# Psychopy

## 基础用法
1. 基础模块
   1. Visual：窗口管理线程和刺激生成；
   2. Core：与计时相关的基础功能
   3. event：处理键盘和鼠标事件
   4. monitors：提供监视器配置工具？
2. 基础工具
   1. 窗口：
      1. 参数：通常，窗口的参数使用默认参数就好，主要需要调整的是size，color，fullscr和units。`visual.Window(size=(800, 600), pos=None, color=(0, 0, 0), colorSpace='rgb', rgb=None, dkl=None, lms=None, fullscr=None, allowGUI=None, monitor=None, bitsMode=None, winType=None, units=None, gamma=None, blendMode='avg', screen=0, viewScale=None, viewPos=None, viewOri=0.0, waitBlanking=True, allowStencil=False, multiSample=False, numSamples=2, stereo=False, name='window1', checkTiming=True, useFBO=False, useRetina=True, autoLog=True, gammaErrorPolicy='raise', bpc=(8, 8, 8), depthBits=8, stencilBits=8, backendConf=None)`
      2. 屏幕单元：知道视距、屏幕的分辨率和屏幕的尺寸，这样的话可以调整刺激的视角大小
      3. 监视器：我们可以定义一个监视器对象，将视距、屏幕大小、屏幕分辨率传递
      4. 在浏览窗口期间调用函数
      5. 窗口截图：
         1. getActualFrameRate()：测试并报告屏幕的帧数；
         2. getMovieFrame()：捕捉窗口内容
         3. saveMovieFrames()：将捕捉的内容保存为一张图片或者视频
   2. 视觉刺激：
      1. 形状：
         1. 主要形状：`visual.Rect(), visual.Circle(), visual.Polygon(), visual.Line()`
         2. 任意顶点数量的形状：`visual.ShapeStim(win, units='', colorSpace='rgb', fillColor=False, lineColor=False, lineWidth=1.5, vertices=((- 0.5, 0), (0, 0.5), (0.5, 0)), windingRule=None, closeShape=True, pos=(0, 0), size=1, ori=0.0, opacity=1.0, contrast=1.0, depth=0, interpolate=True, name=None, autoLog=None, autoDraw=False, color=False, lineRGB=False, fillRGB=False, fillColorSpace=None, lineColorSpace=None)`
      2. 格栅：`visual.GratingStim(win, tex='sin', mask='none', units='', pos=(0.0, 0.0), size=None, sf=None, ori=0.0, phase=(0.0, 0.0), texRes=128, rgb=None, dkl=None, lms=None, color=(1.0, 1.0, 1.0), colorSpace='rgb', contrast=1.0, opacity=None, depth=0, rgbPedestal=(0.0, 0.0, 0.0), interpolate=False, blendmode='avg', name=None, autoLog=None, autoDraw=False, maskParams=None)`
      3. 文本：
         1. visual.TextStim：`visual.TextStim(win, text='Hello World', font='', pos=(0.0, 0.0), depth=0, rgb=None, color=(1.0, 1.0, 1.0), colorSpace='rgb', opacity=1.0, contrast=1.0, units='', ori=0.0, height=None, antialias=True, bold=False, italic=False, alignHoriz=None, alignVert=None, alignText='center', anchorHoriz='center', anchorVert='center', fontFiles=(), wrapWidth=None, flipHoriz=False, flipVert=False, languageStyle='LTR', name=None, autoLog=None)`
            1. 设置字体（font）、从左至右呈现（languagestyle）、一行的宽度（wrapwidth）
      4. 光圈：用于遮挡文字
   3. 鼠标和键盘
      1. 鼠标：使用`event.Mouse()`创建一个鼠标对象，`getPos()`返回当前的鼠标位置，`setPos()`将鼠标放到指定位置
      2. 键盘：使用`event.waitKeys()`等待输入一个按键，`event.getKeys()`确定收集的按键
         1. 参数：
            1. `keylist= [‘z’, ‘slash’]`限制按键
            2. `timeStamped=True`显示时间
   4. 试次控制
      1. 定义试次函数：`def run_trial(par1, par2, par3): '''present the trial events based on the parameters''' do_something here return trial_result`，将每个试次中需要变化的参数传入试次函数中；
      2. 定义试次参数：`trials = [[t1_par1, t1_par2, t1_par3], [t2_par1, t2_par2, t2_par3]]`，将所有的试次参数以列表的形式储存，最后用循环的方式跑出来；
      3. 调整试次数量：`trial2Test = trials[:] *24`，可以采用切片重复次数的方式调整试次的数量；
      4. 调整试次顺序：`random.shuffle(trial2Test)`，使用随机函数随机呈现试次。

## event模块
1. 概述：
> 是一个比较老的事件模块了，可以监听鼠标和键盘事件，并对鼠标和键盘进行一定的设置
2. 鼠标
   1. 创建鼠标对象：`event.Mouse()`
   2. 鼠标事件：
      1. `mouse.getPos()`，返回鼠标的当前位置；
      2. `mouse.setPos((x, y))`，将鼠标移动到指定位置；
      3. `mouse.click(button='left')`，点击鼠标；
      4. `mouse.scroll(steps=1)`，滚动鼠标；
      5. `mouse.isPressed(button='left')`，判断鼠标是否按下；
      6. `mouse.getPressed()`，返回鼠标按下的键；
      7. `mouse.getWheelRel()`，返回滚轮相对位置；
      8. `mouse.getWheel()`，返回滚轮绝对位置；
      9.  `mouse.setSystemCursor(cursor='arrow')`，设置鼠标图标；
      10. `mouse.setVisible(visible=True)`，设置鼠标是否可见；
3. 键盘
   1. 键盘事件：
      1. `event.getKeys()`，返回一个列表，包含所有按下的键；
      2. `event.waitKeys()`，等待用户按下一个键，返回按下的键；
      3. `event.clearEvents()`，清除所有事件；
      4. `event.waitKeys(keyList=['z', 'x'])`，限制按键；
      5. `event.getKeys(timeStamped=True)`，显示时间戳；
      6. `event.getKeys(keyList=['z', 'x'], timeStamped=True)`，限制按键和显示时间戳；


## 眼动实验
1. 核心模块：pylink
2. 基本步骤
   1. 与主试机相连接：需要清楚主试机的IP，被试机需要和主试机有相同的网络IP，并确定其子网掩码
      1. `tk = pylink.EyeLink('100.1.1.1')`
   2. 在主试机上打开EDF文件：可以给edf文件命名
      1. `tk.openDataFile('test.edf')`
   3. 设置眼动跟踪参数：例如采样频率为1000hz
      1. 设置脱机模式：`tk.setOfflineMode()`，在修改tracker参数之前设置该模式
      2. 采样频率：`tk.sendCommand("sample_rate 1000")`
      3. 分辨率：`tk.sendCommand(f"screen_pixel_coords = 0 0 {SCN_W-1} {SCN_H-1}")`，可以用该参数来计算视角
      4. 校准类型：`tk.sendCommand("calibration_type = HV9")`
      5. 清除：`tk.sendCommand('clear_screen 0')`
      6. 可选的文件头：`tk.sendCommand("add_file_preamble_text 'Free Viewing Task'")`
      7. 在主试机的右下角发送信息：`tk.sendCommand(f"record_status_message 'Picture:{pic}'")`
   4. 打开全屏，用于相机设置和校准
      1. 打开校准窗口：`pylink.openGraphics()`
      2. 进行校准、验证训练：`tk.doTrackerSetup()`。在校准模式中，按C去校准，按V去验证，按O去跳出校准路径
      > 一个9点的校准在头部被固定时应用较好，而5点和13点的校准在头部不固定时较佳 
   5. 进行实验程序：一般每一个block校准一次
      1. 进行试次标记：`tk.sendMessage(f'Trial: {i}')`
      2. 漂移校正：`tk.doDriftCorrect(int(SCN_W/2), int(SCN_H/2), 1, 1)`，可以视为1点验证。前两个参数是像素坐标，第三个是是否需要画图像，第四个参数是按下'ESCAPE'是否触发校准程序
      3. 开始记录：`tk.startRecording(1, 1, 1, 1)`，第一个参数表示是否将样本写入edf文件，第二个参数表示是否将事件写入文件，第三个参数表示发送样本给link，第四个参数表示发送事件给link
      4. 设置兴趣区：椭圆`tk.sendMessage('!V IAREA ELLIPSE 1 0 0 100 100 head')` 矩形`tk.sendMessage('!V IAREA RECTANGLE 2 85 85 285 185 body')` 自由`tk.sendMessage('!V IAREA FREEHAND 3 285,125 385,50 335,125 tail')`
      > 需要注意的是，eyelink的坐标中心在左上方，而psychopy的坐标中心在屏幕中央
      5. 缓存数据：`pylink.msecDelay(2000)`
      6. 停止记录：`tk.stopRecording()`
   6. 关闭edf文件并将文件复制到Display PC
      1. 关闭文件：`tk.closeDataFile()`
      2. 复制文件：`tk.receiveDataFile('test.edf', 'test.edf')`
   7. 结束程序和硬件的连接
      1. `tk.close()`
      2. `pylink.closeGraphics()`
3. 高级设置：
   1. 实时获取眼动样本（接近实时）
      1. 包含的信息：注视点位置、瞳孔大小、头的位置、摄像头传感器的原始位置
      2. 相关指令：
         1. `smp = tk.getNewestSample()`：获取最新样本
         2. `is_left = smp.isLeftSample()`或`is_left = smp.isRightSample()`或`is_bino = smp.isBinocular()`：判断是否为左眼或右眼或双眼
         3. `res = smp.getPPD()`：视角的1度等于多少像素位移
         4. `time_stamp = smp.getTime()`：获取样本的时间戳
         5. `gaze = smp.getRightEye().getGaze()`：获取右眼的注视点位置
         6. `pupil = smp.getRightEye().getPupilSize()`：获取右眼的瞳孔大小
         7. `href = smp.getRightEye().getHREF()`：获取头部的位置
         8. `raw = smp.getRightEye().getRawPupil()`：获取摄像头传感器的原始位置
   2. 实时获取眼动事件（会延迟一些）
      1. 包含的信息：注视开始、注视结束、眼跳开始、眼跳结束、眨眼开始、眨眼结束
      2. 相关指令：
         1. 检查是否存在事件：`dt = tk.getNextData()`，dt一般为`[pylink.STARTSACC, pylink.ENDSACC, pylink.STARTFIX, pylink.ENDFIX]`中的一种
         2. 将事件数据从队列中提取出来：`ev = tk.getFloatData()`
            1. 眼跳事件：`ev.getAmplitude()`获取眼跳幅度等，见课本P165页《Eye-Tracking with Python and Pylink》
            2. 注视事件：`ev.getEndGaze()`获取注视点信息，见课本P165页


## 脑电实验
1. 核心模块：`parallel`
2. 基本步骤:
   1. 创建一个`parallel.ParallelPort`对象，并连接到电脑的并行口，例如`port = parallel.ParallelPort(address='0x0378')`
   2. 并口信号清零：`port.setData(0)`
   3. 发送trigger信号：`port.setData(1)`
3. 注意：
   1. 并口对象的地址需要去目标电脑的硬件管理中查找
   2. 在发出trigger信号前，需要先清除并口的信号，否则会导致信号冲突
   3. 在发出triiger信号后，需要等待一段时间才能再次发送信号，否则会导致信号丢失
   4. trigger信号可以在实验的特殊位置打上，也可以在特定的时间点发送，还可以根据实验条件进行设定