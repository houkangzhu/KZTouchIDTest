//
//  HKUtil.h
//  KZTouchIDTest
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KZUtil : NSObject

/**
 *  当前屏幕截图
 *
 *  @return 截图
 */
+ (UIImage *)getScreenshots;

/**
 *  模糊图像
 *
 *  @param oldImg 原Image
 *  @param radius 模糊后的Image
 *
 *  @return <#return value description#>
 */
+ (UIImage *)GaussianBlurImage:(UIImage *)oldImg radius:(CGFloat)radius;

@end
