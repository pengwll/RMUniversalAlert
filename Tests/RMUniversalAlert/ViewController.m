//
//  ViewController.m
//  UniversalAlert
//
//  Created by Ryan Maxwell on 19/11/14.
//  Copyright (c) 2014 Ryan Maxwell. All rights reserved.
//

#import "ViewController.h"
#import "RMUniversalAlert.h"

typedef NS_ENUM(NSInteger, PresentationMode) {
    PresentationModeAlert = 0,
    PresentationModeActionSheet
};

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (assign, nonatomic) PresentationMode mode;

@property (strong, nonatomic) RMUniversalAlertCompletionBlock tapBlock;

@property (strong, nonatomic) RMUniversalAlert *universalAlert;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.tapBlock = ^(RMUniversalAlert *alert, NSInteger buttonIndex){
            if (buttonIndex == alert.destructiveButtonIndex) {
                NSLog(@"Delete");
            } else if (buttonIndex == alert.cancelButtonIndex) {
                NSLog(@"Cancel");
            } else if (buttonIndex >= alert.firstOtherButtonIndex) {
                NSLog(@"Other %ld", (long)buttonIndex - alert.firstOtherButtonIndex + 1);
            }
        };
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didShake) name:@"UIWindowDidShake" object:nil];
    }
    return self;
}

- (IBAction)changeType:(UISegmentedControl *)sender
{
    self.mode = sender.selectedSegmentIndex;
}

- (IBAction)singleCancel:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:nil
                                                                     tapBlock:self.tapBlock];
            
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:nil
                                                                  otherButtonTitles:nil
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)singleDestructive:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:nil
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:nil
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:nil
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)singleOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@[@"Other"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:nil
                                                             destructiveButtonTitle:nil
                                                                  otherButtonTitles:@[@"Other"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)multipleOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:nil
                                                             destructiveButtonTitle:nil
                                                                  otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)cancelAndDestructive:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:nil
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:nil
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)cancelAndOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@[@"Other"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:nil
                                                                  otherButtonTitles:@[@"Other"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)cancelAndMultipleOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:nil
                                                                  otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)destructiveAndOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:@[@"Other"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:nil
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:@[@"Other"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)destructiveAndMultipleOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:nil
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)destructiveCancelAndOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:@[@"Other"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

- (IBAction)destructiveCancelAndMultipleOther:(id)sender
{
    switch (self.mode) {
        case PresentationModeAlert: {
            self.universalAlert = [RMUniversalAlert showAlertInViewController:self
                                                                    withTitle:@"Title"
                                                                      message:@"Message"
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:@"Delete"
                                                            otherButtonTitles:@[@"Other 1", @"Other 2"]
                                                                     tapBlock:self.tapBlock];
            break;
        }
        case PresentationModeActionSheet: {
            self.universalAlert = [RMUniversalAlert showActionSheetInViewController:self
                                                                          withTitle:@"Title"
                                                                            message:@"Message"
                                                                  cancelButtonTitle:@"Cancel"
                                                             destructiveButtonTitle:@"Delete"
                                                                  otherButtonTitles:@[@"Other"]
                                                                           tapBlock:self.tapBlock];
            
            break;
        }
    }
}

#pragma mark -

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        [self alertStatus];
    }
}

- (void)didShake
{
    [self alertStatus];
}

- (void)alertStatus
{
    if (self.universalAlert == nil) {
        NSLog(@"Alert is nil.");
        return;
    }
    NSLog(@"Alert status\nvisible = %zd;", self.universalAlert.visible);
}

@end

@implementation UIWindow (Shake)

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UIWindowDidShake" object:nil userInfo:nil];
    }
}

@end
