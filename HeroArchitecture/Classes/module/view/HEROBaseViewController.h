//
//  HEROBaseViewController.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 17/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HEROBaseCoordinator;

@interface HEROBaseViewController : UIViewController
@property (nonatomic, strong) HEROBaseCoordinator* coordinator;
- (void)requestContentUpdate;
@end
