//
//  WXSPointDownMenu.m
//  WXSMenuAsset
//
//  Created by 王小树 on 15/7/10.
//  Copyright © 2015年 王小树. All rights reserved.
//

#import "WXSPointDownMenu.h"

#define TOP_OFFSET_DISTANCE 12.0

@interface WXSPointDownMenu ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *btnNames;
@property (nonatomic,strong) NSArray *imgNames;
@property (nonatomic,copy) ClickIndexBlock clickIndexCallBack;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,assign) CGFloat menuHeight;
@property (nonatomic,strong) UIImageView *backgImgView;



@end
@implementation WXSPointDownMenu


-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)btnNames andImges:(NSArray *)images btnListFrame:(CGRect)btnListFram  clickIndex:(ClickIndexBlock)clickIndex{
    self = [super initWithFrame:frame];
    if (self) {
        
        //data
        _btnNames = btnNames;
        _imgNames = images;
        _clickIndexCallBack =  [clickIndex copy];
        _menuHeight = btnListFram.size.height;
        _textColor = UIColorFromRGB(0x666666);
        _selectedTextColor = UIColorFromRGB(0xe83260);
        _rowHeight = 40.0;
        
        
        //backImgView
        [self addSubview:self.backgImgView];
        [_backgImgView setContentMode:UIViewContentModeScaleToFill];
        _backgImgView.frame = CGRectMake(btnListFram.origin.x, btnListFram.origin.y - TOP_OFFSET_DISTANCE, btnListFram.size.width, 0);
        //tableVIew
        [_backgImgView addSubview:self.tableView];
        
    }
    return self;
}
#pragma mark Data

-(void)setTextColor:(UIColor *)textColor {
    self.textColor = textColor;
    [self.tableView reloadData];
}

#pragma mark View
-(UIImageView *)backgImgView {
    if (!_backgImgView) {
        _backgImgView = [[UIImageView alloc] init];
        _backgImgView.backgroundColor = [UIColor clearColor];
        _backgImgView.userInteractionEnabled = YES;
        _backgImgView.layer.masksToBounds = YES;
    }
    return _backgImgView;
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,TOP_OFFSET_DISTANCE, _backgImgView.frame.size.width, 0) style:UITableViewStylePlain];
        self.tableView .delegate = self;
        self.tableView .dataSource = self;
        self.tableView .alwaysBounceHorizontal = NO;
        self.tableView .alwaysBounceVertical = NO;
        self.tableView .showsHorizontalScrollIndicator = NO;
        self.tableView .showsVerticalScrollIndicator = NO;
        self.tableView .scrollEnabled = YES;
        self.tableView .backgroundColor = [UIColor whiteColor];
        self.tableView.separatorColor = UIColorFromRGB(0xdddddd) ;
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        self.tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
#pragma mark  Action
-(void)hideView {
    
    [UIView animateWithDuration:0.15f animations:^{
        CGRect rect = _backgImgView.frame;
        rect.size.height = 0;
        CGRect rect1 = _tableView.frame;
        rect1.size.height = 0;
        
        _backgImgView.frame = rect;
        _tableView.frame = rect1;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)show {
    
    
    [UIView animateWithDuration:0.15f animations:^{
        CGRect rect = _backgImgView.frame;
        rect.size.height = _menuHeight + TOP_OFFSET_DISTANCE;
        _backgImgView.frame = rect;
        _tableView.frame =CGRectMake(0,TOP_OFFSET_DISTANCE, _backgImgView.frame.size.width , _menuHeight);
    }];
}

#pragma mark  UITableView DataSource  UITableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _btnNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    WXSMenuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WXSMenuItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if ([_imgNames count] == [_btnNames count]) {
        cell.imageView.image = [UIImage imageNamed:[_imgNames objectAtIndex:indexPath.row]];
    }
    
    
    if (_isSelect == YES) {
        cell.textLabel.textColor = indexPath.row == self.selectIndex? self.selectedTextColor:self.textColor;
    }else {
        cell.textLabel.textColor = self.textColor;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
    if (_textFont) {
        cell.textLabel.font = _textFont;
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [_btnNames objectAtIndex:indexPath.row];
    [cell setSeparatorInset:UIEdgeInsetsMake(SCREEN_WIDTH,0,0,0)];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self hideView];
    _clickIndexCallBack(indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return _rowHeight;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

#pragma mark  setter method 
-(void)setRowHeight:(CGFloat)rowHeight {
    _rowHeight = rowHeight;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}
- (void)setSelectedTextColor:(UIColor *)selectedTextColor {
    _selectedTextColor = selectedTextColor;
    [self.tableView reloadData];
    
}
- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    [self.tableView reloadData];
}

- (void)setShowBackgroundImg:(BOOL)showBackgroundImg {
    _showBackgroundImg = showBackgroundImg;
    
    if (showBackgroundImg) {
        NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"WXSPointDownMenu.bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        NSString *imagePath = [bundle pathForResource:@"pointDownMenu_bg" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        _backgImgView.image = [image stretchableImageWithLeftCapWidth:15 topCapHeight:20];
    }else {
        _backgImgView.image = nil;
    }
    
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.tableView.backgroundColor = bgColor;
}
#pragma mark ------------------------------------------------------------------
#pragma mark  methods for showing menu
+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames atView:(UIView *)view clickIndex:(ClickIndexBlock)clickIndex {
    WXSPointDownMenu *pointDownMenu = [[WXSPointDownMenu alloc] initWithFrame:view.bounds titles:btnNames andImges:ImgNames btnListFrame:rect clickIndex:clickIndex];
    pointDownMenu.isSelect = NO;
    [view addSubview:pointDownMenu];
    [pointDownMenu show];
    return pointDownMenu;
}
+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames atView:(UIView *)view selectIndex:(NSUInteger)index clickIndex:(ClickIndexBlock)clickIndex {
    WXSPointDownMenu *pointDownMenu = [[WXSPointDownMenu alloc] initWithFrame:view.bounds titles:btnNames andImges:ImgNames btnListFrame:rect clickIndex:clickIndex];
    pointDownMenu.isSelect = YES;
    pointDownMenu.selectIndex = index;
    [view addSubview:pointDownMenu];
    [pointDownMenu show];
    return pointDownMenu;
}


+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames clickIndex:(ClickIndexBlock)clickIndex {
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    WXSPointDownMenu *pointDownMenu = [[WXSPointDownMenu alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) titles:btnNames andImges:ImgNames btnListFrame:rect clickIndex:clickIndex];
    pointDownMenu.isSelect = NO;
    [window addSubview:pointDownMenu];
    [pointDownMenu show];
    return pointDownMenu;
}

+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames clickIndex:(ClickIndexBlock)clickIndex {
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    WXSPointDownMenu *pointDownMenu = [[WXSPointDownMenu alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) titles:btnNames andImges:@[] btnListFrame:rect clickIndex:clickIndex];
    pointDownMenu.isSelect = NO;
    [window addSubview:pointDownMenu];
    [pointDownMenu show];
    return pointDownMenu;
}
#pragma mark others
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideView];
}
@end
