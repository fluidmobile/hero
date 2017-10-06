@protocol HEROBaseViewInterface <NSObject>
@required
- (void)setupViewPreserveContent:(BOOL)preserveContent;

@optional
- (void)updateSizeCategoryInView;
@end
