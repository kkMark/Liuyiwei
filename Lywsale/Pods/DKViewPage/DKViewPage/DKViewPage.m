//
//  DKViewPage.m
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 dankal. All rights reserved.
//

#import "DKViewPage.h"
#import "DKViewPageManager.h"
#import "DKTitleButton.h"
#import "DKViewPageScrollView.h"

@interface DKViewPage ()<UIScrollViewDelegate>
/** 当前选中的标题按钮 */
@property (nonatomic, weak) DKTitleButton *selectedTitleButton;
/** 标题按钮底部的指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** scrollView */
@property (nonatomic, weak) DKViewPageScrollView *scrollView;
/** 标题栏 */
@property (nonatomic, weak) UIView *titlesView;
/** 底层view */
@property (nonatomic, weak) UIView *bottomView;

/** 控制器对象数组 */
@property (nonatomic, strong) NSMutableArray<UIViewController *> *viewControllers;
/** 标题数组 */
@property (nonatomic, strong) NSMutableArray<NSString *> *titles;
@end

@implementation DKViewPage

static NSString *const kKeyPathTitleViewFrame = @"titleViewFrame";
static NSString *const kKeyPathViewPageFrame = @"viewPageFrame";
static NSString *const kKeyPathControllerViewFrame = @"controllerViewFrame";
static NSString *const kKeyPathTitleViewBackgroundColor = @"titleViewBackgroundColor";
static NSString *const kKeyPathIndicatorColor = @"indicatorColor";
static NSString *const kKeyPathIndicatorHeight = @"indicatorHeight";

NSString *const DKTitleButtonDidRepeatClickNotification = @"DKTitleButtonDidRepeatClickNotification";

#pragma mark - Getter && Setter

- (void)setViewPageOptions:(NSArray<DKViewPageOption *> *)viewPageOptions
{
    _viewPageOptions = viewPageOptions;
    
    if (_currentViewController) {
        [self setupViewPage];
    }
}

- (void)setCurrentViewController:(UIViewController *)currentViewController
{
    NSAssert(currentViewController, @"current viewController cannot be nil");
    _currentViewController = currentViewController;
    
    if (_viewPageOptions.count) {
        [self setupViewPage];
    }
}

- (void)setFrame:(CGRect)frame
{
    // 超过屏幕宽度高度的处理
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    if (frame.origin.y + frame.size.height > screenH) {
        frame.size.height = screenH - frame.origin.y;
    }
    if (frame.origin.x + frame.size.width > screenW) {
        frame.size.width = screenW - frame.origin.x;
    }
    [super setFrame:frame];
    DKViewPageShareManager.viewPageFrame = frame;
}

- (void)setTitleViewFrame:(CGRect)titleViewFrame
{
    _titleViewFrame = titleViewFrame;
    DKViewPageShareManager.titleViewFrame = titleViewFrame;
}

- (void)setControllerViewFrame:(CGRect)controllerViewFrame
{
    _controllerViewFrame = controllerViewFrame;
    DKViewPageShareManager.controllerViewFrame = controllerViewFrame;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    DKViewPageShareManager.titleFont = titleFont;
}

- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    _titleNormalColor = titleNormalColor;
    DKViewPageShareManager.titleNormalColor = titleNormalColor;
}

- (void)setTitleSelectedColor:(UIColor *)titleSelectedColor
{
    _titleSelectedColor = titleSelectedColor;
    DKViewPageShareManager.titleSelectedColor = titleSelectedColor;
}

- (void)setTitleViewBackgroundColor:(UIColor *)titleViewBackgroundColor
{
    _titleViewBackgroundColor = titleViewBackgroundColor;
    DKViewPageShareManager.titleViewBackgroundColor = titleViewBackgroundColor;
}

- (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    DKViewPageShareManager.indicatorColor = indicatorColor;
}

- (void)setIndicatorHeight:(CGFloat)indicatorHeight
{
    _indicatorHeight = indicatorHeight;
    DKViewPageShareManager.indicatorHeight = indicatorHeight;
}

#pragma mark - Life Cycle

+ (instancetype)viewPageWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions
{
    return [[self alloc] initWithOptions:viewPageOptions currentViewController:nil];
}

+ (instancetype)viewPageWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController
{
    return [[self alloc] initWithOptions:viewPageOptions currentViewController:viewController];
}

- (instancetype)initWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions
{
    self.viewPageOptions = viewPageOptions;
    
    return self;
}

- (instancetype)initWithOptions:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController
{
    self.viewPageOptions = viewPageOptions;
    _currentViewController = viewController;
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<DKViewPageOption *> *)viewPageOptions
{
    if (self = [self initWithFrame:frame]) {
        self.viewPageOptions = viewPageOptions;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<DKViewPageOption *> *)viewPageOptions currentViewController:(UIViewController *)viewController
{
    if (self = [self initWithFrame:frame]) {
        self.viewPageOptions = viewPageOptions;
        self.currentViewController = viewController;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 添加观察者
        [self setupObserver];
        if (self.viewPageOptions.count && self.currentViewController) {
            // 初始化
            [self setupViewPage];
        }
        DKViewPageShareManager.viewPageFrame = frame;
    }
    return self;
}

/** 初始化入口 */
- (void)setupViewPage
{
    // Base
    [self setupVcsAndTitles];
    
    // 设置主内容界面
    [self setupScrollView];
    // 设置标题栏
    [self setupTitlesView];
    // 默认添加控制器的view
    [self addVcView];
}

/** 设置所有的控制器和标题数组 */
- (void)setupVcsAndTitles
{
    self.viewControllers = [NSMutableArray array];
    self.titles = [NSMutableArray array];
    
    for (DKViewPageOption *option in self.viewPageOptions) {
        UIViewController *childVc = option.optionViewController;
        NSAssert(childVc, @"option`s viewController can not be nil");
        
        [self.currentViewController addChildViewController:childVc];
        [self.viewControllers addObject:childVc];
        [self.titles addObject:option.optionTitle ? option.optionTitle : @""];
    }
}

/** 设置标题栏 */
- (void)setupTitlesView
{
    [self.titlesView removeFromSuperview];
    
    // 标题栏
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = DKViewPageShareManager.titleViewBackgroundColor;
    titlesView.frame = DKViewPageShareManager.titleViewFrame;
    [self addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 添加标题
    NSArray *titles = self.titles;
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titlesView.dk_width / count;
    CGFloat titleButtonH = titlesView.dk_height;
    for (NSUInteger i = 0; i < count; i++) {
        // 创建标题按钮
        DKTitleButton *titleButton = [DKTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
    // 按钮的选中颜色
    DKTitleButton *firstTitleButton = [titlesView.subviews firstObject];
    
    // 底部的指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = DKViewPageShareManager.indicatorColor;
    indicatorView.dk_height = DKViewPageShareManager.indicatorHeight;
    indicatorView.dk_y = titlesView.dk_height - indicatorView.dk_height;
    [titlesView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.dk_width = firstTitleButton.titleLabel.dk_width;
    indicatorView.dk_centerX = firstTitleButton.dk_centerX;
    // 默认选中第一个标题按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
}

/** 设置主内容界面 */
- (void)setupScrollView
{
    [self.bottomView removeFromSuperview];
    [self.scrollView removeFromSuperview];
    
    // 底部先插入一个UIView，避免控制器automaticallyAdjustsScrollViewInsets导致布局错乱
    UIView *bottomView = [[UIView alloc] initWithFrame:DKViewPageShareManager.controllerViewFrame];
    bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:bottomView];
    self.bottomView = bottomView;
    
    DKViewPageScrollView *scrollView = [[DKViewPageScrollView alloc] init];
    scrollView.frame = DKViewPageShareManager.controllerViewFrame;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.viewControllers.count * scrollView.dk_width, 0);
    [self addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)dealloc
{
    KRemoveObserver(kKeyPathViewPageFrame)
    KRemoveObserver(kKeyPathTitleViewFrame)
    KRemoveObserver(kKeyPathControllerViewFrame)
    KRemoveObserver(kKeyPathTitleViewBackgroundColor)
    KRemoveObserver(kKeyPathIndicatorColor)
    KRemoveObserver(kKeyPathIndicatorHeight)
}

#pragma mark Observer

/** 添加观察者 */
- (void)setupObserver
{
    KAddObserver(kKeyPathViewPageFrame)
    KAddObserver(kKeyPathTitleViewFrame)
    KAddObserver(kKeyPathControllerViewFrame)
    KAddObserver(kKeyPathTitleViewBackgroundColor)
    KAddObserver(kKeyPathIndicatorColor)
    KAddObserver(kKeyPathIndicatorHeight)
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kKeyPathViewPageFrame] || [keyPath isEqualToString:kKeyPathTitleViewFrame] || [keyPath isEqualToString:kKeyPathControllerViewFrame]) {
        [self setupScrollView];
        [self setupTitlesView];
        [self addVcView];
    } else if ([keyPath isEqualToString:kKeyPathTitleViewBackgroundColor]) {
        self.titlesView.backgroundColor = DKViewPageShareManager.titleViewBackgroundColor;
    } else if ([keyPath isEqualToString:kKeyPathIndicatorColor]) {
        self.indicatorView.backgroundColor = DKViewPageShareManager.indicatorColor;
    } else if ([keyPath isEqualToString:kKeyPathIndicatorHeight]) {
        self.indicatorView.dk_height = DKViewPageShareManager.indicatorHeight;
    }
}

#pragma mark - Private Method

/** 添加控制器的view */
- (void)addVcView
{
    // 控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.dk_width;
    // 取出控制器
    UIViewController *vc = self.viewControllers[index];
    vc.view.frame = self.scrollView.bounds;
    UIEdgeInsets insets = UIEdgeInsetsMake(DKViewPageShareManager.titleViewFrame.size.height, 0, 0, 0);
    if ([vc isKindOfClass:[UITableViewController class]]) {
        // 使tableView有穿透标签栏的效果
        ((UITableViewController *)vc).tableView.contentInset = insets;
        // 准确设置滚动条位置
        ((UITableViewController *)vc).tableView.scrollIndicatorInsets = insets;
    } else {
        // 判断view的第一个子控件是不是ScrollView
        UIView *fristSubview = [vc.view.subviews firstObject];
        if ([fristSubview isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)fristSubview).contentInset = insets;
            ((UIScrollView *)fristSubview).scrollIndicatorInsets = insets;
        } else {
            // 与scrollerView没有关系，把y值下移，偏移值为标签栏的maxY
            vc.view.dk_y += CGRectGetMaxY(DKViewPageShareManager.titleViewFrame);
            vc.view.dk_height -= vc.view.dk_y;
        }
    }
    [self.scrollView addSubview:vc.view];
}

#pragma mark - Events

- (void)titleBtnClick:(DKTitleButton *)titleButton
{
    // 某个标题按钮被重复点击
    if (titleButton == self.selectedTitleButton) {
        [[NSNotificationCenter defaultCenter] postNotificationName:DKTitleButtonDidRepeatClickNotification object:nil];
    }
    
    // 控制按钮状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    
    // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.dk_width = titleButton.titleLabel.dk_width;
        self.indicatorView.dk_centerX = titleButton.dk_centerX;
    }];
    
    // 让UIScrollView滚动到对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.dk_width;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addVcView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.dk_width;
    DKTitleButton *titleButton = self.titlesView.subviews[index];
    if (titleButton != self.selectedTitleButton) {
        // 点击对应的按钮
        [self titleBtnClick:titleButton];
        // 添加控制器的view
        [self addVcView];
    }
}


@end
