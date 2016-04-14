//
//  KZTouchIDTool.m
//  KZTouchIDTest
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KZTouchIDTool.h"
#import "LocalAuthentication/LAContext.h"

#import "UIImage+ImageEffects.h"
#import "KZUtil.h"

@implementation KZTouchIDTool

+ (void)usingTouchID {
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    
    //判断touch id 是否可用
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        
        ///锁定的图片
        __block UIImageView *imgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        imgView.image = [KZUtil GaussianBlurImage:[KZUtil getScreenshots] radius:8.0];
        imgView.userInteractionEnabled = YES;
        [[UIApplication sharedApplication].delegate.window addSubview:imgView];
        
        NSString *myLocalizedReasonString = @"请输入指纹";
        
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                  
                                    NSLog(@"输入正确");
                                    
                                    if ([NSThread currentThread].isMainThread) {
                                            [imgView removeFromSuperview];
                                    }
                                    else {
                                        dispatch_sync(dispatch_get_main_queue(), ^{
                                                [imgView removeFromSuperview];
                                        });
                                    }
                                    
                                    imgView = nil;
                                    
                                } else {
                                    
                                    
                                    NSLog(@"输入错误, 或者取消 ---\n%@", error);
                                    
                                    
                                }
                            }];
    } else {
         NSLog(@"设备不支持Touch ID");
    }
}



@end
