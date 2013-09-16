#import "OSAddDesktopButton.h"



@implementation OSAddDesktopButton
@synthesize wallpaper = _wallpaper;
@synthesize plusIcon = _plusIcon;

- (id)init{

	CGRect frame = CGRectZero;
	frame = [[UIScreen mainScreen] bounds];

 	frame.origin.x = frame.size.width;

	if(!UIInterfaceOrientationIsPortrait([UIApp statusBarOrientation])){
		float width = frame.size.width;
		frame.size.width = frame.size.height;
		frame.size.height = width;
		frame.origin.x = frame.size.height;
	}

	frame = CGRectApplyAffineTransform(frame, CGAffineTransformScale(CGAffineTransformIdentity, 0.15, 0.15));


	if(![super initWithFrame:frame])
		return nil;

	self.alpha = 0.75;

	//self.backgroundColor = [UIColor greenColor];
	self.clipsToBounds = false;
	self.layer.shadowOffset = CGSizeMake(0, 0);
	self.layer.shadowRadius = 5;
	self.layer.shadowOpacity = 0.5;
	self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;


	self.wallpaper = [[objc_getClass("SBWallpaperView") alloc] initWithOrientation:[[UIApplication sharedApplication] statusBarOrientation] variant:1];
	self.wallpaper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.wallpaper.clipsToBounds = true;

	self.wallpaper.frame = self.frame;
	frame = self.wallpaper.frame;
	frame.origin = CGPointZero;
	[self.wallpaper setFrame:frame];
	
	self.wallpaper.contentMode = UIViewContentModeScaleAspectFill;
	[self.wallpaper setGradientAlpha:0.0];
	[self addSubview:self.wallpaper];



	frame = self.frame;
	frame.size.width = frame.size.width / 2;
	frame.origin = CGPointZero;

	self.plusIcon = [[UIImageView alloc] initWithFrame:frame];

	self.plusIcon.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/OS Experience/expose-plus.png"];
	self.plusIcon.contentMode = UIViewContentModeCenter;

	self.plusIcon.layer.shadowOffset = CGSizeMake(0, 0);
	self.plusIcon.layer.shadowRadius = 0;
	self.plusIcon.layer.shadowOpacity = 0.5;
	self.plusIcon.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.plusIcon.bounds].CGPath;

	[self addSubview:self.plusIcon];

	return self;
}

- (void)layoutSubviews{
	self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;

	CGRect frame = CGRectZero;
	self.wallpaper.frame = self.frame;
	frame = self.wallpaper.frame;
	frame.origin = CGPointZero;
	[self.wallpaper setFrame:frame];


	frame = self.frame;
	frame.size.width = frame.size.width / 2;
	frame.origin = CGPointZero;
	self.plusIcon.frame = frame;
	self.plusIcon.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.plusIcon.bounds].CGPath;
}

- (void)dealloc{
	[self.wallpaper release];
	[super dealloc];
}

@end