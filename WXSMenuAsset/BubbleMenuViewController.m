//
//  BubbleMenuViewController.m
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/13.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "BubbleMenuViewController.h"

@interface BubbleMenuViewController ()

@end

@implementation BubbleMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    WXSBubbleMenu *men =[[WXSBubbleMenu alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//    men.backgroundColor = [UIColor redColor];
//    [self.view addSubview:men];
    self.view.backgroundColor = [UIColor whiteColor];
    
    WXSBubbleBtnItem *b = [[WXSBubbleBtnItem alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    b.isEndHide = NO;
    [b actionBlock:^{
        b.isEndHide = !b.isEndHide;
    }];
    [self.view addSubview:b];
    
    WXSBubbleMenu *m = [[WXSBubbleMenu alloc] initWithFrame:CGRectMake(10, 100, 40, 40) andImgs:@[@"",@"",@"",@""] andTitles:@[@"1",@"2",@"3",@"4"]];
    [self.view addSubview:m];
    m.backgroundColor = [UIColor redColor];
//    [m show];
    
//    WXSBubbleMenu *m = [[WXSBubbleMenu alloc] initWithImgs:@[@"",@"",@"",@"",@"",@""] andTitles:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
//    [self.view addSubview:m];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
