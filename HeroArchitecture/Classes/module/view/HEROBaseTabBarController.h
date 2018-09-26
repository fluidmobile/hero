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
@interface HEROBaseTabBarController : UITabBarController <HEROViewControllerProtocol>
@end
NS_ASSUME_NONNULL_END
