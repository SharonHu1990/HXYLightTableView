//
//  ViewController.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableViewProtocol.h"
#import "CustomCell.h"

@interface ViewController ()<HXYTableViewDelegate>
@property (nonatomic, strong) BaseTableViewProtocol *baseTableViewProtocol;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, copy) NSMutableArray *testItems1;
@property (nonatomic, copy) NSMutableArray *testItems2;
@end

static NSString * const CellID = @"CellID";
#define TestItem @[@"测试1测试1测试1测试1测试1测试1测试1",@"测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1"]
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
    _testItems1 = [NSMutableArray arrayWithObjects:@"测试1测试1测试1测试1测试1测试1测试1", @"测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1测试1", nil];

    _testItems2 = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:_testItems1], [NSMutableArray arrayWithArray:_testItems1], [NSMutableArray arrayWithArray:_testItems1] ,nil];
   
    
    //有多个section
    self.baseTableViewProtocol = [[BaseTableViewProtocol alloc] initWithItems:_testItems2 cellIdentifier:CellID numberOfSections:_testItems2.count numberOfRowsInSectionConfigureBlock:^NSInteger(NSInteger sectionNumber) {
        NSArray *oneItem = [_testItems2 objectAtIndex:sectionNumber];
        return oneItem.count;
        
    } cellConfigureBlock:^(CustomCell *cell, id entity, NSIndexPath *indexPath) {
        [cell configureWithObject:entity atIndexPath:indexPath];
    }];
    
    
    /*
    //只有一个section
    self.baseTableViewProtocol = [[BaseTableViewProtocol alloc] initWithItems:testItems2 cellIdentifier:CellID configureCellBlock:^(CustomCell *cell, id entity, NSIndexPath *indexPath) {
        
    }];
     */
    
    self.table.dataSource = self.baseTableViewProtocol;
    self.table.delegate = self.baseTableViewProtocol;
    self.baseTableViewProtocol.delegate = self;
    
    //这一句不能漏掉，否则会报这个错误“Assertion failure in -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:], /SourceCache/UIKit_Sim/UIKit-3347.44/UITableView.m:6245”
    //默认Cell
//    [self.table registerClass:[CustomCell class] forCellReuseIdentifier:CellID];
    //自定义Cell
    [self.table registerNib:[CustomCell customCellNib] forCellReuseIdentifier:CellID];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HXYTableViewDelegate Methods

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomCell cellHeight];
}


-(BOOL)isCellEditable
{
    return YES;
}

-(void)selectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击第%ld行",(long)indexPath.row);
}

-(NSString *)titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%ld个section",section];
}

-(void)deleteRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *tmpArr = [_testItems2 objectAtIndex:indexPath.section];
    [tmpArr removeObjectAtIndex:indexPath.row];
    [self.table reloadData];
}

@end
