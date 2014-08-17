//
//  MCBAppDelegate.m
//  MasterCB
//
//  Created by Loris D'antonio on 16/08/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MCBAppDelegate.h"

@implementation MCBAppDelegate{
    MCBClipBoard *clipBoard;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // 1. Create the master View Controller
    self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.settingsViewController.view];
    self.settingsViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    clipBoard = [MCBClipBoard new];
    [clipBoard listenForKey];
    
}


@end
