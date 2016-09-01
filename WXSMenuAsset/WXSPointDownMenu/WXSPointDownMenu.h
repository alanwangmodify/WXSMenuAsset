//
//  WXSPointDownMenu.h
//  WXSMenuAsset
//
//  Created by 王小树 on 15/7/10.
//  Copyright © 2015年 王小树. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXSConfig.h"
#import "WXSMenuItemCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickIndexBlock) (NSInteger clickIndex);

@interface WXSPointDownMenu : UIView <UITableViewDataSource,UIGestureRecognizerDelegate,UITableViewDelegate>


/**
 *  YES - can show selected state
 */
@property (nonatomic,assign) BOOL isSelect;
/**
 *  index of selected row
 */
@property (nonatomic,assign) NSInteger selectIndex;

/**
 *   show the image of background  default : NO
 */
@property (nonatomic,assign) BOOL  showBackgroundImg;


/**
 *   background color of list defult :[UIColor whiteColor]
 */
@property (nonatomic,strong) UIColor *bgColor;


/**
 *  color of text
 */
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *selectedTextColor;

/**
 *  font of text 。 defult : [UIFont systemFontOfSize:12.0f]
 */
@property (nonatomic,strong) UIFont  *textFont;

/**
 *  height of row . default: 40.0
 */
@property (nonatomic,assign) CGFloat rowHeight;

/**
 *  Init Method
 *
 *  @param frame       fram of super view
 *  @param btnNames   a array of buttons' name
 *  @param ImgNames   a array of images' name
 *  @param view       a superview that menu show at
 *  @param clickIndex a block call back click action with index
 *  @param index      button index
 *
 *  @return a instance,or nil if error
 */
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)btnNames andImges:(NSArray *)images btnListFrame:(CGRect)btnListFram  clickIndex:(ClickIndexBlock)clickIndex;


-(void)show;
-(void)hideView;

-(instancetype)init UNAVAILABLE_ATTRIBUTE;
-(instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
-(instancetype)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;
-(void)setBackgroundColor:(UIColor *)backgroundColor UNAVAILABLE_ATTRIBUTE;


//============================  Class Method  ===========================================

/**
 *  a method for showing menu on window without images
 *
 *  @param rect       menu's frame
 *  @param btnNames   a array of buttons' name
  *  @param clickIndex a block call back click action with index
 */
+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames clickIndex:(ClickIndexBlock)clickIndex;

/**
 *  a method for showing menu on window
 *
 *  @param rect       menu's frame
 *  @param btnNames   a array of buttons' name
 *  @param ImgNames   a array of images' name
 *  @param clickIndex a block call back click action with index
 */
+(WXSPointDownMenu *)showWithFrame:(CGRect)rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames clickIndex:(ClickIndexBlock)clickIndex;
/**
 *  a method for showing menu on a superview
 *
 *  @param rect       menu's frame
 *  @param btnNames   a array of buttons' name
 *  @param ImgNames   a array of images' name
 *  @param view       a superview that menu show at
 *  @param clickIndex a block call back click action with index
 */
+(WXSPointDownMenu *)showWithFrame:(CGRect )rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames atView:(UIView*)view clickIndex:(ClickIndexBlock)clickIndex;
/**
 *  a method for showing menu on a superview
 *
 *  @param rect       menu's frame
 *  @param btnNames   a array of buttons' name
 *  @param ImgNames   a array of images' name
 *  @param view       a superview that menu show at
 *  @param clickIndex a block call back click action with index
 *  @param index      button index
 */
+(WXSPointDownMenu *)showWithFrame:(CGRect )rect titles:(NSArray *)btnNames andImges:(NSArray *)ImgNames atView:(UIView*)view selectIndex:(NSUInteger)index clickIndex:(ClickIndexBlock)clickIndex ;

@end

NS_ASSUME_NONNULL_END
