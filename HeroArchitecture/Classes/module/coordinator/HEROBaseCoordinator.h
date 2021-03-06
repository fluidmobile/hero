//
//  HEROBaseCoordinator.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEROViewControllerProtocol.h"

@class HEROBaseRouter,HEROBaseUsecase, HEROBaseViewController;

@interface HEROBaseCoordinator : NSObject
@property (nonatomic, readonly) HEROBaseUsecase* usecase;
@property (nonatomic, strong) HEROBaseRouter* router;
@property (nonatomic, weak) id <HEROViewControllerProtocol> viewLayer;

- (instancetype)initWithUsecase:(HEROBaseUsecase*)usecase;

- (void)requestContentUpdate;
@end
