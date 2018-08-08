//
//  HEROBaseTabBarController.h
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import <UIKit/UIKit.h>
#import "HEROViewControllerProtocol.h"

@protocol HEROBaseTabBarControllerDelegte <NSObject>
- (void)userDidSelectViewController:(UIViewController *)viewController;
@end

@class HEROBaseCoordinator;
@interface HEROBaseTabBarController : UITabBarController <HEROViewControllerProtocol>
@property (nonatomic, weak) id<HEROBaseTabBarControllerDelegte> tabBarDelegate;
@end
