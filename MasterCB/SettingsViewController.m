//
//  SettingsViewController.m
//  MasterCB
//
//  Created by Loris D'antonio on 16/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController (){
    //MCBClipBoard* CB;
}

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //CB = [MCBClipBoard new];
    }
    return self;
}

/*- (void)copy:(int)key {
    NSString *text = @"LOOOOL";
    [CB addToPasteBoard:text withKey:[NSString stringWithFormat:@"%d",key]];
}

- (void)paste:(int)key {
    
    NSLog(@"Testo Incollato:%@",[CB getFromPasteBoard:[NSString stringWithFormat:@"%d",key]]);
}*/
@end
