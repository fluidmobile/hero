//
//  HEROBaseView.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 23/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HEROBaseViewInterface.h"
NS_ASSUME_NONNULL_BEGIN
@interface HEROBaseView : UIView <HEROBaseViewInterface>
-(void)updateSizeClass:(UIUserInterfaceSizeClass)sizeClass;
@end
NS_ASSUME_NONNULL_END
