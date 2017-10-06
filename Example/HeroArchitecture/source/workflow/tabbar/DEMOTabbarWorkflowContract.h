#import "DEMOMainContracts.h"
#import "DEMOMainWorkflowContract.h"

@protocol DEMOTabbarParentWorkflowInput <NSObject>
-(void)tabbarLoggedOutOnRouter:(HEROBaseRouter*)router;
-(void)tabbarLoggedInOnRouter:(HEROBaseRouter*)router;
@end
