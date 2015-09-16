//
//  UITableView+PlaceholderView.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PlaceholderView)

//占位视图
@property (nonatomic, strong) UIView *placeholderView;

/**
 *  默认列表内容为空时显示的视图 居中显示
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle;

/**
 *  默认列表内容为空时显示的视图 存在边距
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle edgeInsets:(UIEdgeInsets)edgeInsets;

/**
 *  自定列表内容为空时显示的视图 居中显示
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 *  @param imageName        <#imageName description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle imageName:(NSString*)imageName;

/**
 *  自定列表内容为空时显示的视图 存在边距
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 *  @param imageName        <#imageName description#>
 *  @param topMargin        <#topMargin description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle imageName:(NSString*)imageName topMargin:(UIEdgeInsets)edgeInsets;


//取消上拉加载更多控件
-(void)unregisterPlaceholder;


@end
