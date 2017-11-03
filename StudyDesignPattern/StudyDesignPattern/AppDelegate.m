//
//  AppDelegate.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AppDelegate.h"
#import "NPMainDependencyInjector.h"
#import "NPMainWireFrameProtocolDefine.h"


@interface AppDelegate ()

@property (strong, nonatomic, readonly) id<NPCommonWireFrameInterface> mainWireFrame;

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
    NPMainDependencyInjector *sMainDI = [NPMainDependencyInjector new];
    _mainWireFrame = [sMainDI wireFrameWithInjectedDependencies];
    
    if([self.mainWireFrame conformsToProtocol:@protocol(NPMainWireFrameInterface)])
    {
        [(id<NPMainWireFrameInterface>)self.mainWireFrame showMainViewControllerFromWindow:self.window];
    }
    
    return YES;
}


@end
