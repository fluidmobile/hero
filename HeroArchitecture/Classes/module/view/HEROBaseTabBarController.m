//
//  HEROBaseTabBarController.m
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import "HEROBaseTabBarController.h"
#import "HEROBaseCoordinator.h"

@interface HEROBaseTabBarController () <HEROBaseTabBarControllerDelegte>
@end

@implementation HEROBaseTabBarController
@synthesize coordinator;

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [[self.class description] stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    self.delegate = self;
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestContentUpdate];
}

- (void)requestContentUpdate{
    [self.coordinator requestContentUpdate];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [self.tabBarDelegate userDidSelectViewController:viewController];
}


@end
