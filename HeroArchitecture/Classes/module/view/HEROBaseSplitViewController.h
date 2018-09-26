//
//  HEROBaseTabBarController.h
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import <UIKit/UIKit.h>
#import "HEROViewControllerProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@class HEROBaseCoordinator;
@interface HEROBaseSplitViewController : UISplitViewController <HEROViewControllerProtocol>
@end
NS_ASSUME_NONNULL_END
