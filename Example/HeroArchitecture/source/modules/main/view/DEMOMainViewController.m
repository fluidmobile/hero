//
//  DEMOMainViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOMainViewController.h"
#import "DEMOMainView.h"

@interface DEMOMainViewController () <DEMOMainViewDelegate>
@property (nonatomic, strong) DEMOMainView* viewMain;
@property (nonatomic, strong) UIViewController* viewControllerDetail;
@end

@implementation DEMOMainViewController

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	self.title = @"Main";
	self.tabBarItem.image = [UIImage imageNamed:@"settings"];
	return self;
}


- (void)loadView{
    self.viewMain = [DEMOMainView new];
    self.view = self.viewMain;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewMain.delegate = self;
}

#pragma mark - DEMOMainViewInput
-(void)updateIsLoggedIn:(BOOL)isLoggedIn{
    [self.viewMain updateIsLoggedIn:isLoggedIn];
}

#pragma mark - DEMOMainViewDelegate
-(void)didSelectButton:(int)button{
    [(id<DEMOMainViewOutput>)self.coordinator selectedButtonIndex:button];
}

- (void)selectedSegmentAtIndex:(int)index{
	[(id<DEMOMainViewOutput>)self.coordinator selectedSegmentAtIndex:index];
}

#pragma mark - Public
-(UIView*)detailView{
    return self.viewMain.detailView;
}


-(void)setDetailViewController:(UIViewController*)detailViewController{
    if (self.viewControllerDetail){
        [self.viewControllerDetail removeFromParentViewController];
        self.viewControllerDetail = nil;
    }
    
    self.viewControllerDetail = detailViewController;
    [self addChildViewController:self.viewControllerDetail];
    [self.viewControllerDetail didMoveToParentViewController:self];
    
    [self.viewMain setDetailView:self.viewControllerDetail.view];
}

@end
