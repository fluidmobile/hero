#import "DEMOEditingMode.h"
@class HEROBaseRouter,DEMOEditingPonso;
#pragma mark - Router
@protocol DEMOEditControlRouterInput <NSObject>
-(void)switchedToEditingMode:(DEMOEditingMode)editingMode;
@end

@protocol DEMOEditControlRouterOutput <NSObject>
@end

@protocol DEMOEditControlWorkflowInput <NSObject>
-(void)editControlSwitchedToEditingMode:(DEMOEditingMode)editingMode onRouter:(HEROBaseRouter*)router;
@end

#pragma mark - Usecase
@protocol DEMOEditControlUsecaseInput <NSObject>
-(long)numberOfSections;
-(long)numberOfItemsInSection:(long)section;
-(DEMOEditingPonso*)editingItemForIndex:(long)index;
-(void)selectedEditingItemAtIndex:(long)index;
@end

@protocol DEMOEditControlUsecaseOutput <NSObject>
-(void)requestViewUpdate;
-(void)switchedToEditingMode:(DEMOEditingMode)editingMode;
@end

#pragma mark - View
@protocol DEMOEditControlViewInput  <NSObject>
-(void)requestViewUpdate;
@end

@protocol DEMOEditControlViewOutput <NSObject>
-(long)numberOfSections;
-(long)numberOfItemsInSection:(long)section;
-(DEMOEditingPonso*)editingItemForIndex:(long)index;
-(void)selectedEditingItemAtIndex:(long)index;
@end
