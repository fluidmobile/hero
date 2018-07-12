//
//  FMRouterReference.h
//  VERWUSPL
//
//  Created by Thomas on 05.10.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseRouter.h"
#import <Foundation/Foundation.h>

@interface HERORouterReference : NSObject
-(instancetype)initWithRouter:(HEROBaseRouter*)router;
@property (nonatomic, weak) HEROBaseRouter* router;
@end
