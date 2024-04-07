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

## 眼动实验
1. 核心模块：pylink
2. 步骤
   1. 与主试机相连接：需要清楚主试机的IP，被试机需要和主试机有相同的网络IP，并确定其子网掩码
      1. tk = pylink.EyeLink('100.1.1.1')
   2. 在主试机上打开EDF文件：可以给edf文件命名
      1. tk.openDataFile('test.edf')
   3. 设置眼动跟踪参数：例如采样频率为1000hz
      1. 设置脱机模式：tk.setOfflineMode()，在修改tracker参数之前设置该模式
      2. 采样频率：tk.sendCommand("sample_rate 1000")
      3. 分辨率：tk.sendCommand(f"screen_pixel_coords = 0 0 {SCN_W-1} {SCN_H-1}")，可以用该参数来计算视角
      4. 校准类型：tk.sendCommand("calibration_type = HV9")
      5. 清除：tk.sendCommand('clear_screen 0')
      6. 可选的文件头：tk.sendCommand("add_file_preamble_text 'Free Viewing Task'")
      7. 在主试机的右下角发送信息：tk.sendCommand(f"record_status_message 'Picture:{pic}'")
   4. 打开全屏，用于相机设置和校准
      1. 打开校准窗口：pylink.openGraphics()
      2. 进行校准、验证训练：tk.doTrackerSetup()。在校准模式中，按C去校准，按V去验证，按O去跳出校准路径
      > 一个9点的校准在头部被固定时应用较好，而5点和13点的校准在头部不固定时较佳 
   5. 进行实验程序：一般每一个block校准一次
      1. 进行试次标记：tk.sendMessage(f'Trial: {i}')
      2. 漂移校正：tk.doDriftCorrect(int(SCN_W/2), int(SCN_H/2), 1, 1)，可以视为1点验证。前两个参数是像素坐标，第三个是是否需要画图像，第四个参数是按下'ESCAPE'是否触发校准程序
      3. 开始记录：tk.startRecording(1, 1, 1, 1)，四个参数说明记录什么类型的数据
      4. 缓存数据：pylink.msecDelay(2000)
      5. 停止记录：tk.stopRecording()
   6. 关闭edf文件并将文件复制到Display PC
      1. 关闭文件：tk.closeDataFile()
      2. 复制文件：tk.receiveDataFile('test.edf', 'test.edf')
   7. 结束程序和硬件的连接
      1. tk.close()
      2. pylink.closeGraphics()