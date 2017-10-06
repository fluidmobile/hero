@class HEROBaseViewController, HEROBaseRouter;
#pragma mark - Router
@protocol DEMOContainerRouterInput <NSObject>
@end

@protocol DEMOContainerRouterOutput <NSObject>
@end

@protocol DEMOContainerRouterWorkflowControl <NSObject>
@end

#pragma mark - Usecase
@protocol DEMOContainerUsecaseInput <NSObject>
@end

@protocol DEMOContainerUsecaseOutput <NSObject>
@end

#pragma mark - View
@protocol DEMOContainerViewInput  <NSObject>
-(void)updateMasterViewController:(HEROBaseViewController*)viewController;
-(void)updateDetailViewController:(HEROBaseViewController*)viewController;
@end

@protocol DEMOContainerViewOutput <NSObject>
@end
