//
//  DeviceInfo.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "DeviceInfo.h"


@implementation DeviceInfo


+ (CGSize)deviceSize
{
    return ([[UIScreen mainScreen] bounds].size);
}


@end
