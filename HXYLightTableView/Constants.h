//
//  Constants.h
//  HXYLightTableView
//
//  Created by 胡晓阳 on 15/9/6.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#ifndef HXYLightTableView_Constants_h
#define HXYLightTableView_Constants_h

//屏幕宽高
#define DeviceWidth [UIScreen mainScreen].bounds.size.width
#define DeviceHeight [UIScreen mainScreen].bounds.size.height


//色值 参数格式为：0xFFFFFF
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//色值 参数格式为：（222,222,222）
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

//色值 参数格式为：（222,222,222，0.5）
#define kColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:(a)]


#endif
