//
//  HEROBaseUsecase.h
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEROBaseCoordinator.h"
NS_ASSUME_NONNULL_BEGIN
@interface HEROBaseUsecase : NSObject
@property (nonatomic, weak) HEROBaseCoordinator* coordinator;
- (void)requestContentUpdate;
@end
NS_ASSUME_NONNULL_END
