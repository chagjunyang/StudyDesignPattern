//
//  NPBaseDependencyInjector.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NPBaseDependencyInjector : NSObject <NPCommonDependencyInjectorInterface>


@property (strong, nonatomic, readwrite) Class wireFrame;
@property (strong, nonatomic, readwrite) Class nextDependencyInjector;
@property (strong, nonatomic, readwrite) Class presenter;
@property (strong, nonatomic, readwrite) Class view;
@property (strong, nonatomic, readwrite) Class interactor;


@end
