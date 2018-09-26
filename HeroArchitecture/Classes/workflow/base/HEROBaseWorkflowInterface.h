@import UIKit;
#import "HEROBaseCoordinator.h"

@protocol HEROBaseWorkflowInterface <NSObject>
//never direct call this method!
- (HEROBaseCoordinator*)createInitialCoordinator;
@end
