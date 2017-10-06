//
//  DEMOContainerUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOContainerUsecase.h"


@implementation DEMOContainerUsecase
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }

    return self;
}

-(void)dealloc{
    //REMEMBER: if you use KVO remove in dealloc
}
@end
