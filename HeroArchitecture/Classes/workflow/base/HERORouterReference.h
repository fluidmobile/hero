//
//  FMRouterReference.h
//  VERWUSPL
//
//  Created by Thomas on 05.10.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface HERORouterReference : NSObject
-(instancetype)initWithRouter:(HEROBaseRouter*)router;
@property (nonatomic, weak) HEROBaseRouter* router;
@end
NS_ASSUME_NONNULL_END
