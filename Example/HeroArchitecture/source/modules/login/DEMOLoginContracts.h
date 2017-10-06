@class HEROBaseRouter;

@protocol DEMOLoginRouterInput <NSObject>
-(void)presentForLoggedIn;
@end

@protocol DEMOLoginRouterOutput <NSObject>
@end

@protocol DEMOLoginRouterWorkflowControl <NSObject>
-(void)loggedInOnRouter:(HEROBaseRouter*)router;
@end

@protocol DEMOLoginUsecaseInput <NSObject>
-(void)selectedLogin;
@end

@protocol DEMOLoginUsecaseOutput <NSObject>
-(void)loggedInSuccessful;
-(void)loggedInFailed;
-(void)loginInProgress:(BOOL)inProgress;
@end

@protocol DEMOLoginViewOutput <NSObject>
-(void)selectedLogin;
@end

@protocol DEMOLoginViewInput  <NSObject>
-(void)loggedInFailed;
-(void)loginInProgress:(BOOL)inProgress;
@end
