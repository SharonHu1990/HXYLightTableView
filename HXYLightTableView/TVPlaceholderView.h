//
//  TVPlaceholderView.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVPlaceholderView : UIView


-(id)initWithTitle:(NSString*)title;

-(id)initWithTitle:(NSString*)title edgeInsets:(UIEdgeInsets)edgeInsets;

-(id)initWithTitle:(NSString*)title imageName:(NSString*)imageName;

-(id)initWithTitle:(NSString*)title imageName:(NSString*)imageName edgeInsets:(UIEdgeInsets)edgeInsets;
@end
