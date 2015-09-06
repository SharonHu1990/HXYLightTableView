//
//  BaseTableViewProtocol.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/6.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//----------------------------------------------------声明回调Block---------------------------------------------------------
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

//------------------------------------------声明 HXYTableViewDelegate 的代理方法--------------------------------------------
@protocol HXYTableViewDelegate <NSObject>

@optional

/**
 *  点击或选中Cell的代理方法
 *
 *  @param indexPath
 */
-(void)selectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  删除Cell的代理方法
 *
 *  @param indexPath
 */
-(void)deleteRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  根据返回值判断Cell是否可以被编辑（移动，删除，插入等）
 *
 *  @return YES:can  NO:can not
 */
-(BOOL)isCellEditable;

/**
 *  根据返回值确定每个section的标题
 *
 *  @param section
 *
 *  @return title
 */
-(NSString *)titleForHeaderInSection:(NSInteger)section;

/**
 *  根据返回结果确定section的View
 *
 *  @param section
 *
 *  @return 返回的view
 */
-(UIView *)viewForHeaderInSection:(NSInteger)section;

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
//-----------------------------------------BaseTableviewProtocol Interface-------------------------------------------------


@interface BaseTableViewProtocol : NSObject <UITableViewDataSource, UITableViewDelegate>

//声明UITableViewDelegate 和 UITableViewDataSource 的代理
@property (nonatomic, assign) id<HXYTableViewDelegate> delegate;

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
