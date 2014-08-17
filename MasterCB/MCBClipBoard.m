//
//  MCBClipBoard.m
//  MasterCB
//
//  Created by Loris D'antonio on 17/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "MCBClipBoard.h"

@implementation MCBClipBoard{
    NSInteger changeCount;
    NSMutableDictionary* clipBoardDict;
}

- (id)init
{
    self = [super init];
    if (self) {
        _pasteBoard = [NSPasteboard generalPasteboard];
        clipBoardDict = [NSMutableDictionary new];
    }
    return self;
}

- (BOOL)update {
    if ([_pasteBoard changeCount] != changeCount) {
        NSLog(@"Pasteboard has been updated!");
        changeCount = [_pasteBoard changeCount];
        NSLog(@"Count:%ld",(long)changeCount);
        return true;
    }
    return false;
}
- (BOOL) writeToPasteBoard:(NSString *)stringToWrite
{
    [_pasteBoard declareTypes:[NSArray arrayWithObject:NSPasteboardTypeString ] owner:nil];
    return [_pasteBoard setString:stringToWrite forType:NSPasteboardTypeString ];
}

- (NSString *) readFromPasteBoard
{
    return [_pasteBoard stringForType:NSStringPboardType];
}

-(void) addToPasteBoard:(NSString *)text withKey:(NSString *)keyCode{
    [clipBoardDict setObject:text forKey:keyCode];
    NSLog(@"Dict:%@",clipBoardDict);
}
-(NSString *)getFromPasteBoard:(NSString *)keyCode{
    return [clipBoardDict objectForKey:keyCode];
}

-(void)listenForKey {
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *event)
     {
         //NSUInteger key = 8; // 8 is C
         NSUInteger copy = NSCommandKeyMask | NSShiftKeyMask; //cmd + shift
         NSUInteger paste = NSCommandKeyMask | NSAlternateKeyMask; //cmd + alt
         
         //NSLog(@"Modifier:%lu - KeyCode:%hu",(unsigned long)[NSEvent modifierFlags],[event keyCode]);
         if ([NSEvent modifierFlags] == copy && [self update])
             [self addToPasteBoard:[_pasteBoard stringForType:NSPasteboardTypeString]
                           withKey:[NSString stringWithFormat:@"%hu",[event keyCode]]];
         else if([NSEvent modifierFlags] == paste){
             NSString *text = [self getFromPasteBoard:[NSString stringWithFormat:@"%hu",[event keyCode]]];
             NSLog(@"Caricato :%hu",[event keyCode]);
             [_pasteBoard clearContents];
             [_pasteBoard setString:text forType:NSStringPboardType];
         }
     }];
}
@end
