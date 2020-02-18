
#import "bonzi.h"




///Name handler Notification called from preferences

void reset() {

[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"bonziname"];
[[NSUserDefaults standardUserDefaults] synchronize];

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"what is your name?"];
AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
utterance.rate=0.7;
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
utterance.pitchMultiplier=10;
[utterance setRate:0.38];

[syn speakUtterance:utterance]; });
UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"BonziBuddy"
message: @"What is your name?"
preferredStyle:UIAlertControllerStyleAlert];
[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
textField.placeholder = @"name";
textField.textColor = [UIColor whiteColor];
textField.clearButtonMode = UITextFieldViewModeWhileEditing;
textField.borderStyle = UITextBorderStyleRoundedRect;
}];

[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
NSArray * textfields = alertController.textFields;
UITextField * namefield = textfields[0];



NSString *valueToSave = namefield.text;
[[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"bonziname"];
[[NSUserDefaults standardUserDefaults] synchronize];



NSString *savedValue = [[NSUserDefaults standardUserDefaults]
stringForKey:@"bonziname"];
NSString *string2 = @"Ok, ";
string2 = [string2 stringByAppendingString:savedValue];
AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string2];

AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
utterance.rate=0.7;
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];

utterance.pitchMultiplier=10;
[utterance setRate:0.38];

[syn speakUtterance:utterance];



}]];

[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];





}










///Group tweak to disable / enable 


%group bonzibuddy





%hook SBHomeScreenViewController

//// Spawn Bonzi (aka satan)
-(void)loadView{
%orig;
[[NSNotificationCenter defaultCenter] postNotificationName:spawnsatan object:nil userInfo:nil];
}

%end



%hook SpringBoard

%property(nonatomic, strong) UIImageView* animatedImageView;
%property(nonatomic, strong) UIWindow *window;

-(void)applicationDidFinishLaunching:(id)application {
%orig;

///Introduce bonzi after respring
AVSpeechUtterance *butterance = [AVSpeechUtterance speechUtteranceWithString:@"i am bonzi buddy."];
AVSpeechSynthesizer *bsyn = [[AVSpeechSynthesizer alloc] init];
butterance.rate=0.7;
butterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
butterance.pitchMultiplier=10;
[butterance setRate:0.38];
[bsyn speakUtterance:butterance];



///Check if bonzi knows your name
NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
if(![[[defaults dictionaryRepresentation] allKeys] containsObject:@"bonziname"]){
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"what is your name?"];
AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
utterance.rate=0.7;
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
utterance.pitchMultiplier=10;
[utterance setRate:0.38];
[syn speakUtterance:utterance]; });
UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"BonziBuddy"
message: @"What is your name?"
preferredStyle:UIAlertControllerStyleAlert];
[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
textField.placeholder = @"name";
textField.textColor = [UIColor whiteColor];
textField.clearButtonMode = UITextFieldViewModeWhileEditing;
textField.borderStyle = UITextBorderStyleRoundedRect;
}];


[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
NSArray * textfields = alertController.textFields;
UITextField * namefield = textfields[0];
NSString *valueToSave = namefield.text;
[[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"bonziname"];
[[NSUserDefaults standardUserDefaults] synchronize];
NSString *savedValue = [[NSUserDefaults standardUserDefaults]
stringForKey:@"bonziname"];
NSString *string2 = @"Ok, ";
string2 = [string2 stringByAppendingString:savedValue];
AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string2];
AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
utterance.rate=0.7;
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
utterance.pitchMultiplier=10;
[utterance setRate:0.38];

[syn speakUtterance:utterance];

}]];

[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];

}




///Give bonzi a spawnpoint
CGRect bonzipos = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);












///Create a window for bonzi so he can stalk you everywhere you go :)

UIWindow *window = [[UIWindow alloc] initWithFrame:bonzipos];

window.windowLevel = UIWindowLevelStatusBar + 100; ///make sure Bonzi is a demigod
self.window = window;
window.backgroundColor = [UIColor clearColor];
[window makeKeyAndVisible];

/// bonzi animation ( i know this is a bad way of doing it but i didnt feel like spawning a webview instead )

self.animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100.0f, 100.0f)];
self.animatedImageView.animationImages = [NSArray arrayWithObjects:    
[UIImage imageNamed:@"/Library/Application Support/frame_00_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_01_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_02_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_03_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_04_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_05_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_06_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_07_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_08_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_09_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_10_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_11_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_12_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_13_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_14_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_15_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_16_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_17_delay-0.2s.gif"],
[UIImage imageNamed:@"/Library/Application Support/frame_18_delay-0.2s.gif"], nil];
self.animatedImageView.animationDuration = 3.0f;
self.animatedImageView.animationRepeatCount = 0;
[self.animatedImageView startAnimating];
self.animatedImageView.layer.zPosition = 0.5;



///Make window visible even when biometrics are locked
[window _setSecure: YES];
[window addSubview:self.animatedImageView];

//// Add dragging gesture
UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveObject:)];
pan1.minimumNumberOfTouches = 1;
[window addGestureRecognizer:pan1];



/// Bonzi talking timer
[NSTimer scheduledTimerWithTimeInterval:50.0
target:self
selector:@selector(speak:)
userInfo:nil
repeats:YES];







}


%new
//// Move handler
-(void)moveObject:(UIPanGestureRecognizer *)pan
{
CGPoint translation = [pan translationInView:self.window];
pan.view.center = CGPointMake(pan.view.center.x + translation.x,
pan.view.center.y + translation.y);
[pan setTranslation:CGPointZero inView:self.window];
}


%new

/// Bonzi talks
-(void)speak:(NSTimer *)timer{

if(locked==NO){
if (![[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Documents/quotes.txt"]){
NSString *yeet = [NSString stringWithContentsOfFile:@"/Library/Application Support/quotes.txt"
encoding:NSUTF8StringEncoding error:nil];
[[NSFileManager defaultManager] createFileAtPath:@"/var/mobile/Documents/quotes.txt" contents:nil attributes:nil];
[yeet writeToFile:@"var/mobile/Documents/quotes.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
}else{

NSError *error = nil;
NSString *sourceString = [NSString stringWithContentsOfFile:@"/var/mobile/Documents/quotes.txt"
encoding:NSUTF8StringEncoding error:&error];
NSArray *lines = [sourceString componentsSeparatedByCharactersInSet:
[NSCharacterSet newlineCharacterSet]];


NSInteger length = [[sourceString componentsSeparatedByCharactersInSet:
[NSCharacterSet newlineCharacterSet]] count];


int lowerBound = 0;
int upperBound = (int) length - 1;
int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);

NSString *relevantLine = [lines objectAtIndex:rndValue];

NSString *savedValue = [[NSUserDefaults standardUserDefaults]
stringForKey:@"bonziname"];

NSDate *date = [NSDate date];
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"yyyy-MM-dd"];
NSString *timeString = [formatter stringFromDate:date];


NSDate *date2 = [NSDate date];
NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
[formatter2 setDateFormat:@"hh:mm"];
NSString *timeString2 = [formatter2 stringFromDate:date2];



UIDevice *myDevice = [UIDevice currentDevice];    
[myDevice setBatteryMonitoringEnabled:YES];

double batLeft = (float)[myDevice batteryLevel] * 100;
NSLog(@"%.f", batLeft);    

NSString * levelLabel = [NSString stringWithFormat:@"%.f%%", batLeft];    

///Create variables for %name% etc

relevantLine = [relevantLine stringByReplacingOccurrencesOfString:@"%name%"
withString:savedValue];

relevantLine = [relevantLine stringByReplacingOccurrencesOfString:@"%time%"
withString:timeString2];

relevantLine = [relevantLine stringByReplacingOccurrencesOfString:@"%date%"
withString:timeString];

relevantLine = [relevantLine stringByReplacingOccurrencesOfString:@"%battery%"
withString:levelLabel];



AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:relevantLine];
AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
utterance.rate=0.7;
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
utterance.pitchMultiplier=10;
[utterance setRate:0.38];

[syn speakUtterance:utterance];

}
}

}




%end


///Mask random icons with bananas

%hook SBIconImageView
BOOL donedid = NO;
UIView *yeet;
-(void)layoutSubviews{

%orig;

int lowerBound = 0;
int upperBound = 60;
int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);

if(rndValue > 30){  

yeet = (UIView *)self;

}    }   



-(id)initWithFrame:(CGRect)arg1{

[NSTimer scheduledTimerWithTimeInterval:100.0
target:self
selector:@selector(idkfam:)
userInfo:nil
repeats:YES];



return %orig;

} 


%new
-(void)idkfam:(NSTimer *)timer{




CALayer *mask = [CALayer layer];
mask.contents = (id)[[UIImage imageWithContentsOfFile:@"/Library/Application Support/wth.png"] CGImage];
mask.frame = CGRectMake(0, 0, yeet.frame.size.width, yeet.frame.size.height);
yeet.layer.mask = mask;
yeet.layer.masksToBounds = YES;



}
%end


//// Detect lockstate

%hook SBDashBoardBiometricUnlockController
- (void)setAuthenticated:(BOOL)authenticated {

%orig;

if(authenticated) {

locked=NO;

}else{
locked=YES;

}
}


%end
%end



////Load in preffs
%ctor {
pfs = [[HBPreferences alloc] initWithIdentifier:@"com.megadev.Bonzipref"];




[pfs registerBool:&enabled default:YES forKey:@"enabled"];


////Start bonzi tweak

if(enabled){
%init(bonzibuddy);

}



///Reset your name
CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
NULL,
(CFNotificationCallback)reset,
(CFStringRef)resetbonziname,
NULL,
(CFNotificationSuspensionBehavior) kNilOptions);

}



