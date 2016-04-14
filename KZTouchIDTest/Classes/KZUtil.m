//
//  HKUtil.m
//  KZTouchIDTest
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "KZUtil.h"
#import "UIImage+ImageEffects.h"

@implementation KZUtil

+ (UIImage *)getScreenshots {
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    ///保存到相册
    //    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    return viewImage;
}


+ (UIImage *)GaussianBlurImage:(UIImage *)oldImg radius:(CGFloat)radius{
    return [oldImg applyBlurWithRadius:radius tintColor:[UIColor colorWithWhite:0.97 alpha:0.2] saturationDeltaFactor:2 maskImage:nil];
}
@end
