//
//  DEMONoteEditingView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingView.h"
#import "HEROViewFactory.h"
#import "UIView+Frame.h"
#import "DEMONoteEditPonso.h"

@interface DEMONoteEditingView() <UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, strong) UIView* viewWrapper;
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UITextField* textFieldTitle;
@property (nonatomic, strong) UILabel* labelText;
@property (nonatomic, strong) UITextView* textViewText;
@property (nonatomic, weak) DEMONoteEditPonso* note;
@end

@implementation DEMONoteEditingView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	[self setupViewPreserveContent:NO];
    return self;
}

#define LAYOUT_TEXTFIELD_HEIGHT 44.0f
#define LAYOUT_BORDER 10.0f

- (void)layoutSubviews{
    [super layoutSubviews];
	
	CGSize usabelSize = self.viewWrapper.bounds.size;
	CGSize sizeTitleLabel = [self.labelTitle sizeThatFits:usabelSize];
	CGSize sizeTextField = (CGSize){usabelSize.width,LAYOUT_TEXTFIELD_HEIGHT};
	CGSize sizeTextLabel = [self.labelText sizeThatFits:usabelSize];
	CGSize sizeTextView = (CGSize){usabelSize.width,LAYOUT_TEXTFIELD_HEIGHT * 4};
	float widthTotal = fmaxf(sizeTitleLabel.width, fmaxf(sizeTextField.width, fmaxf(sizeTextLabel.width, sizeTextView.width)));
	float heightTotal = sizeTitleLabel.height + LAYOUT_BORDER + sizeTextField.height + LAYOUT_BORDER + sizeTextLabel.height + LAYOUT_BORDER + sizeTextView.height;
	CGSize sizeTotal = (CGSize){widthTotal, heightTotal};
	self.viewWrapper.frame = (CGRect){(self.bounds.size.width - sizeTotal.width)/2,(self.bounds.size.height - sizeTotal.height)/2,sizeTotal};
	
	self.labelTitle.frame = (CGRect){0,0,sizeTitleLabel};
	self.textFieldTitle.frame = (CGRect){0,[self.labelTitle pointRightBottom].y + LAYOUT_BORDER,sizeTextField};

	self.labelText.frame = (CGRect){0,[self.textFieldTitle pointRightBottom].y + LAYOUT_BORDER,sizeTextLabel};
	self.textViewText.frame = (CGRect){0,[self.labelText pointRightBottom].y + LAYOUT_BORDER,sizeTextView};
}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	NSString* titleLabel = @"";
	NSString* textLabel = @"";
	NSString* titletextField = @"";
	NSString* textTextView = @"";
	
	if (preserveContent) {
		titleLabel = self.labelTitle.text;
		textLabel = self.labelText.text;
		titletextField = self.textFieldTitle.text;
		textTextView = self.textViewText.text;
	}
	
	[self.viewWrapper removeFromSuperview];
	self.viewWrapper = [UIView new];
	[self addSubview:self.viewWrapper];
	
	[self.labelTitle removeFromSuperview];
	self.labelTitle = [HEROViewFactory labelWithText:titleLabel];
	[self.viewWrapper addSubview:self.labelTitle];
	
	[self.textFieldTitle removeFromSuperview];
	self.textFieldTitle = [HEROViewFactory textFieldWithText:titletextField];
	self.textFieldTitle.delegate = self;
	[self.viewWrapper addSubview:self.textFieldTitle];
	
	[self.labelText removeFromSuperview];
	self.labelText = [HEROViewFactory labelWithText:textLabel];
	[self.viewWrapper addSubview:self.labelText];
	
	[self.textViewText removeFromSuperview];
	self.textViewText = [HEROViewFactory textViewWithText:textTextView];
	self.textViewText.delegate = self;
	[self.viewWrapper addSubview:self.textViewText];
}

-(void)updateNote:(DEMONoteEditPonso*)note{
	self.note = note;
	self.labelTitle.text = @"Title";
	self.textFieldTitle.text = self.note.title;
	self.labelText.text = @"Text";
	self.textFieldTitle.text = self.note.text;
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
	
}

@end
