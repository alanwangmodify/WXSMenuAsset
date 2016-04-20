//
//  ViewController.m
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/11.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark Views
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark Delegate
#pragma mark ---UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"wxsIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"pointDown";
            break;
        case 1:
            cell.textLabel.text = @"bubbleMenu";
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            PointDownMenuDemmoVC *vc = [[PointDownMenuDemmoVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1:{
            BubbleMenuViewController *vc = [[BubbleMenuViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }
            break;
        default:{
            
        }
            break;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    CGPoint point = event.
//    [WXSPointDownMenu showWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) titles:<#(NSArray *)#> andImges:<#(NSArray *)#> clickIndex:<#^(NSInteger clickIndex)clickIndex#>]
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
