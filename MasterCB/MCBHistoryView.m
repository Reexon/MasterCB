//
//  MCBHistoryView.m
//  MasterCB
//
//  Created by Loris D'antonio on 18/08/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "MCBHistoryView.h"

@implementation MCBHistoryView{
        NSInteger changeCount;
        NSTimer *timer;
}

- (id)init
{
    self = [super init];
    if (self) {
        _historyClip = [NSMutableArray new];
        _clipBoard = [MCBClipBoard new];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(updateHistoryClip:)
                                               userInfo:nil
                                                repeats:YES];
        [_clipBoard listenForKey];
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [_historyClip count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return [_historyClip objectAtIndex:row];
}

- (void)updateHistoryClip:(NSTimer *)timer{
    if (changeCount != [_clipBoard.pasteBoard changeCount]){
        [_historyClip addObject:[_clipBoard.pasteBoard stringForType:NSPasteboardTypeString]];
        changeCount = [_clipBoard.pasteBoard changeCount];
        [self.historyTable reloadData];
        
    }
    
}
@end
