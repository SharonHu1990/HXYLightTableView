//
//  TVPlaceholderView.m
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/2.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "TVPlaceholderView.h"

@implementation TVPlaceholderView
{
    UIView *_internalView;                     //内部视图
    NSString *_title;                          //标题
    UIImageView *_hintIMV;                     //提示图片
    NSString *_imageName;                      //图片
    UILabel *_hintLabel;                       //提示内容
    UIEdgeInsets _edgeInsets;                       //上偏移
    __weak UITableView *_ofObject;             //被观察者
}

-(id)initWithTitle:(NSString*)title{
    self=[super init];
    if(self){
        _title=title;
        _edgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
        _imageName=@"list_tb";
    }
    return self;
}

-(id)initWithTitle:(NSString*)title edgeInsets:(UIEdgeInsets)edgeInsets{
    self=[super init];
    if(self){
        _title=title;
        _edgeInsets=edgeInsets;
        _imageName=@"list_tb";
    }
    return self;
}

-(id)initWithTitle:(NSString*)title imageName:(NSString*)imageName{
    self=[super init];
    if(self){
        _title=title;
        _edgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
        _imageName=imageName;
    }
    return self;
}

-(id)initWithTitle:(NSString*)title imageName:(NSString*)imageName edgeInsets:(UIEdgeInsets)edgeInsets{
    self=[super init];
    if(self){
        _title=title;
        _edgeInsets=edgeInsets;
        _imageName=imageName;
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    _ofObject=(UITableView *)object;
    if([keyPath isEqualToString:@"contentSize"])
    {
        CGSize newContentSize = [[change objectForKey:NSKeyValueChangeNewKey] CGSizeValue];
        
        //内容为空
        if(CGSizeEqualToSize(newContentSize,CGSizeMake(newContentSize.width, 0))){
            [self installView:newContentSize];
        }
        else
        {
            [self uninstall];
        }
    }
}

-(void)installView:(CGSize)contentSize{
    _internalView.hidden=NO;
    _hintIMV.hidden=NO;
    _hintLabel.hidden=NO;
    if(_internalView==nil){
        
        _internalView=[[UIView alloc] init];
        //_internalView.backgroundColor=[UIColor redColor];
        [self addSubview:_internalView];
        
        _hintIMV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
        [self addSubview:_hintIMV];
        
        _hintLabel=[[UILabel alloc] init];
        [_hintLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_hintLabel setTextColor:kColorWithHex(0X969696)];
        [_hintLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_hintLabel];
    }
    CGRect rect=self.superview.bounds;
    _internalView.frame=CGRectMake(_edgeInsets.left,
                                   _edgeInsets.top,
                                   rect.size.width-_edgeInsets.left-_edgeInsets.right,
                                   rect.size.height-_edgeInsets.top-_edgeInsets.bottom);
    [_hintIMV setCenter:_internalView.center];
    
    _hintLabel.bounds=CGRectMake(0, 0, rect.size.width, 12);
    [_hintLabel setCenter:CGPointMake(_internalView.center.x, _internalView.center.y+11+19)];
    _hintLabel.text=_title;
}

-(void)uninstall{
    _internalView.hidden=YES;
    _hintIMV.hidden=YES;
    _hintLabel.hidden=YES;
}


@end
