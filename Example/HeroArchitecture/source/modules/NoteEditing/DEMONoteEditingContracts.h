@class HEROBaseRouter, DEMONoteEditPonso;
#pragma mark - Router
@protocol DEMONoteEditingRouterInput <NSObject>
-(void)didFinishEditing;
@end

@protocol DEMONoteEditingRouterOutput <NSObject>
-(void)updateNoteID:(NSString*)noteID;
@end

@protocol DEMONoteEditingRouterWorkflowControl <NSObject>
-(void)noteEditingDidFinishEditingOnRouter:(HEROBaseRouter*)router;
@end

#pragma mark - Usecase
@protocol DEMONoteEditingUsecaseInput <NSObject>
-(void)updateNoteID:(NSString*)noteID;
-(void)discardChanges;
-(void)modifyTitle:(NSString*)title note:(NSString*)note;
@end

@protocol DEMONoteEditingUsecaseOutput <NSObject>
-(void)didFinishEditing;
-(void)updateNote:(DEMONoteEditPonso*)note;
@end

#pragma mark - View
@protocol DEMONoteEditingViewInput  <NSObject>
-(void)updateNote:(DEMONoteEditPonso*)note;
@end

@protocol DEMONoteEditingViewOutput <NSObject>
-(void)discardChanges;
-(void)modifyTitle:(NSString*)title note:(NSString*)note;
@end
