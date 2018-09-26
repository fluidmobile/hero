@import Foundation;
@protocol HEROBaseRouterInterface
@required
//lazy loading viewController+View
- (nonnull Class)viewControllerClass;
@end
