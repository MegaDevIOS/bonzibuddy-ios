

//// Imports for tweak



#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIWindow+Private.h>
#import <WebKit/WebKit.h>
#define spawnsatan @"com.megadev.chargebyte/spawnsatanlol"
#define resetbonziname @"com.megadev.bonzibuddy/resetbonziname"
UIView *home = nil;
HBPreferences *pfs;
BOOL enabled = YES;
BOOL locked = YES;

NSString *text;

CGRect bonzipos;

@interface SBHomeScreenWindow 


@end



@interface SpringBoard 

@property(nonatomic, strong) UIView *view;

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) UIPanGestureRecognizer *pan1;
@property(nonatomic, strong) UIWebView *tapscreen;
@property(nonatomic, strong) UIImageView* animatedImageView;
@property(nonatomic, strong) AVSpeechUtterance *utterance;

@property(nonatomic, strong) AVSpeechSynthesizer *syn;
@property (nonatomic) NSUInteger numberOfTouchesRequired;

- (void)handleSingleTap: (UITapGestureRecognizer *)singleTapGestureRecognizer;

@end


@interface SBIconImageView : UIView

@property (nonatomic, copy, readwrite) UIImage *displayedimage;
@end
