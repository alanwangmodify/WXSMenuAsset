//
//  WXSBubbleBtnItem.h
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/12.
//  Copyright © 2016年 王小树. All rights reserved.
//

#define UIColorFromRGB(rgbValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WXSButtonShapeType) {
    WXSButtonShapeTypeCircle = 0,
    WXSButtonShapeTypeNormal = 1
};

typedef void(^TouchBlock)();

@interface WXSBubbleBtnItem : UIView


@property (nonatomic,assign) WXSButtonShapeType shapeType;
@property (nonatomic,copy) TouchBlock touchBlock;
@property (nonatomic,assign) BOOL isClickAnimation;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *iconImgView;


/**
 *  if neet to hide button after touch ,set it YES .DEFAULT : NO
 */
@property (nonatomic,assign) BOOL isEndHide;



/**
 *  init method
 *
 *  @param frame      item frame
 *  @param text       title word
 *  @param iconImage 'UIImage' or 'NSString'(name of image)
 *
 *  @return instance ,or nil if error occur
 */
-(instancetype)initWithFrame:(CGRect)frame WithText:(NSString *)text andIconImage:(id)iconImage;

/**
 *  touch action
 *
 *  @param touchBlock action code after touching end
 */
-(void)actionBlock:(TouchBlock )touchBlock;


-(void)hide;

-(instancetype)init UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END