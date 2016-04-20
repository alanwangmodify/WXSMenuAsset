//
//  WXSBubbleMenu.h
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/12.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXSBubbleBtnItem.h"

NS_ASSUME_NONNULL_BEGIN

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏宽

typedef NS_ENUM (NSInteger,WXSBubbleMenuType){
    WXSBubbleMenuTypeLineToDown,
    WXSBubbleMenuTypeLineToUp,
    WXSBubbleMenuTypeCirle,
    WXSBubbleMenuTypeDefineBySelf
};

typedef void(^clickBlock) (NSInteger clickIndex);


@interface WXSBubbleMenu : UIView

UIKIT_EXTERN const CGFloat btnDistance;

@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSArray *titles;


/**
 *  menu type default: WXSBubbleMenuTypeLineToDown
 */
@property (nonatomic,assign) WXSBubbleMenuType menuType;

/**
 *  init method
 *
 *  @param frame  menu frame
 *  @param images array of images or images'name ,need 'NSString' or 'UIImage' item type
 *  @param words  array of titles ,  need 'NSString' item type
 *
 *  @return instance or nil ,if error occur
 */
-(instancetype)initWithFrame:(CGRect)frame andImgs:(NSArray *)images andTitles:(NSArray *)words;
-(instancetype)initWithImgs:(NSArray *)images andTitles:(NSArray *)words;

/**
 *  set images and titles
 *
 *  @param images array of ‘NSString’(image name) or 'UIImage'
 *  @param titles <#titles description#>
 */
-(void)setImages:(NSArray * _Nonnull)images andtitles:(NSArray *)titles;

-(void)show;


-(instancetype)init UNAVAILABLE_ATTRIBUTE;
-(instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
-(void)setImages:(NSArray * _Nonnull)images UNAVAILABLE_ATTRIBUTE;
-(void)setTitles:(NSArray * _Nonnull)titles UNAVAILABLE_ATTRIBUTE;

@end


NS_ASSUME_NONNULL_END