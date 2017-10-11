//
//  OpenFlashLight.m
//  3DTouchDemo
//
//  Created by 杜文亮 on 2017/10/11.
//  Copyright © 2017年 杜文亮. All rights reserved.
//

#import "OpenFlashLight.h"
#import <AVFoundation/AVFoundation.h>

@implementation OpenFlashLight

+ (void) turnTorchOn: (bool) on
{
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil)
    {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash])// 前一个判断是否有闪光灯
        {
            [device lockForConfiguration:nil];// 请求独占访问硬件设备
            if (on)
            {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
            }
            else
            {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
            }
            [device unlockForConfiguration];// 请求解除独占访问硬件设备
        }
        else
        {
            NSLog(@"设备没有闪光灯！");
        }
    }
}

@end
