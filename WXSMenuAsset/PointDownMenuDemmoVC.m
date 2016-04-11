//
//  PointDownMenuDemmoVC.m
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/11.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "PointDownMenuDemmoVC.h"
#import "WXSPointDownMenu.h"
@interface PointDownMenuDemmoVC ()

@end

@implementation PointDownMenuDemmoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSSet *touchSet = event.allTouches;
    UITouch *touch =  touchSet.allObjects.lastObject;
    CGPoint p = [touch locationInView:self.view];
    [WXSPointDownMenu showWithFrame:CGRectMake(p.x - 50, p.y + 8, 100, 150) titles:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"] clickIndex:^(NSInteger clickIndex) {

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
