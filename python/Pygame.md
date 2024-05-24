# Pygame

## 基础模块
1. Display
   1. 基础函数：
      1. pygame.display.set_mode()：打开窗口，可以设置窗口大小、背景颜色等；
      2. pygame.display.list_modes()：可以检索适配的屏幕分辨率
      3. pygame.display.get_surface()：返回当前活动窗口
      4. pygame.display.flip()：将后面的窗口内容翻转到前面
2. Events
   1. 基础函数：
      1. pygame.event.get()：获取所有鼠标键盘的事件，每个按键或鼠标事件有一个特定的常量数值
3. Draw
   1. 基础函数：
      1. 画几何图形：draw.polygon(), draw.circle(), draw. line(), draw.rect(), draw.ellipse()
4. Font
   1. 获取默认字体类别
      1. 获取pygame的所有字体：pygame.font.get_ default_font()
      2. 获取系统默认的所有字体：pygame.font.get_fonts()
   2. 文字刺激
      1. size()：用于获取字体长度和宽度，来计算哪些字会到达屏幕的边缘等
      2. render()：用字体、大小、粗细等来渲染文本，`fnt = pygame.font.SysFont('arial', 32, bold=True, italic=True) text_surf = fnt.render(demo_text, True, (255,0,0))`
      3. blit()：将渲染后的文字放入窗口，`text_surf = fnt.render(demo_text, True, (255,0,0)) win.blit(text_surf, (w,h))`
5. Image
   1. 基础函数：
      1. pygame.image.load()：可以加载BMP, PNG, and JPEG等文件，和文字一样，也需要win.blit()投放到窗口