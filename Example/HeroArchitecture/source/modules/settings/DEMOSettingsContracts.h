@class HEROBaseRouter;
@protocol DEMOSettingsRouterInput <NSObject>
-(void)isLoggedOut;
-(void)dismiss;
@end

@protocol DEMOSettingsRouterOutput <NSObject>
@end


@protocol DEMOSettingsWorkflowControl <NSObject>
-(void)loggedOutOnRouter:(HEROBaseRouter*)router;
-(void)dismissOnRouter:(HEROBaseRouter*)router;
@end

@protocol DEMOSettingsUsecaseOutput <NSObject>
-(void)isLoggedOut;
@end

@protocol DEMOSettingsUsecaseInput <NSObject>
- (void)logout;
@end


@protocol DEMOSettingsViewOutput <NSObject>
- (void)userDidSelectlogout;
@end

@protocol DEMOSettingsViewInput <NSObject>

@end
