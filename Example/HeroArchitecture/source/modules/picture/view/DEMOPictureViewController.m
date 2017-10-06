//
//  DEMOPictureViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPictureViewController.h"
#import "DEMOPictureView.h"

@interface DEMOPictureViewController () <DEMOPictureViewDelegate>
@property (nonatomic, strong) DEMOPictureView* viewPicture;
@end

@implementation DEMOPictureViewController

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	
	return self;
}


- (void)loadView{
    self.viewPicture = [DEMOPictureView new];
    self.view = self.viewPicture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewPicture.delegate = self;
}

#pragma mark - DEMOPictureViewInput

-(void)updatePicture:(DEMOPicturePonso *)picture{
	[self.viewPicture updatePicture:picture];
}

#pragma mark - DEMOPictureViewDelegate

- (void)userDidSelectimage{
	[(id<DEMOPictureViewOutput>)self.coordinator selectedImage];
}

#pragma mark - Public

@end
