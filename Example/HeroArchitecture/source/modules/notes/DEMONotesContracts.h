@class HEROBaseRouter,DEMONotePonso;

@protocol DEMONotesRouterInput <NSObject>
@end

@protocol DEMONotesRouterOutput <NSObject>
@end

@protocol DEMONotesRouterWorkflowControl <NSObject>
@end

@protocol DEMONotesUsecaseOutput <NSObject>
-(void)updateWithNotes:(NSArray <DEMONotePonso*>*)notes;
@end

@protocol DEMONotesUsecaseInput <NSObject>
-(void)createNewNoteWithTitle:(NSString*)title text:(NSString*)text;
@end

@protocol DEMONotesViewOutput <NSObject>
-(void)createNewNoteWithTitle:(NSString*)title text:(NSString*)text;
@end

@protocol DEMONotesViewInput <NSObject>
-(void)updateWithNotes:(NSArray <DEMONotePonso*>*)notes;
@end
