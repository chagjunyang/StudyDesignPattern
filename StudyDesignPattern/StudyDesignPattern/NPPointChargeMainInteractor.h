//
//  NPPointChargeMainInteractor.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainInteractorProtocolDefine.h"
#import "NPPointChargeMainDataManagerProtocolDefine.h"


@interface NPPointChargeMainInteractor : NSObject <NPPointChargeMainInteractorInterface>

@property (strong, nonatomic ,readwrite) id<NPPointChargeMainDataManagerInterface> dataManager;

@end
