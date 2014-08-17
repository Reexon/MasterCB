//
//  MCBClipBoard.h
//  MasterCB
//
//  Created by Loris D'antonio on 17/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCBClipBoard : NSObject{
    NSPasteboard *_pasteBoard;
}
@property NSPasteboard *pasteBoard;

- (BOOL) writeToPasteBoard:(NSString *)stringToWrite;
- (void) addToPasteBoard:(NSString *)text withKey:(NSString *)key;
- (NSString *) readFromPasteBoard;
- (NSString *)getFromPasteBoard:(NSString *) keyCode;
- (void)listenForKey;
@end
