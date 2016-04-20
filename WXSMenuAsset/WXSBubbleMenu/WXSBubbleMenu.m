
//
//  WXSBubbleMenu.m
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/12.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "WXSBubbleMenu.h"
@interface WXSBubbleMenu()

@property (nonatomic,strong) NSMutableArray *buttonItems;


@end


@implementation WXSBubbleMenu

//-(instancetype)initWithFrame:(CGRect)frame {
//    return [self initWithFrame:frame andImgs:@[] andTitles:@[]];
//}
-(instancetype)initWithFrame:(CGRect)frame andImgs:(NSArray *)images andTitles:(NSArray *)words{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        WXSBubbleBtnItem *btn = [[WXSBubbleBtnItem alloc] initWithFrame:self.bounds WithText:@"菜单" andIconImage:@""];
        btn.isEndHide = NO;
        __weak WXSBubbleMenu *weakSelf = self;
        [btn actionBlock:^{
            [weakSelf show];
        }];
        [self addSubview:btn];
        
        _images = images;
        _titles = words;
        _menuType = WXSBubbleMenuTypeLineToDown;
        [self _addBtns];
    }
    return self;
}

-(instancetype)initWithImgs:(NSArray *)images andTitles:(NSArray *)words {
    return [self initWithFrame:CGRectZero andImgs:images andTitles:words];
}

#pragma mark Getter 
-(NSMutableArray *)buttonItems {
    if (!_buttonItems) {
        _buttonItems = [[NSMutableArray alloc] init];
    }
    return _buttonItems;
}
-(void)setImages:(NSArray *)images andtitles:(NSArray *)titles {
    _images = images;
    _titles = titles;
    [self.buttonItems removeAllObjects];
    [self _addBtns];
}
-(void)show {
 
    int i = 0;
    for (WXSBubbleBtnItem *item in _buttonItems) {
        CGRect rect = item.frame;
        switch (_menuType) {
            case WXSBubbleMenuTypeLineToDown:{
                
                rect.origin.y = i *( self.frame.size.width + 5) ;
                
            }
                break;
                
            default:
                break;
        }
        item.frame = rect;
        i++;
    }
    
}
-(void)_addBtns {
    if (_images.count != _titles.count) return;

    for (int i = 0;i < _images.count;i++) {
        UIImage *image;
        if ([_images[i] isKindOfClass:[NSString class]]) {
            image = [UIImage imageNamed:_images[i]];
        }
        if ([_images[i] isKindOfClass:[UIImage class]]) {
            image = _images[i];
        }
        NSInteger btnNumPerLine = 3;
        
        WXSBubbleBtnItem *item = [[WXSBubbleBtnItem alloc] initWithFrame:self.bounds WithText:_titles[i] andIconImage:image];
//        [self.superview addSubview:item];
        
        [self sendSubviewToBack:item];
        [self.buttonItems addObject:item];
    }
}


-(void)_addAnimation{
    
}

#pragma mark   ----- Class Method ---------



@end
