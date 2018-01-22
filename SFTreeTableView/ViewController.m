//
//  ViewController.m
//  SFTreeTableView
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.easyhospital. All rights reserved.
//

#import "ViewController.h"
#import "SFTreeTV.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 10; i++) {
        SFListModel *model = [[SFListModel alloc] init];
        model.title = @"aaassss";
        model.desc = @"adhjcab";
        [array addObject:model];
    }
    
    NSMutableArray *sub = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    SFTreeTV *mainTV = [[SFTreeTV alloc] initWithFrame:self.view.bounds data:array subDatas:dict];
    self.view = mainTV;
    [mainTV reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
