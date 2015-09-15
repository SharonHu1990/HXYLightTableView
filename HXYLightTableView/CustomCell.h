//
//  CustomCell.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/6.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLB;
@property (nonatomic, retain) NSDictionary *objectDic;
+(UINib *)customCellNib;


-(void)configureWithObject:(id)object atIndexPath:(NSIndexPath *)indexPath;
@end
