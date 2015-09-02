//
//  HXYArrayDataSource.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "HXYArrayDataSource.h"

@interface HXYArrayDataSource ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewNumberOfRowsInSectionConfigureBlock numberOfRowsInSectionConfigureBlock;

@end

@implementation HXYArrayDataSource

-(id)init{
    return nil;
}

-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = aItems;
        self.cellIdentifier = [aCellIdentifier copy];
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

-(id)initWithItems:(NSArray *)anItem cellIdentifier:(NSString *)aCellIdentifier numberOfSections:(NSInteger)aSectionNumber numberOfRowsInSectionConfigureBlock:(TableViewNumberOfRowsInSectionConfigureBlock)aNumberOfRowsInSectionBlock configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItem;
        self.cellIdentifier = [aCellIdentifier copy];
        self.numberOfRowsInSectionConfigureBlock = [aNumberOfRowsInSectionBlock copy];
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

-(id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.numberOfRowsInSectionConfigureBlock) {
        return self.numberOfRowsInSectionConfigureBlock(section);
    }
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    self.configureCellBlock(cell, [self itemAtIndexPath:indexPath], indexPath);
    return cell;
}

@end
