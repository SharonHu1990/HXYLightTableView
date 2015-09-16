//
//  UITableView+PlaceholderView.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "UITableView+PlaceholderView.h"
#import <objc/runtime.h>
#import "TVPlaceholderView.h"

@implementation UITableView (PlaceholderView)

/**
 *  列表为空时的视图
 */
- (UIView *)placeholderView {
    return objc_getAssociatedObject(self, @selector(placeholderView));
}
- (void)setPlaceholderView:(UIView *)value {
    objc_setAssociatedObject(self, @selector(placeholderView), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 *  默认列表内容为空时显示的视图 居中显示
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle{
    self.placeholderView=[[TVPlaceholderView alloc] initWithTitle:placeholderTitle];
    [self intenalReisterPlaceholder];
}

/**
 *  默认列表内容为空时显示的视图 存在边距
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle edgeInsets:(UIEdgeInsets)edgeInsets{
    self.placeholderView=[[TVPlaceholderView alloc] initWithTitle:placeholderTitle edgeInsets:edgeInsets];
    [self intenalReisterPlaceholder];

}

/**
 *  自定列表内容为空时显示的视图 居中显示
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 *  @param imageName        <#imageName description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle imageName:(NSString*)imageName{
    self.placeholderView=[[TVPlaceholderView alloc] initWithTitle:placeholderTitle imageName:imageName];
    [self intenalReisterPlaceholder];
}

/**
 *  自定列表内容为空时显示的视图 存在边距
 *
 *  @param placeholderTitle <#placeholderTitle description#>
 *  @param imageName        <#imageName description#>
 *  @param topMargin        <#topMargin description#>
 */
-(void)registerPlaceholder:(NSString*)placeholderTitle imageName:(NSString*)imageName topMargin:(UIEdgeInsets)edgeInsets{
    self.placeholderView=[[TVPlaceholderView alloc] initWithTitle:placeholderTitle imageName:imageName edgeInsets:edgeInsets];
    [self intenalReisterPlaceholder];
}


-(void)intenalReisterPlaceholder{

    [self setTableFooterView:self.placeholderView];
    
    [self addObserver:self.placeholderView
           forKeyPath:@"contentSize"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:NULL];
}


//取消上拉加载更多控件
-(void)unregisterPlaceholder{
    [self removeObserver:self.placeholderView forKeyPath:@"contentSize"];
}

@end
