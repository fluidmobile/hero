//
//  HEROBaseTabBarController.h
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import <UIKit/UIKit.h>
#import "HEROViewControllerProtocol.h"

@class HEROBaseCoordinator;
@interface HEROBaseSplitViewController : UISplitViewController <HEROViewControllerProtocol>
@end
