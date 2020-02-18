#include "BonziRootListController.h"
#import <Preferences/PSEditableTableCell.h>
NSString *stringpost;
UITextField* textField;
@implementation BonziRootListController

-(instancetype)init {
self = [super init];

if (self) {
HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
appearanceSettings.tintColor = [UIColor colorWithRed:0.55 green:0.28 blue:0.82 alpha:1.0];
appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
self.hb_appearanceSettings = appearanceSettings;
self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring"
style:UIBarButtonItemStylePlain
target:self
action:@selector(respring:)];
self.respringButton.tintColor = [UIColor colorWithRed:0.55 green:0.28 blue:0.82 alpha:1.0];
self.navigationItem.rightBarButtonItem = self.respringButton;




}

return self;
}

-(NSArray *)specifiers {
if (_specifiers == nil) {
_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
}

return _specifiers;
}


- (void)respring:(id)sender {
NSTask *t = [[[NSTask alloc] init] autorelease];
[t setLaunchPath:@"/usr/bin/killall"];
[t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
[t launch];
}

-(void)test{
NSString *path = @"/var/mobile/Documents/quotes.txt";
[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cleared"
message:@"file deleted"
delegate:self
cancelButtonTitle:@"OK"
otherButtonTitles:nil];


[alert show];
}

-(void)clearname{

CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)resetbonziname, nil, nil, true);

}

@end


@interface megacell : PSEditableTableCell
@end

@implementation megacell
-(id)initWithStyle:(long long)arg1 reuseIdentifier:(id)arg2 specifier:(id)arg3 {
self = [super initWithStyle:arg1 reuseIdentifier:arg2 specifier:arg3];
if (self) {
UITextField* textField = [self textField];
textField.textAlignment = NSTextAlignmentRight;
textField.delegate = self;



}
return self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
if (textField == self.text) {
[textField resignFirstResponder];
return NO;
}
return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField {


NSString *stringpost = textField.text;
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Added to file"
message:textField.text
delegate:self
cancelButtonTitle:@"OK"
otherButtonTitles:nil];
[alert show];




NSString *final = [NSString stringWithFormat:@"%@\r\n",textField.text];

NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:@"/var/mobile/Documents/quotes.txt"];
[fh seekToEndOfFile];
[fh writeData:[final dataUsingEncoding:NSUTF8StringEncoding]];
[fh closeFile];



textField.text = @"";




}

@end



