//
//  ViewController.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableViewProtocol.h"

@interface ViewController ()<UITableViewDelegate>
@property (nonatomic, strong) BaseTableViewProtocol *baseTableViewProtocol;
@property (nonatomic, strong) UITableView *table;
@end

static NSString * const CellID = @"CellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.table];
    
    [self setupTable];
    
}

-(void)setupTable
{
    NSArray *items = @[@"1",@"1",@"1",@"1",@"1",@"1"];
    //这里也可以传自定义的Cell
    self.baseTableViewProtocol = [[BaseTableViewProtocol alloc] initWithItems:items cellIdentifier:CellID configureCellBlock:^(UITableViewCell *cell, id entity, NSIndexPath *indexPath) {
        /**
         *  如果传递的是自定义Cell，就执行自定义Cell定义的方法
         */
        [cell.textLabel setText:entity];
    }];
    
    self.table.dataSource = self.baseTableViewProtocol;
    self.table.delegate = self;
    
    //这一句不能漏掉，否则会报这个错误“Assertion failure in -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:], /SourceCache/UIKit_Sim/UIKit-3347.44/UITableView.m:6245”
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
