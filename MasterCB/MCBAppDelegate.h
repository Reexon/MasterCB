//
//  MCBAppDelegate.h
//  MasterCB
//
//  Created by Loris D'antonio on 16/08/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SettingsViewController.h"
#import "MCBClipBoard.h"

@interface MCBAppDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic,strong) IBOutlet SettingsViewController *settingsViewController;
@property (assign) IBOutlet NSWindow *window;
@end
