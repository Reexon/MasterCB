//
//  MCBClipBoard.h
//  MasterCB
//
//  Created by Loris D'antonio on 17/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCBClipBoard : NSObject

@property NSPasteboard *pasteBoard;

- (BOOL) writeToPasteBoard:(NSString *)stringToWrite;
- (void) addToClipDict:(NSString *)text withKey:(NSString *)key;
- (NSString *) readFromPasteBoard;
- (NSString *) getFromClipDict:(NSString *) keyCode;
- (void) listenForKey;

@end
