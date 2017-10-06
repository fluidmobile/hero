@import Foundation;
#import "DEMOMainSelection.h"
@class HEROBaseRouter, UIViewController;

@protocol DEMOMainRouterInput <NSObject>
-(void)selectedSelection:(DEMOMainSelection)selection;
@end

@protocol DEMOMainRouterOutput <NSObject>
@end

@protocol DEMOMainRouterWorkflowControl <NSObject>
-(void)selectedSelection:(DEMOMainSelection)selection onRouter:(HEROBaseRouter*)router;
@end

@protocol DEMOMainUsecaseOutput <NSObject>
-(void)updateIsLoggedIn:(BOOL)isLoggedIn;
-(void)selectedSelection:(DEMOMainSelection)selection;
@end

@protocol DEMOMainUsecaseInput <NSObject>
-(void)selectedSegmentAtIndex:(int)index;
-(void)selectedButtonIndex:(int)index;
@end

@protocol DEMOMainViewOutput <NSObject>
-(void)selectedButtonIndex:(int)index;
-(void)selectedSegmentAtIndex:(int)index;
@end

@protocol DEMOMainViewInput  <NSObject>
-(void)updateIsLoggedIn:(BOOL)isLoggedIn;
-(void)setDetailViewController:(UIViewController*)detailViewController; //used by router
@end
