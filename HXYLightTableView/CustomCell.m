//
//  CustomCell.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/6.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "CustomCell.h"
#import "Constants.h"

@implementation CustomCell

+(UINib *)customCellNib
{
    return [UINib nibWithNibName:@"CustomCell" bundle:nil];
}

-(void)configureWithObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    if (object) {
        [self.contentLB setText:object];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
}

@end
