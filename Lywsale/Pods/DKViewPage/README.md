# DKViewPage

A dankal viewPage to imitate android for iOS.

****

#### 效果图

![img](https://github.com/bingozb/DKViewPage/blob/master/DKViewPageDemo.gif)

#### 安装

- 通过cocoapods安装

```objc
pod 'DKViewPage'
```

- 或者`Clone or download`，将`DKViewPage`文件夹整个拖到你的项目中

#### 使用

- **引用头文件**

```objc
#import "DKViewPage.h"
```

- **构建一个`DKViewPageOption`对象数组**

```objc
// title:标签栏上的文字
// viewController:对应页的控制器

DKViewPageOption *option1 = [[DKViewPageOption alloc] initWithTitle:@"normal" viewController:[[DKDemoNormalViewController alloc] init]];
DKViewPageOption *option2 = [[DKViewPageOption alloc] initWithTitle:@"scroll" viewController:[[DKDemoScrollViewController alloc] init]];
DKViewPageOption *option3 = [[DKViewPageOption alloc] initWithTitle:@"table" viewController:[[DKDemoTableViewController alloc] init]];

NSArray<DKViewPageOption *> *options = @[option1,option2,option3];
self.options = options;
```

- **创建ViewPage**

```objc
DKViewPage *viewPage = [[DKViewPage alloc] initWithFrame:self.view.bounds options:self.options];
viewPage.dk_y = 64;
self.viewPage = viewPage;
[self.view addSubview:viewPage];
```

- **按需求自定义以下属性的值**

```objc
/** 标题栏的frame */
@property (nonatomic, assign) CGRect titleViewFrame;
/** 所有控制器view的frame */
@property (nonatomic, assign) CGRect controllerViewFrame;
/** 标题栏字体 */
@property (nonatomic, weak) UIFont *titleFont;
/** 标题栏字体普通状态颜色 */
@property (nonatomic, weak) UIColor *titleNormalColor;
/** 标题栏字体选中状态颜色 */
@property (nonatomic, weak) UIColor *titleSelectedColor;
/** 标题栏背景颜色 */
@property (nonatomic, weak) UIColor *titleViewBackgroundColor;
/** 标题栏底部指示器颜色 */
@property (nonatomic, weak) UIColor *indicatorColor;
/** 标题栏底部指示器高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;
```

#### 技巧

- **重复点击同一个标签栏的按钮时，如果想做些类似刷新页面的操作，可以监听通知**

```objc
// 监听通知
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshSomething) name:DKTitleButtonDidRepeatClickNotification object:nil];

- (void)refreshSomething
{
	// do something…
}
```

- **有时候scrollView上的子控件需要滑动，出现手势冲突问题**

```objc
#define kViewPageScrollUnEnableTag 1000

// 将需要接收事件Events传递的控件的tag设为1000即可。
```