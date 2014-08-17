//
//  SettingsViewController.h
//  MasterCB
//
//  Created by Loris D'antonio on 16/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCBClipBoard.h"

@interface SettingsViewController : NSViewController
- (void)copy:(int)key;
- (void)paste:(int)key;
@end
