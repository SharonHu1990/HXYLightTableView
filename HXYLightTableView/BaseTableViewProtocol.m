//
//  BaseTableViewProtocol.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/6.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "BaseTableViewProtocol.h"


@interface BaseTableViewProtocol ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, assign) NSInteger numberOfSections;//section个数
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewNumberOfRowsInSectionConfigureBlock numberOfRowsInSectionConfigureBlock;
@end

@implementation BaseTableViewProtocol

-(id)init{
    return nil;
}

-(id)initWithItems:(NSArray *)aItems cellIdentifier:(NSString *)aCellIdentifier numberOfSections:(NSInteger)aSectionNumber numberOfRowsInSectionConfigureBlock:(TableViewNumberOfRowsInSectionConfigureBlock)aNumberOfRowsInSectionConfigureBlock cellConfigureBlock:(TableViewCellConfigureBlock)aCellConfigureBlock
{
    self = [super init];
    if (self) {
        self.items = aItems;
        self.cellIdentifier = aCellIdentifier;
        self.numberOfRowsInSectionConfigureBlock = aNumberOfRowsInSectionConfigureBlock;
        self.configureCellBlock = aCellConfigureBlock;
    }
    return self;
}

-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    return [self initWithItems:aItems cellIdentifier:aCellIdentifier numberOfSections:1 numberOfRowsInSectionConfigureBlock:nil cellConfigureBlock:aConfigureCellBlock];
}



-(id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.numberOfSections;
}


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

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(isCellEditable)]) {
        return [self.delegate isCellEditable];
    }
    return NO;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(deleteRowAtIndexPath:)]) {
            [self.delegate deleteRowAtIndexPath:indexPath];
        }
    }
}


#pragma mark - UITableViewDelegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
