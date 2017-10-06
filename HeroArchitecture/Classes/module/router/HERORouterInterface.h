@import Foundation;
@class HEROBaseCoordinator, HEROBaseRouter;

@protocol FMRouterInterface

@required
//lazy loading viewController+View
- (Class)viewControllerClass;
@end
