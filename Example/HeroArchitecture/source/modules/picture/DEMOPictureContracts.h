@class DEMOPicturePonso;
#pragma mark - Router
@protocol DEMOPictureRouterInput <NSObject>
@end

@protocol DEMOPictureRouterOutput <NSObject>
@end

@protocol DEMOPictureWorkflowInput <NSObject>
@end

#pragma mark - Usecase
@protocol DEMOPictureUsecaseInput <NSObject>
-(void)selectedImage;
@end

@protocol DEMOPictureUsecaseOutput <NSObject>
-(void)updatePicture:(DEMOPicturePonso*)picture;
@end

#pragma mark - View
@protocol DEMOPictureViewInput  <NSObject>
-(void)updatePicture:(DEMOPicturePonso*)picture;
@end

@protocol DEMOPictureViewOutput <NSObject>
-(void)selectedImage;
@end
