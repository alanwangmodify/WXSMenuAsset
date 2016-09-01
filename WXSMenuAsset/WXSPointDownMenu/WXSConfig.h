//
//  WXSConfig.h
//  WXSMenuAsset
//
//  Created by 王小树 on 16/4/11.
//  Copyright © 2016年 王小树. All rights reserved.
//

#ifndef WXSConfig_h
#define WXSConfig_h
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏宽


#define UIColorFromRGB(rgbValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]

#endif /* WXSConfig_h */
