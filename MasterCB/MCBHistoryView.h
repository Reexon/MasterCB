//
//  MCBHistoryView.h
//  MasterCB
//
//  Created by Loris D'antonio on 18/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCBClipBoard.h"

@interface MCBHistoryView : NSObject <NSTableViewDataSource>{
    NSMutableArray *_historyClip;
    MCBClipBoard *_clipBoard;
}

@property IBOutlet NSTableView *historyTable;
@property NSMutableArray *historyClip;
@property MCBClipBoard *clipBoard;

@end
