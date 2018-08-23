//
//  HEROBaseTabBarController.m
//  HeroArchitecture
//
//  Created by Moritz Ellerbrock on 12.07.18.
//

#import "HEROBaseSplitViewController.h"
#import "HEROBaseCoordinator.h"

@interface HEROBaseSplitViewController ()
@end

@implementation HEROBaseSplitViewController
@synthesize coordinator;

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [[self.class description] stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestContentUpdate];
}

- (void)requestContentUpdate{
    [self.coordinator requestContentUpdate];
}

@end
