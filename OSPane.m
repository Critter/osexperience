#import "OSPane.h"
#import "missioncontrol/OSPaneThumbnail.h"
#import "missioncontrol/OSThumbnailView.h"



@implementation OSPane
@synthesize name = _name;
@synthesize thumbnail = _thumbnail;



-(id)initWithName:(NSString*)name thumbnail:(UIImage*)thumbnail{
	CGRect frame = [[UIScreen mainScreen] bounds];
	if(![self isPortrait]){
		float widthPlaceholder = frame.size.width;
		frame.size.width = frame.size.height;
		frame.size.height = widthPlaceholder;
	}


	if(![super initWithFrame:frame]){
		return nil;
	}

	self.name = name;
	self.thumbnail = thumbnail;

	self.layer.masksToBounds = false;
	self.layer.shadowOffset = CGSizeMake(0, 0);
	self.layer.shadowRadius = 10;
	self.layer.shadowOpacity = 0.5;
	self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
	
	

	return self;

}

- (void)missionControlWillActivate{}
- (void)missionControlWillDeactivate{}
- (void)missionControlDidDeactivate{}
- (void)paneIndexWillChange{}
- (void)paneIndexDidChange{}

- (void)setName:(NSString*)name{
	_name = name;
	
	for(OSPaneThumbnail *thumbnail in [[[OSThumbnailView sharedInstance] wrapperView] subviews]){
		if(thumbnail.pane == self){
			thumbnail.label.text = self.name;
		}
	}
}

-(BOOL)showsDock{
	return false;
}

-(BOOL)isPortrait{
	if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown){
        return true;
    }
    return false;
}


@end