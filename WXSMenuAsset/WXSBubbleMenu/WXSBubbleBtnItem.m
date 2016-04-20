//
//  WXSBubbleBtnItem.m
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/12.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSBubbleBtnItem.h"

@implementation WXSBubbleBtnItem


-(instancetype)initWithFrame:(CGRect)frame WithText:(NSString *)text andIconImage:(id)iconImage {
    self = [super initWithFrame:frame];
    if (self) {
        
//------------------ Default setting ----------------
        self.backgroundColor = UIColorFromRGB(0xe83260);;
        _isClickAnimation = YES;
        self.shapeType = WXSButtonShapeTypeCircle;
        self.layer.cornerRadius = self.bounds.size.width/2;
        self.clipsToBounds = YES;
        self.isEndHide = NO;
        
        if ([iconImage isKindOfClass:[NSString class]]) {
            self.iconImgView.image = [UIImage imageNamed:iconImage];
        }
        
        if ([iconImage isKindOfClass:[UIImage class]]) {
            self.iconImgView.image = iconImage;
        }
        
        self.iconImgView.frame = self.bounds;
        [self addSubview:self.iconImgView];
        
    }
    return self;
}
-(instancetype)initWithText:(NSString *)text andIconImage:(id)iconImage{
    return [self initWithFrame:CGRectZero WithText:text andIconImage:iconImage];
}

-(instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame WithText:@"" andIconImage:@""];
}

#pragma mark Getter Method
-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.backgroundColor = [UIColor clearColor];
    }
    return _iconImgView;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
#pragma mark
-(void)hide {
    __weak WXSBubbleBtnItem *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.alpha = 0.4;
        weakSelf.layer.transform = CATransform3DMakeScale(2, 2, 1);
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
        
    }];
}
-(void)actionBlock:(TouchBlock)touchBlock {
    _touchBlock =  touchBlock;
}
#pragma mark
-(void)_touchAction{
    if (_touchBlock) {
        _touchBlock();
    }
    
    __weak WXSBubbleBtnItem *weakSelf = self;
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:blockOperation];
    
}


#pragma mark touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_isClickAnimation) {
        __weak WXSBubbleBtnItem *weakSelf = self;
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.layer.transform = CATransform3DMakeScale(1.15, 1.15, 1);
        }];
    }
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.lastObject;
    if (_isClickAnimation) {
        
        __weak WXSBubbleBtnItem *weakSelf = self;
        
        CGPoint p = [touch locationInView:self];
        if (p.x <self.frame.size.width && p.y  < self.frame.size.height) {
            
            if (self.isEndHide) {
                NSInvocationOperation *opertation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(hide) object:nil];
                [opertation start];
            }else {
                [UIView animateWithDuration:0.2 animations:^{
                    weakSelf.layer.transform = CATransform3DIdentity;
                }];
            }
            
            [weakSelf _touchAction];
            
        }else {
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.layer.transform = CATransform3DIdentity;
            }];
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
