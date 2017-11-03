//
//  NPWireFrameHelper.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NPWireFrameHelper : NSObject


+ (UIViewController *)viewControllerFromViewFromWireFrame:(id<NPCommonWireFrameInterface>)aFromWireFrame;
+ (id<NPCommonWireFrameInterface>)nextWireFrameFromWireFrame:(id<NPCommonWireFrameInterface>)aFromWireFrame;


@end
