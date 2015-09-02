//
//  HXYArrayDataSource.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  配置Cell展现样式的代码块
 *
 *  @param cell   UITableViewCell及其子类
 *  @param entity 对应的实体对象
 *  @param indexPath indexPath
 *
 */
typedef void(^TableViewCellConfigureBlock)(id cell , id entity, NSIndexPath *indexPath);

/**
 *  配置不同section中Cell行数的代码块
 *
 *  @param sectionNumber section的下标
 *
 */
typedef NSInteger(^TableViewNumberOfRowsInSectionConfigureBlock)(NSInteger sectionNumber);

@interface HXYArrayDataSource : NSObject <UITableViewDataSource>

/**
 *  构造器1：有多个section，每个section中cell行数不定时使用
 *
 *  @param aItems
 *  @param aCellIdentifier
 *  @param aSectionNumber                           section的数量
 *  @param aNunberOfRowsInSectionConfigureBlock     配置每个section中cell的行数
 *  @param aCellConfigureBlock                      配置每个cell的展现方式
 *
 *  @return Protocal Object
 */
-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
  numberOfSections:(NSInteger)aSectionNumber
numberOfRowsInSectionConfigureBlock:(TableViewNumberOfRowsInSectionConfigureBlock)aNumberOfRowsInSectionConfigureBlock
cellConfigureBlock:(TableViewCellConfigureBlock)aCellConfigureBlock;


/**
 *  构造器2：只有一个section
 *
 *  @param aItems
 *  @param aCellIdentifier
 *  @param aConfigureCellBlock
 *
 *  @return ArrayDataSource Object
 */
-(id)initWithItems:(NSArray *)anItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;


@end
