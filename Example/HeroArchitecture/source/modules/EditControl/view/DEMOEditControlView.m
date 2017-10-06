//
//  DEMOEditControlView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditControlView.h"
#import "HEROViewFactory.h"

@interface DEMOEditControlView()
@property (nonatomic, strong) UICollectionView* collectionView;
@end
@implementation DEMOEditControlView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	[self setupViewPreserveContent:NO];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	[self.collectionView removeFromSuperview];
	if (preserveContent || self.collectionView == nil) {
		self.collectionView = [HEROViewFactory collectionView];
	}
	[self addSubview:self.collectionView];
}

@end
