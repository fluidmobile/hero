//
//  HeroViewControllerProtocol.h
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import <Foundation/Foundation.h>
@class HEROBaseCoordinator;
@protocol HEROViewControllerProtocol <NSObject>
@property (nonatomic, strong) HEROBaseCoordinator* coordinator;
- (void)requestContentUpdate;
@end
