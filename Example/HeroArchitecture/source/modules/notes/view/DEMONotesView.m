//
//  DEMONotesView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONotesView.h"
#import "HEROViewFactory.h"
#import "DEMOExplanationView.h"
#import "DEMOConstants.h"
#import "UIView+Frame.h"

@interface DEMONotesView ()
@property (nonatomic, strong) DEMOExplanationView* explanationView;
@end

@implementation DEMONotesView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	_tableView = [UITableView new];
	[self addSubview:self.tableView];
	
	_explanationView = [DEMOExplanationView new];
	[self.explanationView updateTitle:[NSString stringWithFormat:@"%@Controller",[self class]] subtitle:@"<description>"];
	[self addSubview:self.explanationView];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
	CGSize sizeExplanationView = [self.explanationView sizeThatFits:self.bounds.size];
	self.explanationView.frame = (CGRect){(self.bounds.size.width - sizeExplanationView.width)/2,LAYOUT_BORDER_DEFAULT,sizeExplanationView};
	self.tableView.frame = (CGRect){0,[self.explanationView pointRightBottom].y + LAYOUT_BORDER_DEFAULT,self.bounds.size.width,self.bounds.size.height - [self.explanationView pointRightBottom].y - LAYOUT_BORDER_DEFAULT};
}

@end
