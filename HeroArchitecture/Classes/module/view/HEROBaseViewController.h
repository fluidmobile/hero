//
//  HEROBaseViewController.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 17/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HEROViewControllerProtocol.h"
@class HEROBaseCoordinator;
NS_ASSUME_NONNULL_BEGIN
@interface HEROBaseViewController : UIViewController <HEROViewControllerProtocol>
@end
NS_ASSUME_NONNULL_END
