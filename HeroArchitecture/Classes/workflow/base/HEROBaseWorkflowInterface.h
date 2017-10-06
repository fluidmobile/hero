@import UIKit;
#import "HEROBaseCoordinator.h"

@protocol HEROBaseWorkflowInterface <NSObject>
//never call this method!
- (HEROBaseCoordinator*)createInitialCoordinator;
@end
